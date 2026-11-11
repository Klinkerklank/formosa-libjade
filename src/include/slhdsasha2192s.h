/* SLH-DSA-SHA2-192s, target avx2, profile sct.
 *
 * Common to all functions
 *   Requires:
 *     - every pointer argument points to a memory region of the size given by
 *       the macros below, and every input region is initialised;
 *     - message_pointer points to message_size initialised bytes, and
 *       context[0] points to context[1] initialised bytes;
 *     - the memory regions of a call do not overlap;
 *     - while the function runs, the caller ensures that no other thread writes
 *       to an input region, or reads or writes an output region.
 *   Ensures:
 *     - the function writes all of its output regions, and no memory outside
 *       the regions of the call;
 *     - the function keeps no state between calls.
 *   Pointers need no alignment.
 *   Constant time: the signing key and the randomness are secret; the
 *     verification key, the message, the context and the signature are public.
 *     The code declassifies:
 *     - in keygen, the verification key (PK.seed and PK.root);
 *     - in sign:
 *       - PK.seed, read from the signing key, which is part of the
 *         verification key;
 *       - the message digest H_msg(R, PK.seed, PK.root, M'), which is a function
 *         of public values (the signature randomizer R, the verification key,
 *         the message and the context) and selects the FORS leaves and the
 *         hypertree path;
 *       - the FORS signature and each XMSS signature as they are computed, and
 *         the signature, which are output;
 *     - in verify, the message digest, as in sign.
 *   The implementation is checked for CT and SCT. */
#ifndef SLHDSASHA2192S_AVX2_H
#define SLHDSASHA2192S_AVX2_H

#include <stdint.h>
#include <stddef.h>

#define SLHDSASHA2192S_VERIFICATION_KEY_SIZE   48
#define SLHDSASHA2192S_SIGNING_KEY_SIZE        96
#define SLHDSASHA2192S_SIGNATURE_SIZE          16224
#define SLHDSASHA2192S_KEYGEN_RANDOMNESS_SIZE  72
#define SLHDSASHA2192S_SIGN_RANDOMNESS_SIZE    24

/* Requires: randomness holds SK.seed || SK.prf || PK.seed.
 * Ensures: verification_key and signing_key hold the output of
 *   slh_keygen_internal(SK.seed, SK.prf, PK.seed) (Algorithm 18 in FIPS 205),
 *   which slh_keygen (Algorithm 21) returns for that randomness. */
void slh_dsa_sha2192s_keygen(
    uint8_t *verification_key,
    uint8_t *signing_key,
    const uint8_t *randomness);

/* Ensures: if context[1] > 255, returns -1 and does not write signature;
 *   otherwise, returns 0 and writes to signature the output of slh_sign
 *   (Algorithm 22 in FIPS 205) on the message and the context under
 *   signing_key, with randomness as opt_rand. Passing PK.seed (the third
 *   quarter of signing_key) as randomness gives the deterministic variant. */
int slh_dsa_sha2192s_sign(
    uint8_t *signature,
    const uint8_t *signing_key,
    const uint64_t context[2],
    uint64_t message_pointer,
    uint64_t message_size,
    const uint8_t *randomness);

/* Ensures: if context[1] > 255, returns -1; otherwise, returns 0 if slh_verify
 *   (Algorithm 24 in FIPS 205) accepts signature on the message and the
 *   context under verification_key, and a nonzero value otherwise. */
int slh_dsa_sha2192s_verify(
    const uint8_t *verification_key,
    const uint64_t context[2],
    uint64_t message_pointer,
    uint64_t message_size,
    const uint8_t *signature);

#endif /* SLHDSASHA2192S_AVX2_H */
