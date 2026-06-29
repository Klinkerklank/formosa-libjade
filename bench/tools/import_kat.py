#!/usr/bin/env python3
"""Import KAT vectors into the bench/ JSON schema.

ML-DSA: converts the hash-based "pqc" KAT files (key_generation_seed, context,
        message, signing_randomness + sha3_256 hashes of vk/sk/sig).
ML-KEM: downloads NIST ACVP ML-KEM-keyGen / ML-KEM-encapDecap (prompt +
        expectedResults) and converts to full-value vectors.

    python3 tools/import_kat.py --out vectors \\
        --pqc /path/to/formosa-mldsa/tests/pqc --acvp-version v1.1.0.41
"""

import argparse
import json
import sys
import urllib.request
from pathlib import Path

ACVP_BASE = "https://raw.githubusercontent.com/usnistgov/ACVP-Server/{v}/gen-val/json-files"
ACVP_FILES = [
    "ML-KEM-keyGen-FIPS203/prompt.json",
    "ML-KEM-keyGen-FIPS203/expectedResults.json",
    "ML-KEM-encapDecap-FIPS203/prompt.json",
    "ML-KEM-encapDecap-FIPS203/expectedResults.json",
]


def base_name(algo):
    return algo.replace("-", "").lower()  # "ML-KEM-512" -> "mlkem512"


def write_scheme(out_dir, algo, tests, source):
    path = out_dir / f"{base_name(algo)}.json"
    path.write_text(json.dumps(
        {"algorithm": algo, "source": source, "tests": tests}, indent=1))
    print(f"  {path.name}: {len(tests)} test(s)")


# --------------------------------------------------------------------------
# ML-DSA: hash-based pqc KAT -> schema
# --------------------------------------------------------------------------
def import_mldsa(pqc_dir, out_dir):
    for setn in (44, 65, 87):
        src = pqc_dir / f"ml_dsa_{setn}.json"
        if not src.exists():
            print(f"  (skip ML-DSA-{setn}: {src} not found)")
            continue
        tests = []
        for r in json.loads(src.read_text()):
            tests.append({
                "count": int(r["count"]),
                "keygen": {
                    "seed": r["key_generation_seed"],
                    "verification_key_sha3_256": r["sha3_256_hash_of_verification_key"],
                    "signing_key_sha3_256": r["sha3_256_hash_of_signing_key"],
                },
                "sign": {
                    "context": r["context"],
                    "message": r["message"],
                    "randomness": r["signing_randomness"],
                    "signature_sha3_256": r["sha3_256_hash_of_signature"],
                },
            })
        write_scheme(out_dir, f"ML-DSA-{setn}", tests, f"pqc KAT ({src.name})")


# --------------------------------------------------------------------------
# ML-KEM: NIST ACVP -> schema (full values)
# --------------------------------------------------------------------------
def fetch_acvp(version, cache):
    cache.mkdir(parents=True, exist_ok=True)
    out = {}
    for rel in ACVP_FILES:
        local = cache / rel.replace("/", "_")
        if not local.exists():
            url = f"{ACVP_BASE.format(v=version)}/{rel}"
            print(f"  downloading {rel}")
            urllib.request.urlretrieve(url, local)
        out[rel] = json.loads(local.read_text())
    return out


def by_tcid(expected):
    m = {}
    for g in expected["testGroups"]:
        for t in g["tests"]:
            m[t["tcId"]] = t
    return m


def import_mlkem(version, out_dir, cache):
    a = fetch_acvp(version, cache)
    schemes = {}  # algo -> list of tests

    kg_exp = by_tcid(a["ML-KEM-keyGen-FIPS203/expectedResults.json"])
    for g in a["ML-KEM-keyGen-FIPS203/prompt.json"]["testGroups"]:
        algo = g["parameterSet"]
        for t in g["tests"]:
            e = kg_exp[t["tcId"]]
            schemes.setdefault(algo, []).append({
                "count": t["tcId"],
                "keygen": {"coins": t["d"] + t["z"],  # ML-KEM.KeyGen coins = d || z
                           "public_key": e["ek"], "secret_key": e["dk"]},
            })

    ed_exp = by_tcid(a["ML-KEM-encapDecap-FIPS203/expectedResults.json"])
    for g in a["ML-KEM-encapDecap-FIPS203/prompt.json"]["testGroups"]:
        algo = g["parameterSet"]
        func = (g.get("function") or "").lower()
        for t in g["tests"]:
            e = ed_exp[t["tcId"]]
            if func == "encapsulation":
                schemes.setdefault(algo, []).append({
                    "count": t["tcId"],
                    "encaps": {"public_key": t["ek"], "coins": t["m"],
                               "ciphertext": e["c"], "shared_secret": e["k"]},
                })
            elif func == "decapsulation":
                schemes.setdefault(algo, []).append({
                    "count": t["tcId"],
                    "decaps": {"secret_key": t.get("dk", g.get("dk")),
                               "ciphertext": t["c"], "shared_secret": e["k"]},
                })

    for algo, tests in schemes.items():
        write_scheme(out_dir, algo, tests, f"NIST ACVP {version}")


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    here = Path(__file__).resolve().parent.parent
    ap.add_argument("--out", type=Path, default=here / "vectors")
    ap.add_argument("--pqc", type=Path,
                    default=Path("/Users/strub/Projects/formosa-mldsa/tests/pqc"),
                    help="directory with ml_dsa_{44,65,87}.json (pqc KAT)")
    ap.add_argument("--acvp-version", default="v1.1.0.41")
    ap.add_argument("--only", choices=("mldsa", "mlkem"))
    args = ap.parse_args(argv)
    args.out.mkdir(parents=True, exist_ok=True)

    if args.only != "mlkem":
        print("ML-DSA (pqc KAT):")
        import_mldsa(args.pqc, args.out)
    if args.only != "mldsa":
        print("ML-KEM (NIST ACVP):")
        import_mlkem(args.acvp_version, args.out, args.out / ".acvp-cache" / args.acvp_version)
    return 0


if __name__ == "__main__":
    sys.exit(main())
