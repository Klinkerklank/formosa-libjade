# Plan: expandS (error-vector sampler) correctness — `Sexpand.ec`

Strategy: same as the matrix expansion (Aexpand.ec). Work **in isolation**
against an abstract characterization (`Spoly` + axiom, mirroring
`Apoly`/`ApolyP`); the link to the crypto-spec (`expandS`/RejBoundedPoly,
the `error_vectors_correct` phoare in `error_vectors.ec`) comes later.

## The extracted pipeline (ml_dsa_65_avx2.ec, line refs)

```
sample____error_vectors (rho')                      [11004]
  = 3 × error_4x____sample_polynomials (rho', sep)  sep = 0, 4, 8
    → 12 polys; s1 ← polys 0..4 (Array1280), s2 ← polys 5..10
      (Array1536); 12th lane discarded.
error_4x____sample_polynomials                      [10862]
  shake256_absorb_66_4x            — proved: shake256_absorb_66_4xP (sha3x4.ec)
  error_4x____shake256_squeeze_multiple_blocks_4x   [10809]
                                   — 2 blocks → W8 Array272 per lane
  4 × error_4x__rejection_sample_multiple_blocks    [10639]
  staged single-block refills via shake256_squeezeblock4x (proved wrapper)
  + stop-flag logic; same staging shape as matrix_A____sample_4_polynomials.
error_4x__rejection_sample_multiple_blocks          [10639]
  per iter: 16 bytes → error_4x____bytestream_to_coefficients [10585]
    (VPMOVZX_16u8_16u16, VPSLL_16u16 4, VPOR, AND 0x0f → 32 nibble
    candidates as bytes of a W256);
  VPSUB_32u8 / MOVEMASK_32u8 acceptance mask (nibble < 9);
  4 × error_4x____write_out_8_coefficients [10599]:
    eRROR_VECTOR_SHUFFLE_TABLE (2048 B = 256 rows × 8) compaction,
    coefficients 4−z via VPSUB then VPMOVSX_8u8_8u32 (SIGN-extended:
    values in [−4,4], negative as W32 wraparound);
  progress counted in BYTES: bytes_filled = 4·#coeffs, guard
  bytes_filled < (256*32)/8 − 32 = 992.
error_4x__rejection_sample_one_block                [10762]  scalar tail:
  per byte: low nibble, then (filled<256)-guarded high nibble; accept
  z < 9, c = −(z−4); xof_offset over 136. Structurally identical to the
  matrix scalar tail (incl. the "examine the last candidate" subtlety).
```

Key deltas vs the matrix expansion: nibble candidates (2 per byte,
stride ½ byte vs 3 bytes), acceptance `z < 9`, signed coefficient map
`z ↦ 4−z`, 8-coefficient write-out groups (4 per iteration), progress
in bytes (×4), 272-byte double-block buffers, SHAKE256 at rate 136.

## Phases

0. **Scaffolding.** New `sample/Sexpand.ec` mirroring Aexpand's layout.
   `clone PrefixArray as PA_272_136`; `require import Sha3x4` +
   `import Shake256x4` (bare infix `\sha3for`). Prove
   `error_4x____shake256_squeeze_multiple_blocks_4xP` — same 6-line
   proof as the 5-block SHAKE128 one (while over 2 windows,
   `sub_window_catE`, `shake256_slice_cat_block`,
   `shake256_squeezeblock4xP`).

1. **Abstract stream decoder** (analog of `reject`/`cand`):
   `scands bs = flatten (map (fun b => [b &15; b >> 4]) bs)`-style
   nibble stream; `saccept z = to_uint z < 9`;
   `op [opaque] sreject` = map (4−z) of filter saccept of scands
   (settle factoring so leaf algebra is smooth). Leaf kit:
   `sreject_nil` + hint, `scand`, `sreject_block`, `sreject_step`
   peeling ONE BYTE = two candidates (the structural novelty).

2. **SIMD decode correctness**: `bytestream_to_coefficientsP` by
   hint-simplify symbolic execution (listred style) — pin down the
   even/odd nibble interleave order to match `scands` exactly.
   Then write-out: shuffle-table row lemma (analog of
   DECODING_PERM_E/shuffle_slot, 256×8 table), `popcnt_step`/
   `agree_store` analogs in 8-lane form, byte-counting adapters
   (invariant op carries `bytes_filled = 4·size(...)` once).

3. **Rejection lemmas**:
   `error_4x__rejection_sample_multiple_blocksP` (vectorized,
   `min 256 (size (sreject …))` capped post) and
   `error_4x__rejection_sample_one_blockP` (scalar tail; masked
   last-candidate treatment carries over from the matrix tail).
   House style: commented seq cuts, statement-anchored positions,
   `sagree`/`ssampled`/`svsampled` bundling ops, exlim freezing,
   goal-per-goal discharges, no smt-in-try.

4. **4-lane staging**: `error_4x____sample_polynomialsP` with
   `lanes_ok`/`blocks_ok` analogs (272-byte buffers, `b2i (i < j)`
   staging), `hint +listred -delta nth` for the 4-element list
   invariants, exit bridge via the proved absorb/squeeze wrappers.
   Mechanical replay of the matrix proof (848→272, 168→136).

5. **Isolation axiom + assembly**: abstract
   `op Spoly : W8.t Array64.t -> int -> wpoly` + axiom `SpolyP`:
   coefficient m = m-th element of
   `sreject (shake256_slice (to_list rho' ++ W2u8.to_list sep) 0 …)`
   (mirror of ApolyP). Validity predicate over the Array1280/Array1536
   windows (mirror of A_valid_up_to/update_polys; 256-stride window
   lemmas — small PrefixArray clones or the generic window lemma).
   Final: `hoare[ M.sample____error_vectors : arg = rho' ==>
   s1/s2 hold Spoly rho' r for r = 0..10 ]`; mind the sep-0/4/8
   batching and the discarded 12th lane.

6. **Link (LATER, out of scope)**: realize `shake256_xof`/`Spoly`
   against the spec (expandS/RejBoundedPoly); discharge
   `error_vectors_correct` (lifts_wpolylvec, `wpolylvec_srng … Eta
   Eta` — where signed-W32 representation meets the η-range).

## Risks / attention points

- Nibble interleave through VPMOVZX+VPSLL+VPOR must match `scands`
  exactly, or phase 2 gets painful.
- Byte-counted progress and the 992 guard: matrix off-by-one lessons
  apply at ×4 scale.
- VPMOVSX sign-extension: store lemmas need `to_sint`-flavored
  reasoning where the matrix used plain masking.
- Prover margins: goal-local smt, lemma-hinted; parallel-suite flakes
  (Hybrid/JWordList/Bigalg/Distr) are known and standalone-green.

## Execution order

Phases 0+1 = first commit; 2–3 the bulk; 4–5 mostly replays.
Verify per phase with the installed easycrypt
(`PATH=_opam/bin`, `easycrypt llm -lastgoals/-upto` for debugging,
timeboxed runs), full mldsa scenario before each commit.
