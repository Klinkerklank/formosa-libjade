/* Cycle-count benchmark across backends.
 *
 *   ./bench <scheme> <backend1.so> [backend2.so ...]
 *
 * dlopen's each backend's common-ABI .so, runs each derand operation
 * BENCH_ITERS times (env, default 10000) and reports median CPU cycles via
 * rdtsc. x86-64 + AVX2 only. */

#include <dlfcn.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <x86intrin.h>

/* ---- scheme table ---- */
typedef enum { KEM, SIG } kind_t;
typedef struct {
  const char *name;
  kind_t kind;
  /* KEM: pk, sk, ct, ss=32, kp_coins=64, enc_coins=32
   * SIG: vk(pk), sk, sig, seed=32, rnd=32 */
  int a, b, c;
} scheme_t;

static const scheme_t SCHEMES[] = {
    {"ML-KEM-512", KEM, 800, 1632, 768},
    {"ML-KEM-768", KEM, 1184, 2400, 1088},
    {"ML-KEM-1024", KEM, 1568, 3168, 1568},
    {"ML-DSA-44", SIG, 1312, 2560, 2420},
    {"ML-DSA-65", SIG, 1952, 4032, 3309},
    {"ML-DSA-87", SIG, 2592, 4896, 4627},
};

/* ---- common ABI signatures ---- */
typedef int (*kem_keypair_t)(uint8_t *, uint8_t *, const uint8_t *);
typedef int (*kem_enc_t)(uint8_t *, uint8_t *, const uint8_t *, const uint8_t *);
typedef int (*kem_dec_t)(uint8_t *, const uint8_t *, const uint8_t *);
typedef void (*sig_keygen_t)(uint8_t *, uint8_t *, const uint8_t *);
typedef int (*sig_sign_t)(uint8_t *, const uint8_t *, const uint64_t *, uint64_t,
                          uint64_t, const uint8_t *);
typedef int (*sig_verify_t)(const uint8_t *, const uint64_t *, uint64_t,
                            uint64_t, const uint8_t *);

static uint64_t prng_state = 0x1234567;
static void fill(uint8_t *p, size_t n) {
  for (size_t i = 0; i < n; i++) {
    prng_state = prng_state * 6364136223846793005ULL + 1442695040888963407ULL;
    p[i] = (uint8_t)(prng_state >> 33);
  }
}

static int cmp_u64(const void *x, const void *y) {
  uint64_t a = *(const uint64_t *)x, b = *(const uint64_t *)y;
  return (a > b) - (a < b);
}

#define ITERS_DEFAULT 10000

/* time `expr` ITERS times, store median cycles in *out */
#define BENCH(iters, samples, out, expr)                                       \
  do {                                                                         \
    for (size_t _i = 0; _i < (iters); _i++) {                                  \
      unsigned _aux;                                                           \
      uint64_t _t0 = __rdtscp(&_aux);                                          \
      expr;                                                                    \
      uint64_t _t1 = __rdtscp(&_aux);                                          \
      (samples)[_i] = _t1 - _t0;                                               \
    }                                                                          \
    qsort((samples), (iters), sizeof(uint64_t), cmp_u64);                      \
    *(out) = (samples)[(iters) / 2];                                           \
  } while (0)

static void bench_backend(const char *path, const scheme_t *s, size_t iters,
                          uint64_t *samples) {
  void *h = dlopen(path, RTLD_NOW | RTLD_LOCAL);
  if (!h) {
    fprintf(stderr, "  cannot load %s: %s\n", path, dlerror());
    return;
  }
  uint8_t *A = malloc((size_t)s->a), *B = malloc((size_t)s->b);
  uint8_t *C = malloc((size_t)s->c), ss[32], coins[64], seed[32], rnd[32];
  uint8_t msg[64];
  uint64_t m0 = 0, m1 = 0, m2 = 0;
  fill(coins, 64); fill(seed, 32); fill(rnd, 32); fill(msg, 64);

  if (s->kind == KEM) {
    kem_keypair_t kp = dlsym(h, "kem_keypair_derand");
    kem_enc_t enc = dlsym(h, "kem_enc_derand");
    kem_dec_t dec = dlsym(h, "kem_dec");
    kp(A, B, coins);          /* A=pk B=sk */
    enc(C, ss, A, coins);     /* C=ct ss=ss */
    BENCH(iters, samples, &m0, kp(A, B, coins));
    BENCH(iters, samples, &m1, enc(C, ss, A, coins));
    BENCH(iters, samples, &m2, dec(ss, C, B));
    printf("  %-22s keypair=%-10llu enc=%-10llu dec=%-10llu\n",
           path, (unsigned long long)m0, (unsigned long long)m1,
           (unsigned long long)m2);
  } else {
    sig_keygen_t kg = dlsym(h, "sig_keygen");
    sig_sign_t sign = dlsym(h, "sig_sign");
    sig_verify_t ver = dlsym(h, "sig_verify");
    uint64_t ctx[2] = {0, 0};
    kg(A, B, seed);                                   /* A=vk B=sk */
    sign(C, B, ctx, (uint64_t)(uintptr_t)msg, sizeof msg, rnd);  /* C=sig */
    BENCH(iters, samples, &m0, kg(A, B, seed));
    BENCH(iters, samples, &m1,
          sign(C, B, ctx, (uint64_t)(uintptr_t)msg, sizeof msg, rnd));
    BENCH(iters, samples, &m2,
          ver(A, ctx, (uint64_t)(uintptr_t)msg, sizeof msg, C));
    printf("  %-22s keygen=%-10llu sign=%-10llu verify=%-10llu\n",
           path, (unsigned long long)m0, (unsigned long long)m1,
           (unsigned long long)m2);
  }
  free(A); free(B); free(C);
  dlclose(h);
}

int main(int argc, char **argv) {
  if (argc < 3) {
    fprintf(stderr, "usage: %s <scheme> <backend.so> [backend.so ...]\n", argv[0]);
    return 2;
  }
  const scheme_t *s = NULL;
  for (size_t i = 0; i < sizeof SCHEMES / sizeof *SCHEMES; i++)
    if (!strcmp(argv[1], SCHEMES[i].name)) s = &SCHEMES[i];
  if (!s) { fprintf(stderr, "unknown scheme %s\n", argv[1]); return 2; }

  size_t iters = ITERS_DEFAULT;
  const char *e = getenv("BENCH_ITERS");
  if (e) iters = strtoul(e, NULL, 10);
  uint64_t *samples = malloc(iters * sizeof(uint64_t));

  printf("%s (median cycles over %zu iters):\n", s->name, iters);
  for (int i = 2; i < argc; i++) bench_backend(argv[i], s, iters, samples);
  free(samples);
  return 0;
}
