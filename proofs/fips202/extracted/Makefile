# In-tree EasyCrypt extraction of the keccak (FIPS202) Jasmin model.
# Mirrors proofs/mlkem-correctness/extraction/avx2 and
# proofs/mldsa/x86-64/avx2/ml_dsa_65. The committed Keccak1600_Jazz*.ec are what
# the proofs consume; this regenerates them from the in-tree src/fips202 with the
# globally-installed jasmin2ec (no submodule required).
#
# Fixed sizes: toEC_keccak1600_ASIZE.jazz sets `param int _ASIZE = 999`, which
# jasmin2ec inlines -> Keccak1600_Jazz_ASIZE.ec is the concrete-999 model. The
# 999 -> parametric `_ASIZE` abstraction is hand-written in the proof files under
# ../{ref,avx2}; the extracted/*_checkXtr.ec clones re-instantiate that abstraction
# `with op _ASIZE <- 999` and check it against this concrete-999 extraction. Those
# checks run as part of the `fips202` scenario, so a source change that is not
# reflected in the hand abstraction is caught once the model is re-extracted.
#
# Source deps below make `make` re-extract whenever any keccak .jinc changes, so
# the transformation is reproducible and code changes propagate (re-extract, then
# `make -C ../../.. proofs fips202` fails on any checkXtr mismatch).

REPO        := ../../..
KECCAK      := $(REPO)/src/fips202
OARRAYS     := $(REPO)/proofs/arrays
JASMIN2EC   := jasmin2ec
JECFLAGS    := --array-model=old --output-array=$(OARRAYS)
KECCAK_DEPS := $(shell find $(KECCAK) -name '*.jinc' 2>/dev/null)

extract = env JASMINPATH="Keccak=$(KECCAK)" $(JASMIN2EC) $(JECFLAGS) $(1) -o $(2)

.PHONY: all clean re_extract
all: Keccak1600_Jazz.ec Keccak1600_Jazz_ASIZE.ec

Keccak1600_Jazz.ec: toEC_keccak1600.jazz $(KECCAK_DEPS)
	$(call extract,$<,$@)

Keccak1600_Jazz_ASIZE.ec: toEC_keccak1600_ASIZE.jazz $(KECCAK_DEPS)
	$(call extract,$<,$@)

re_extract: clean all

# Only the model files — the array theories live in the shared proofs/arrays.
clean:
	rm -f Keccak1600_Jazz.ec Keccak1600_Jazz_ASIZE.ec
