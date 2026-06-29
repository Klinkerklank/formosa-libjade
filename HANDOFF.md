# Handoff notes

State of the repository after setting up the Jasmin build, the EasyCrypt
extraction, and the multi-backend test/bench harness. Written so work can
continue in a fresh session (e.g. after moving to an x86-64 + AVX2 host).

## Layout

- `src/` — curated Jasmin ML-KEM/ML-DSA AVX2 sources (the long-term keep set,
  together with `proofs/`).
  - `src/Makefile` — `.s` generation; `make` builds `_build/{mldsa65,mlkem768,
    mlkem1024}_avx2.s`.
  - `src/include/` — C headers for the derand entry points (all six parameter
    sets; only 65/768/1024 have sources so far).
  - `src/keccak` — symlink to `../submodules/formosa-keccak/src/amd64`.
  - `src/tests/kat.py` — single-file ctypes KAT driver for the src build.
- `proofs/` — EasyCrypt development (restored).
- `bench/` — multi-backend KAT + cycle benchmark harness (details below).
- `submodules/formosa-keccak` — Keccak sources (Jasmin `Keccak` namespace).
- `mlkem/`, `mldsa/` — original subtree imports, still tracked. The end goal is
  to drop them and keep only `src/` + `proofs/`. `mldsa-implementation/` has
  already been removed.

## Toolchain

- Local opam switch at the repo root (`_opam`); `jasmin-nist.opam` pins
  `jasmin = 2026.03.1` and `easycrypt` from git `main`.
- The proofs were originally produced with: ML-KEM = Jasmin **2026.03.0**
  (exact tag), ML-DSA = a `release-2026.03` snapshot dated **2026-03-23**
  (between .0 and .1). We standardized everything on **2026.03.1**. The
  regenerated ML-DSA model differs from the committed one by ~977 lines that
  are **purely jasmin2ec rendering** (`VMOV_64`→`zeroextu128`, an `aT8` index
  simplification) — verified equivalent: the current `src` and the old
  upstream source extract byte-identically under the same tool.

## Key decisions

- **Derand-only ML-KEM entry points**: the non-derand `keypair`/`enc` exports
  were removed from `src/mlkem/avx2/{768,1024}/jmlkem.jazz` (they pulled in the
  `#randombytes` syscall). Entry points expose `keypair_derand`, `enc_derand`,
  `dec`.
- **`src` renames vs upstream** (verified the code is otherwise byte-identical
  to `../formosa-mlkem`): `jkem.jazz`→`jmlkem.jazz`, `kem.jinc`→`mlkem.jinc`,
  `require "../../common/avx2/X"`→`"../common/X"`; ML-DSA `keygen`/`sign` files
  use the non-`_new` names.
- **Architecture**: all AVX2 builds cross-compile on Apple Silicon but only
  *run* on an x86-64 + AVX2 host (Rosetta lacks AVX2). Build locally, run there.

## Building / running

```
# Jasmin .s + shared libs
cd src && make            # .s for mldsa65, mlkem768/1024

# EasyCrypt extraction
make -C proofs/mldsa/x86-64/avx2/ml_dsa_65 ec    # -> ml_dsa_65_avx2.ec + arrays/
make -C proofs/mlkem/extraction                  # -> {768,1024}/Jkem_avx2.ec (no arrays)

# Multi-backend harness (run targets need an x86-64 + AVX2 host)
cd bench
git -C .. submodule update --init                # mlkem-native, mldsa-native, formosa-keccak
make libs                                        # <backend>_<scheme>.so via common derand ABI
make test                                        # KAT vectors/ for each backend
make compare SCHEME=ML-KEM-768 BACKENDS='jasmin mlkem-native'
make bench   SCHEME=ML-DSA-65                    # rdtsc median cycles
```

KAT vectors in `bench/vectors/` are committed (ML-DSA = pqc hash-based KAT,
ML-KEM = NIST ACVP v1.1.0.41). Regenerate with `bench/tools/import_kat.py`.

## Open items / next steps

1. **Run on AVX2**: actually execute `make test/compare/bench` on an x86-64 +
   AVX2 machine; debug any KAT/bench failures.
2. **liboqs** (phase 2): add as a third reference backend. Its public API has
   no derand, so the adapter must reach the bundled upstream derand functions.
3. **More Jasmin parameter sets**: `src/` only has mlkem768/1024 and mldsa65.
   The harness/headers already anticipate mlkem512 and mldsa44/87 — drop their
   sources into `src/mlkem/avx2/512` and `src/mldsa/avx2/{44,87}` and they
   build automatically.
4. **MLKEM proof project paths**: `proofs/mlkem/correctness/avx2/*/easycrypt.project`
   still bind `JazzEC`/`Jasmin`/`Keccak` to the removed-subtree paths
   (`../../../../code/jasmin/...`, `../../../../jasmin/eclib`, etc.). Repoint
   them at `src/`-based extraction (`proofs/mlkem/extraction/<param>`) and the
   submodules before the correctness proofs build.
5. **Adapt proofs** to the 2026.03.1 ML-DSA model where the rendering changed.
