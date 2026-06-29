# Makefile -- assembly (.s) generation for the ML-KEM / ML-DSA entry points.
#
# Jasmin namespaces are resolved through JASMINPATH:
#   Common -> per-implementation shared code (ML-DSA only)
#   Keccak -> formosa-keccak, reached via the ./keccak symlink
#             (-> ../submodules/formosa-keccak/src/amd64)

JASMINC ?= jasminc
ARCH    ?= x86-64
JFLAGS  ?=

CC      ?= cc
PYTHON  ?= python3

BUILD   ?= _build

# Jasmin emits OS-specific assembly: the .s produced here matches the host
# (Mach-O on macOS, ELF on Linux). The x86-64 AVX2 code therefore runs on an
# x86-64 host of the SAME OS as the one that generated the .s. On an Apple
# Silicon Mac we can cross-assemble/link (clang -arch x86_64) but NOT execute
# it (Rosetta lacks AVX2); the `libs` target verifies the build there, while
# the `test-*` targets must run on an x86-64 + AVX2 host.
UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
  XARCH ?= -arch x86_64
else
  XARCH ?=
endif

KECCAK       := keccak
MLDSA_COMMON := mldsa/avx2/common

# ---- entry points -> output assembly -------------------------------------
# Discovered by wildcard, so a new parameter set is picked up as soon as its
# source directory appears:
#   ML-DSA: mldsa/avx2/<set>/mldsa.jazz   -> _build/mldsa<set>_avx2.s
#   ML-KEM: mlkem/avx2/<param>/jmlkem.jazz -> _build/mlkem<param>_avx2.s
MLDSA_S := $(patsubst mldsa/avx2/%/mldsa.jazz,$(BUILD)/mldsa%_avx2.s,\
             $(wildcard mldsa/avx2/*/mldsa.jazz))
MLKEM_S := $(patsubst mlkem/avx2/%/jmlkem.jazz,$(BUILD)/mlkem%_avx2.s,\
             $(wildcard mlkem/avx2/*/jmlkem.jazz))

TARGETS := $(MLDSA_S) $(MLKEM_S)

# ---- dependency tracking (rebuild when any included source changes) ------
KECCAK_DEPS := $(shell find -L $(KECCAK) -name '*.jinc' 2>/dev/null)
MLDSA_DEPS  := $(shell find mldsa -name '*.jinc' 2>/dev/null) $(KECCAK_DEPS)
MLKEM_DEPS  := $(shell find mlkem -name '*.jinc' 2>/dev/null) $(KECCAK_DEPS)

.PHONY: all mldsa mlkem clean
all:   $(TARGETS)
mldsa: $(MLDSA_S)
mlkem: $(MLKEM_S)

# ---- pattern rules: one per scheme, parametric in the set/param ----------
# ML-DSA needs the shared Common namespace; ML-KEM only needs Keccak.
$(BUILD)/mldsa%_avx2.s: mldsa/avx2/%/mldsa.jazz $(MLDSA_DEPS) | $(BUILD)
	env JASMINPATH="Common=$(MLDSA_COMMON):Keccak=$(KECCAK)" \
	    $(JASMINC) -arch=$(ARCH) $(JFLAGS) -o $@ $<

$(BUILD)/mlkem%_avx2.s: mlkem/avx2/%/jmlkem.jazz $(MLKEM_DEPS) | $(BUILD)
	env JASMINPATH="Keccak=$(KECCAK)" \
	    $(JASMINC) -arch=$(ARCH) $(JFLAGS) -o $@ $<

$(BUILD):
	mkdir -p $@

# ==========================================================================
#  Shared libraries (assemble + link). Buildable on Apple Silicon; only
#  loadable/runnable on an x86-64 + AVX2 host.
# ==========================================================================

# One shared library per discovered entry point.
LIBS := $(TARGETS:.s=.so)

.PHONY: libs
libs: $(LIBS)

# Every entry point exports a plain C ABI (see include/*.h); one rule turns
# each generated .s into a position-independent shared library.
$(BUILD)/%_avx2.so: $(BUILD)/%_avx2.s | $(BUILD)
	$(CC) $(XARCH) -fPIC -shared -o $@ $<

# ==========================================================================
#  Run the KATs through the single ctypes driver (x86-64 + AVX2 host only).
# ==========================================================================

VECTORS := $(wildcard tests/vectors/*.json)

.PHONY: test
test: libs
	@if [ -z "$(VECTORS)" ]; then \
	  echo "no KAT vectors in tests/vectors/ -- nothing to run"; \
	else \
	  $(PYTHON) tests/kat.py --lib-dir $(BUILD) $(VECTORS); \
	fi

clean:
	rm -rf $(BUILD)
