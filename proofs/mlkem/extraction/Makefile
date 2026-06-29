# EasyCrypt extraction of the ML-KEM AVX2 derand entry points from the Jasmin
# sources in src/. The model is written to stdout, so jasmin2ec does NOT emit
# the array/word theories: those are provided by the proof development
# (../arrays, ../xarrays, ../xwords).

REPO      := ../../..
SRC       := $(REPO)/src/mlkem/avx2
KECCAK    := $(REPO)/submodules/formosa-keccak/src/amd64
JASMIN2EC := jasmin2ec

COMMON_DEPS := $(wildcard $(SRC)/common/*.jinc) \
               $(shell find $(KECCAK) -name '*.jinc' 2>/dev/null)

# $(call extract,<entry.jazz>,<param>) -> jasmin2ec command (stdout)
extract = env JASMINPATH="Keccak=$(KECCAK)" $(JASMIN2EC) $(1) --array-model=old \
            -f jade_kem_mlkem_mlkem$(2)_amd64_avx2_keypair_derand \
            -f jade_kem_mlkem_mlkem$(2)_amd64_avx2_enc_derand \
            -f jade_kem_mlkem_mlkem$(2)_amd64_avx2_dec

.PHONY: all clean
all: 768/Jkem_avx2.ec 1024/Jkem_avx2.ec

768/Jkem_avx2.ec: $(SRC)/768/jmlkem.jazz $(wildcard $(SRC)/768/*.jinc) $(COMMON_DEPS)
	@mkdir -p 768
	$(call extract,$<,768) > $@

1024/Jkem_avx2.ec: $(SRC)/1024/jmlkem.jazz $(wildcard $(SRC)/1024/*.jinc) $(COMMON_DEPS)
	@mkdir -p 1024
	$(call extract,$<,1024) > $@

clean:
	rm -f 768/Jkem_avx2.ec 1024/Jkem_avx2.ec
