/* sphincsplus SLH-DSA adapter -> common derand ABI.
 *
 * Built against the bas/fips205 branch of sphincs/sphincsplus, which follows
 * FIPS 205 (the context string, deterministic signing); the parameter set is
 * selected by -DPARAMS=sphincs-<hash>-<n><s|f>, and the same source builds
 * against the ref, sha2-avx2 and shake-avx2 trees.
 *
 * The API is already derandomised: crypto_sign_seed_keypair takes the 3n
 * bytes SK.seed || SK.prf || PK.seed, crypto_sign_signature_derand takes the
 * n bytes of opt_rand, and both signing and verification take the context. */
#include "common_abi.h"
#include "api.h"

void sig_keygen(uint8_t *vk, uint8_t *sk, const uint8_t *seed) {
  (void)crypto_sign_seed_keypair(vk, sk, seed);
}

int sig_sign(uint8_t *sig, const uint8_t *sk, const uint8_t *ctx, size_t ctx_len,
             const uint8_t *msg, size_t msg_len, const uint8_t *rnd) {
  size_t siglen = 0;
  return crypto_sign_signature_derand(sig, &siglen, msg, msg_len, ctx, ctx_len,
                                      sk, rnd);
}

int sig_verify(const uint8_t *vk, const uint8_t *ctx, size_t ctx_len,
               const uint8_t *msg, size_t msg_len, const uint8_t *sig) {
  return crypto_sign_verify(sig, CRYPTO_BYTES, msg, msg_len, ctx, ctx_len, vk);
}
