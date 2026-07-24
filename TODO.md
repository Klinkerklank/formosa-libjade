# TODO

## Check extracted models are consistent with the source ("extraction up to date" gate)

The EasyCrypt proofs are verified against **committed** extracted models, not
against the current Jasmin sources:

- `proofs/fips202/extracted/Keccak1600_Jazz{,_ASIZE}.ec`
- `proofs/mlkem-correctness/extraction/avx2/{768,1024}/Jkem_avx2.ec`
- `proofs/mldsa/x86-64/avx2/ml_dsa_65/ml_dsa_65_avx2.ec`

Nothing currently forces these to match `src/`. If a `.jinc`/`.jazz` source
changes and is **not** re-extracted, the proofs check a **stale** model and the
change silently never reaches them. PY's `ci-proofs` branch runs the proofs
(`make -C proofs`) but does **not** re-extract or guard against this.

**To do:** add an "extraction up to date" check — re-extract from `src/` and diff
against the committed `.ec`, failing on any difference — applied uniformly to
fips202 + mlkem + mldsa. Each scheme already has an extraction Makefile to drive
it (`proofs/fips202/extracted/Makefile`,
`proofs/mlkem-correctness/extraction/avx2/Makefile`,
`proofs/mldsa/x86-64/avx2/ml_dsa_65/Makefile`). Natural home: a job in
`proofs.yml` (once `ci-proofs` merges) or a `make -C proofs check-extraction`
target.

**fips202 note:** fixed-size procs extract against `param _ASIZE = 999` (inlined),
and the `999 -> parametric _ASIZE` abstraction is hand-written in
`proofs/fips202/{ref,avx2}`. The `extracted/*_checkXtr.ec` clones guard that
abstraction against the concrete extraction and run as part of the `fips202`
scenario — but they only catch drift once the model is actually re-extracted, so
they do not remove the need for the gate above.
