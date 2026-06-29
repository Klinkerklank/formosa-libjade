#!/usr/bin/env python3
"""Differential comparison across backends.

Feeds identical derand inputs to several backends and checks that every output
(keys, ciphertext, shared secret, signature) is byte-identical. Catches drift
between implementations without needing golden KAT vectors.

Usage:
    python3 compare.py --scheme ML-KEM-768 --backends jasmin,mlkem-native -n 100
"""

import argparse
import ctypes
import sys
from ctypes import c_int, c_uint64, c_void_p
from pathlib import Path

from kat import SCHEMES, load_backend, in_buf, out_buf, addr


def prng(seed):
    """Deterministic byte stream (splitmix64), reproducible across runs."""
    state = seed & 0xFFFFFFFFFFFFFFFF

    def nbytes(n):
        nonlocal state
        out = bytearray()
        while len(out) < n:
            state = (state + 0x9E3779B97F4A7C15) & 0xFFFFFFFFFFFFFFFF
            z = state
            z = ((z ^ (z >> 30)) * 0xBF58476D1CE4E5B9) & 0xFFFFFFFFFFFFFFFF
            z = ((z ^ (z >> 27)) * 0x94D049BB133111EB) & 0xFFFFFFFFFFFFFFFF
            z ^= z >> 31
            out += z.to_bytes(8, "little")
        return bytes(out[:n])
    return nbytes


def bind_kem(lib):
    lib.kem_keypair_derand.restype, lib.kem_keypair_derand.argtypes = c_int, [c_void_p] * 3
    lib.kem_enc_derand.restype, lib.kem_enc_derand.argtypes = c_int, [c_void_p] * 4
    lib.kem_dec.restype, lib.kem_dec.argtypes = c_int, [c_void_p] * 3
    return lib


def kem_run(lib, spec, kp_coins, enc_coins):
    pk, sk = out_buf(spec["public_key"]), out_buf(spec["secret_key"])
    lib.kem_keypair_derand(addr(pk), addr(sk), addr(in_buf(kp_coins)))
    ct, ss = out_buf(spec["ciphertext"]), out_buf(spec["shared_secret"])
    lib.kem_enc_derand(addr(ct), addr(ss), addr(pk), addr(in_buf(enc_coins)))
    ss2 = out_buf(spec["shared_secret"])
    lib.kem_dec(addr(ss2), addr(ct), addr(sk))
    return {"pk": pk.raw, "sk": sk.raw, "ct": ct.raw, "ss": ss.raw, "ss_dec": ss2.raw}


def bind_sig(lib):
    lib.sig_keygen.restype, lib.sig_keygen.argtypes = None, [c_void_p] * 3
    lib.sig_sign.restype = c_int
    lib.sig_sign.argtypes = [c_void_p, c_void_p, c_void_p, c_uint64, c_uint64, c_void_p]
    lib.sig_verify.restype = c_int
    lib.sig_verify.argtypes = [c_void_p, c_void_p, c_uint64, c_uint64, c_void_p]
    return lib


def sig_run(lib, spec, seed, msg, rnd):
    vk, sk = out_buf(spec["verification_key"]), out_buf(spec["signing_key"])
    lib.sig_keygen(addr(vk), addr(sk), addr(in_buf(seed)))
    msgb = in_buf(msg)
    ctx_arr = (c_uint64 * 2)(0, 0)  # empty context
    sig = out_buf(spec["signature"])
    lib.sig_sign(addr(sig), addr(sk), ctypes.cast(ctx_arr, c_void_p),
                 addr(msgb), len(msg), addr(in_buf(rnd)))
    ok = lib.sig_verify(addr(vk), ctypes.cast(ctx_arr, c_void_p),
                        addr(msgb), len(msg), addr(sig))
    return {"vk": vk.raw, "sk": sk.raw, "sig": sig.raw, "verify_ok": ok == 0}


def compare(scheme, backends, n, lib_dir):
    spec = SCHEMES[scheme]
    rng = prng(0xC0FFEE ^ hash(scheme) & 0xFFFF)
    libs = {b: (bind_kem if spec["kind"] == "mlkem" else bind_sig)(
                load_backend(b, spec["base"], lib_dir)) for b in backends}

    mismatches = 0
    for i in range(n):
        if spec["kind"] == "mlkem":
            kp, enc = rng(64), rng(32)
            outs = {b: kem_run(lib, spec, kp, enc) for b, lib in libs.items()}
            for b, o in outs.items():
                if o["ss"] != o["ss_dec"]:
                    print(f"  [{i}] {b}: enc/dec shared-secret mismatch"); mismatches += 1
            fields = ("pk", "sk", "ct", "ss")
        else:
            seed, msg, rnd = rng(32), rng(33), rng(32)
            outs = {b: sig_run(lib, spec, seed, msg, rnd) for b, lib in libs.items()}
            for b, o in outs.items():
                if not o["verify_ok"]:
                    print(f"  [{i}] {b}: verify failed on own signature"); mismatches += 1
            fields = ("vk", "sk", "sig")

        ref = backends[0]
        for f in fields:
            for b in backends[1:]:
                if outs[b][f] != outs[ref][f]:
                    print(f"  [{i}] {f}: {b} differs from {ref}"); mismatches += 1
    return mismatches


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("--scheme", required=True, choices=list(SCHEMES))
    ap.add_argument("--backends", required=True, help="comma-separated, >=2")
    ap.add_argument("-n", type=int, default=100, help="iterations (default 100)")
    ap.add_argument("--lib-dir", type=Path, default=Path(__file__).resolve().parent / "_build")
    args = ap.parse_args(argv)

    backends = [b.strip() for b in args.backends.split(",") if b.strip()]
    if len(backends) < 2:
        raise SystemExit("need at least two backends to compare")

    print(f"{args.scheme}: comparing {backends} over {args.n} iterations")
    m = compare(args.scheme, backends, args.n, args.lib_dir)
    print(f"\n{'AGREE' if m == 0 else f'{m} MISMATCH(es)'}")
    return 1 if m else 0


if __name__ == "__main__":
    sys.exit(main())
