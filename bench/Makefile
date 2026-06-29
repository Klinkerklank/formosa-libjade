# Multi-backend KAT + benchmark harness.
#
# Each backend builds to _build/<backend>_<scheme>.so exposing the common
# derand ABI (adapters/common_abi.h). Backends are x86-64 + AVX2: on Apple
# Silicon they cross-build but only run on an x86-64 + AVX2 host.

CC      ?= cc
PYTHON  ?= python3
BUILD   ?= _build

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
  XARCH ?= -arch x86_64
else
  XARCH ?=
endif

ADAPTERS := adapters
SRC_BUILD := ../src/_build
MLKN := third_party/mlkem-native/mlkem
MLDN := third_party/mldsa-native/mldsa

# ---- backend library sets (<backend>_<scheme>.so) ------------------------
# jasmin: only the parameter sets present in src/ (mlkem 768/1024, mldsa 65).
JASMIN_KEM := $(BUILD)/jasmin_mlkem768.so $(BUILD)/jasmin_mlkem1024.so
JASMIN_SIG := $(BUILD)/jasmin_mldsa65.so
# native reference libraries: all parameter sets.
MLKN_KEM   := $(BUILD)/mlkem-native_mlkem512.so \
              $(BUILD)/mlkem-native_mlkem768.so \
              $(BUILD)/mlkem-native_mlkem1024.so
MLDN_SIG   := $(BUILD)/mldsa-native_mldsa44.so \
              $(BUILD)/mldsa-native_mldsa65.so \
              $(BUILD)/mldsa-native_mldsa87.so

LIBS := $(JASMIN_KEM) $(JASMIN_SIG) $(MLKN_KEM) $(MLDN_SIG)

.PHONY: libs clean
libs: $(LIBS)

$(BUILD):
	mkdir -p $@

# ---- jasmin backend: shim + the Jasmin-generated .s ----------------------
$(SRC_BUILD)/mlkem%_avx2.s:
	$(MAKE) -C ../src _build/mlkem$*_avx2.s

$(BUILD)/jasmin_mlkem%.so: $(ADAPTERS)/jasmin/kem_shim.c $(SRC_BUILD)/mlkem%_avx2.s | $(BUILD)
	$(CC) $(XARCH) -O2 -fPIC -shared -I$(ADAPTERS) \
	    -DJASMIN_KEM_NS=jade_kem_mlkem_mlkem$*_amd64_avx2 -o $@ $^

$(SRC_BUILD)/mldsa%_avx2.s:
	$(MAKE) -C ../src _build/mldsa$*_avx2.s

$(BUILD)/jasmin_mldsa%.so: $(ADAPTERS)/jasmin/sig_shim.c $(SRC_BUILD)/mldsa%_avx2.s | $(BUILD)
	$(CC) $(XARCH) -O2 -fPIC -shared -I$(ADAPTERS) \
	    -DJASMIN_SIG_NS=ml_dsa_$* -o $@ $^

# ---- mlkem-native backend: shim + monolithic source + asm, AVX2 backend --
# mlkem_native_asm.S bundles the x86_64 backend assembly; NO_RANDOMIZED_API
# drops the non-derand keypair/enc (and their randombytes dependency).
MLKN_FLAGS := -mavx2 -mbmi2 \
              -DMLK_CONFIG_USE_NATIVE_BACKEND_ARITH \
              -DMLK_CONFIG_USE_NATIVE_BACKEND_FIPS202 \
              -DMLK_CONFIG_NO_RANDOMIZED_API
MLKN_SRC := $(ADAPTERS)/mlkem-native/kem_shim.c \
            $(MLKN)/mlkem_native.c $(MLKN)/mlkem_native_asm.S

$(BUILD)/mlkem-native_mlkem%.so: $(MLKN_SRC) | $(BUILD)
	$(CC) $(XARCH) -O3 -fomit-frame-pointer -fPIC -shared \
	    $(MLKN_FLAGS) -DMLK_CONFIG_PARAMETER_SET=$* \
	    -DMLK_CONFIG_NAMESPACE_PREFIX=mlkn$*_ \
	    -I$(MLKN) -I$(ADAPTERS) -o $@ $(MLKN_SRC)

# ---- mldsa-native backend: shim + monolithic source + asm, AVX2 backend --
MLDN_FLAGS := -mavx2 -mbmi2 \
              -DMLD_CONFIG_USE_NATIVE_BACKEND_ARITH \
              -DMLD_CONFIG_USE_NATIVE_BACKEND_FIPS202 \
              -DMLD_CONFIG_NO_RANDOMIZED_API
MLDN_SRC := $(ADAPTERS)/mldsa-native/sig_shim.c \
            $(MLDN)/mldsa_native.c $(MLDN)/mldsa_native_asm.S

$(BUILD)/mldsa-native_mldsa%.so: $(MLDN_SRC) | $(BUILD)
	$(CC) $(XARCH) -O3 -fomit-frame-pointer -fPIC -shared \
	    $(MLDN_FLAGS) -DMLD_CONFIG_PARAMETER_SET=$* \
	    -DMLD_CONFIG_NAMESPACE_PREFIX=mldn$*_ \
	    -I$(MLDN) -I$(ADAPTERS) -o $@ $(MLDN_SRC)

# ---- drivers (x86-64 + AVX2 host only) -----------------------------------
DLLIB := $(if $(filter Darwin,$(UNAME_S)),,-ldl)

$(BUILD)/bench: bench.c | $(BUILD)
	$(CC) $(XARCH) -O2 -o $@ bench.c $(DLLIB)

comma := ,
empty :=
space := $(empty) $(empty)

VECTORS  ?= $(wildcard vectors/*.json)
BACKENDS ?= jasmin mlkem-native
SCHEME   ?= ML-KEM-768
N        ?= 100
SCHEME_BASE = $(shell echo $(SCHEME) | tr -d '-' | tr 'A-Z' 'a-z')

.PHONY: bench-bin test compare bench
bench-bin: $(BUILD)/bench

# KAT: run each backend over the vector files
test: libs
	@for b in $(BACKENDS); do echo "== $$b =="; $(PYTHON) kat.py --backend $$b $(VECTORS) || exit $$?; done

# differential agreement across backends for one scheme
compare: libs
	$(PYTHON) compare.py --scheme $(SCHEME) --backends $(subst $(space),$(comma),$(BACKENDS)) -n $(N)

# cycle benchmark for one scheme across its built backend libraries
bench: libs $(BUILD)/bench
	$(BUILD)/bench $(SCHEME) $(wildcard $(BUILD)/*_$(SCHEME_BASE).so)

clean:
	rm -rf $(BUILD)
