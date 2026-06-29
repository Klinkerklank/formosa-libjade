#!/usr/bin/env python3
"""Backend-agnostic KAT runner.

Loads _build/<backend>_<scheme>.so (built by `make libs`) and replays the KAT
vectors through the common derand ABI (adapters/common_abi.h): kem_* for ML-KEM,
sig_* for ML-DSA. Same JSON schema as src/tests; selects the library by backend.

Usage:
    python3 kat.py --backend jasmin vectors/*.json
    python3 kat.py --backend mlkem-native --lib-dir _build vectors/mlkem768.json
"""

import argparse
import ctypes
import hashlib
import json
import sys
from ctypes import c_int, c_uint64, c_void_p
from pathlib import Path


def _mldsa(base, vk, sk, sig):
    return {"kind": "mldsa", "base": base,
            "verification_key": vk, "signing_key": sk, "signature": sig}


def _mlkem(base, pk, sk, ct):
    return {"kind": "mlkem", "base": base,
            "public_key": pk, "secret_key": sk, "ciphertext": ct,
            "shared_secret": 32}


SCHEMES = {
    "ML-DSA-44": _mldsa("mldsa44", 1312, 2560, 2420),
    "ML-DSA-65": _mldsa("mldsa65", 1952, 4032, 3309),
    "ML-DSA-87": _mldsa("mldsa87", 2592, 4896, 4627),
    "ML-KEM-512": _mlkem("mlkem512", 800, 1632, 768),
    "ML-KEM-768": _mlkem("mlkem768", 1184, 2400, 1088),
    "ML-KEM-1024": _mlkem("mlkem1024", 1568, 3168, 1568),
}


def in_buf(data):
    return ctypes.create_string_buffer(bytes(data), len(data))


def out_buf(size):
    return ctypes.create_string_buffer(size)


def addr(buf):
    return ctypes.cast(buf, c_void_p).value or 0


def h(block, field):
    return bytes.fromhex(block[field])


class Report:
    def __init__(self):
        self.passed = self.failed = 0
        self.failures = []

    def check(self, label, ok, detail=""):
        if ok:
            self.passed += 1
        else:
            self.failed += 1
            self.failures.append(f"{label}: {detail}")

    def check_output(self, label, block, field, actual):
        if field in block:
            want, got = block[field], actual.hex()
            self.check(f"{label}.{field}", got == want,
                       f"expected {want[:24]}..., got {got[:24]}...")
        key = field + "_sha3_256"
        if key in block:
            want, got = block[key], hashlib.sha3_256(actual).hexdigest()
            self.check(f"{label}.{key}", got == want, f"expected {want}, got {got}")


RUNNERS = {}


def runner(kind):
    def register(cls):
        RUNNERS[kind] = cls
        return cls
    return register


class Scheme:
    OPS = ()
    STATE = ()

    def __init__(self, lib, spec):
        self.spec = spec
        self.cid = None
        self.bind(lib)

    def bind(self, lib):
        raise NotImplementedError

    def reset(self):
        for name in self.STATE:
            setattr(self, name, None)

    def run(self, tests, rep):
        for t in tests:
            self.cid = t.get("count", "?")
            self.reset()
            for op in self.OPS:
                if op in t:
                    getattr(self, op)(t[op], rep)

    def label(self, op):
        return f"[{self.cid}] {op}"


@runner("mldsa")
class MLDSA(Scheme):
    OPS = ("keygen", "sign", "verify")
    STATE = ("vk", "sk", "sig", "ctx", "msg")

    def bind(self, lib):
        self.keygen_fn = lib.sig_keygen
        self.keygen_fn.restype, self.keygen_fn.argtypes = None, [c_void_p] * 3
        self.sign_fn = lib.sig_sign
        self.sign_fn.restype = c_int
        self.sign_fn.argtypes = [c_void_p, c_void_p, c_void_p, c_uint64, c_uint64, c_void_p]
        self.verify_fn = lib.sig_verify
        self.verify_fn.restype = c_int
        self.verify_fn.argtypes = [c_void_p, c_void_p, c_uint64, c_uint64, c_void_p]

    def keygen(self, b, rep):
        vkb, skb = out_buf(self.spec["verification_key"]), out_buf(self.spec["signing_key"])
        self.keygen_fn(addr(vkb), addr(skb), addr(in_buf(h(b, "seed"))))
        self.vk, self.sk = vkb.raw, skb.raw
        rep.check_output(self.label("keygen"), b, "verification_key", self.vk)
        rep.check_output(self.label("keygen"), b, "signing_key", self.sk)

    def sign(self, b, rep):
        sk = h(b, "signing_key") if "signing_key" in b else self.sk
        self.ctx, self.msg = h(b, "context"), h(b, "message")
        ctxb, msgb = in_buf(self.ctx), in_buf(self.msg)
        ctx_arr = (c_uint64 * 2)(addr(ctxb), len(self.ctx))
        sigb = out_buf(self.spec["signature"])
        r = self.sign_fn(addr(sigb), addr(in_buf(sk)), ctypes.cast(ctx_arr, c_void_p),
                         addr(msgb), len(self.msg), addr(in_buf(h(b, "randomness"))))
        rep.check(self.label("sign") + ".result", r == b.get("result", 0), f"got {r}")
        self.sig = sigb.raw
        rep.check_output(self.label("sign"), b, "signature", self.sig)

    def verify(self, b, rep):
        vk = h(b, "verification_key") if "verification_key" in b else self.vk
        ctx = h(b, "context") if "context" in b else self.ctx
        msg = h(b, "message") if "message" in b else self.msg
        sig = h(b, "signature") if "signature" in b else self.sig
        ctxb, msgb = in_buf(ctx), in_buf(msg)
        ctx_arr = (c_uint64 * 2)(addr(ctxb), len(ctx))
        r = self.verify_fn(addr(in_buf(vk)), ctypes.cast(ctx_arr, c_void_p),
                           addr(msgb), len(msg), addr(in_buf(sig)))
        rep.check(self.label("verify") + ".result", r == b.get("result", 0), f"got {r}")


@runner("mlkem")
class MLKEM(Scheme):
    OPS = ("keygen", "encaps", "decaps")
    STATE = ("pk", "sk", "ct", "ss")

    def bind(self, lib):
        self.keypair_fn = lib.kem_keypair_derand
        self.keypair_fn.restype, self.keypair_fn.argtypes = c_int, [c_void_p] * 3
        self.enc_fn = lib.kem_enc_derand
        self.enc_fn.restype, self.enc_fn.argtypes = c_int, [c_void_p] * 4
        self.dec_fn = lib.kem_dec
        self.dec_fn.restype, self.dec_fn.argtypes = c_int, [c_void_p] * 3

    def keygen(self, b, rep):
        pkb, skb = out_buf(self.spec["public_key"]), out_buf(self.spec["secret_key"])
        self.keypair_fn(addr(pkb), addr(skb), addr(in_buf(h(b, "coins"))))
        self.pk, self.sk = pkb.raw, skb.raw
        rep.check_output(self.label("keygen"), b, "public_key", self.pk)
        rep.check_output(self.label("keygen"), b, "secret_key", self.sk)

    def encaps(self, b, rep):
        pk = h(b, "public_key") if "public_key" in b else self.pk
        ctb, ssb = out_buf(self.spec["ciphertext"]), out_buf(self.spec["shared_secret"])
        self.enc_fn(addr(ctb), addr(ssb), addr(in_buf(pk)), addr(in_buf(h(b, "coins"))))
        self.ct, self.ss = ctb.raw, ssb.raw
        rep.check_output(self.label("encaps"), b, "ciphertext", self.ct)
        rep.check_output(self.label("encaps"), b, "shared_secret", self.ss)

    def decaps(self, b, rep):
        ct = h(b, "ciphertext") if "ciphertext" in b else self.ct
        sk = h(b, "secret_key") if "secret_key" in b else self.sk
        ssb = out_buf(self.spec["shared_secret"])
        self.dec_fn(addr(ssb), addr(in_buf(ct)), addr(in_buf(sk)))
        rep.check_output(self.label("decaps"), b, "shared_secret", ssb.raw)


def load_backend(backend, scheme_base, lib_dir):
    lib_path = lib_dir / f"{backend}_{scheme_base}.so"
    if not lib_path.exists():
        raise SystemExit(f"library not found: {lib_path} (run `make libs`)")
    try:
        return ctypes.CDLL(str(lib_path))
    except OSError as e:
        raise SystemExit(f"cannot load {lib_path}: {e}\n"
                         "(backends are x86-64 + AVX2; load them on a matching host)")


def run_file(path, backend, lib_dir, rep):
    data = json.loads(path.read_text())
    algo = data["algorithm"]
    if algo not in SCHEMES:
        raise SystemExit(f"{path}: unknown algorithm {algo!r}")
    spec = SCHEMES[algo]
    lib = load_backend(backend, spec["base"], lib_dir)
    tests = data.get("tests", [])
    print(f"{path.name}: {backend} / {algo}, {len(tests)} test(s)")
    RUNNERS[spec["kind"]](lib, spec).run(tests, rep)


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("vectors", nargs="+", type=Path, help="KAT JSON file(s)")
    ap.add_argument("--backend", required=True, help="backend name, e.g. jasmin, mlkem-native")
    ap.add_argument("--lib-dir", type=Path,
                    default=Path(__file__).resolve().parent / "_build")
    args = ap.parse_args(argv)

    rep = Report()
    for path in args.vectors:
        run_file(path, args.backend, args.lib_dir, rep)

    print(f"\n{rep.passed} passed, {rep.failed} failed")
    for f in rep.failures:
        print(f"  FAIL {f}")
    return 1 if rep.failed else 0


if __name__ == "__main__":
    sys.exit(main())
