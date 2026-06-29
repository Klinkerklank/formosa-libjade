/* jasmin SIG adapter: maps the Jasmin-exported ML-DSA symbols onto the common
 * ABI. JASMIN_SIG_NS is the namespace, e.g. -DJASMIN_SIG_NS=ml_dsa_65
 * Linked against the corresponding Jasmin .s. */
#include "common_abi.h"

#define PASTE_(a, b) a##b
#define PASTE(a, b) PASTE_(a, b)
#define JS(suf) PASTE(JASMIN_SIG_NS, suf)

extern void JS(_keygen)(uint8_t *, uint8_t *, const uint8_t *);
extern int JS(_sign)(uint8_t *, const uint8_t *, const uint64_t[2], uint64_t,
                     uint64_t, const uint8_t *);
extern int JS(_verify)(const uint8_t *, const uint64_t[2], uint64_t, uint64_t,
                       const uint8_t *);

void sig_keygen(uint8_t *vk, uint8_t *sk, const uint8_t *rnd) {
  JS(_keygen)(vk, sk, rnd);
}
int sig_sign(uint8_t *sig, const uint8_t *sk, const uint64_t ctx[2],
             uint64_t msg_ptr, uint64_t msg_len, const uint8_t *rnd) {
  return JS(_sign)(sig, sk, ctx, msg_ptr, msg_len, rnd);
}
int sig_verify(const uint8_t *vk, const uint64_t ctx[2], uint64_t msg_ptr,
               uint64_t msg_len, const uint8_t *sig) {
  return JS(_verify)(vk, ctx, msg_ptr, msg_len, sig);
}
