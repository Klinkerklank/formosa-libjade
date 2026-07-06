/* pq-crystals Dilithium SIG adapter -> common derand ABI.
 *
 * Parameter set is selected by -DDILITHIUM_MODE (2/3/5 -> ML-DSA-44/65/87);
 * sign.h maps crypto_sign_* onto the DILITHIUM_NAMESPACE symbols.
 *
 * Dilithium has no derandomized keypair: crypto_sign_keypair draws its 32-byte
 * seed from randombytes(). This file provides randombytes() (the tree's own is
 * excluded from the build) so sig_keygen() feeds the supplied seed into the
 * single SEEDBYTES draw, making keygen deterministic. Signing/verifying use the
 * *_internal entry points, which take the explicit rnd and the FIPS-204
 * pre = 0x00 || len(ctx) || ctx prefix. */
#include "common_abi.h"
#include "sign.h"
#include "params.h"
#include <stddef.h>
#include <string.h>

/* ---- deterministic randombytes: feeds the KAT seed into keypair ---------- */
static const uint8_t *g_seed;
static size_t g_seed_len;

void randombytes(uint8_t *out, size_t outlen) {
  if (g_seed && outlen <= g_seed_len) {
    memcpy(out, g_seed, outlen);
    g_seed += outlen;
    g_seed_len -= outlen;
  } else {
    /* No seed pending (non-derand paths); zero-fill as a safe default. */
    memset(out, 0, outlen);
  }
}

void sig_keygen(uint8_t *vk, uint8_t *sk, const uint8_t *seed) {
  g_seed = seed;
  g_seed_len = SEEDBYTES;
  (void)crypto_sign_keypair(vk, sk);
  g_seed = NULL;
  g_seed_len = 0;
}

static size_t make_pre(uint8_t pre[2 + 255], const uint8_t *ctx,
                       size_t ctx_len) {
  pre[0] = 0x00;
  pre[1] = (uint8_t)ctx_len;
  if (ctx_len) memcpy(pre + 2, ctx, ctx_len);
  return 2 + ctx_len;
}

int sig_sign(uint8_t *sig, const uint8_t *sk, const uint8_t *ctx, size_t ctx_len,
             const uint8_t *msg, size_t msg_len, const uint8_t *rnd) {
  uint8_t pre[2 + 255];
  size_t prelen = make_pre(pre, ctx, ctx_len), siglen = 0;
  return crypto_sign_signature_internal(sig, &siglen, msg, msg_len, pre, prelen,
                                        rnd, sk);
}

int sig_verify(const uint8_t *vk, const uint8_t *ctx, size_t ctx_len,
               const uint8_t *msg, size_t msg_len, const uint8_t *sig) {
  uint8_t pre[2 + 255];
  size_t prelen = make_pre(pre, ctx, ctx_len);
  return crypto_sign_verify_internal(sig, CRYPTO_BYTES, msg, msg_len, pre,
                                     prelen, vk);
}
