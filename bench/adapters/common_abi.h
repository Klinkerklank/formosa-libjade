/* Common derand ABI shared by every backend's adapter.
 *
 * Each built shared library is one (backend, scheme) pair and exports exactly
 * these fixed symbols, so the test/bench drivers load a .so and call the same
 * names regardless of which library is underneath. Buffer sizes are owned by
 * the drivers (per scheme), not declared here.
 */
#ifndef BENCH_COMMON_ABI_H
#define BENCH_COMMON_ABI_H

#include <stdint.h>

/* ---- KEM (ML-KEM) -- deterministic API ---- */
int kem_keypair_derand(uint8_t *public_key, uint8_t *secret_key,
                       const uint8_t *coins);
int kem_enc_derand(uint8_t *ciphertext, uint8_t *shared_secret,
                   const uint8_t *public_key, const uint8_t *coins);
int kem_dec(uint8_t *shared_secret, const uint8_t *ciphertext,
            const uint8_t *secret_key);

/* ---- SIG (ML-DSA) -- deterministic API ----
 * context is [pointer, size]; message is a raw pointer + length, matching the
 * Jasmin reg ui64 ABI. */
void sig_keygen(uint8_t *verification_key, uint8_t *signing_key,
                const uint8_t *randomness);
int sig_sign(uint8_t *signature, const uint8_t *signing_key,
             const uint64_t context[2], uint64_t message_pointer,
             uint64_t message_size, const uint8_t *randomness);
int sig_verify(const uint8_t *verification_key, const uint64_t context[2],
               uint64_t message_pointer, uint64_t message_size,
               const uint8_t *signature);

#endif /* BENCH_COMMON_ABI_H */
