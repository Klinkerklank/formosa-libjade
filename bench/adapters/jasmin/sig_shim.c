/* jasmin SIG adapter: maps the Jasmin-exported ML-DSA and SLH-DSA symbols onto
 * the common ABI. JASMIN_SIG_NS is the namespace, e.g. -DJASMIN_SIG_NS=ml_dsa_65
 * or -DJASMIN_SIG_NS=slh_dsa_sha2128f
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

/* The Jasmin entry points take the context and message as reg-u64 addresses;
 * convert the common ABI's plain pointer + length here. */
void sig_keygen(uint8_t *vk, uint8_t *sk, const uint8_t *rnd) {
  JS(_keygen)(vk, sk, rnd);
}
int sig_sign(uint8_t *sig, const uint8_t *sk, const uint8_t *ctx, size_t ctx_len,
             const uint8_t *msg, size_t msg_len, const uint8_t *rnd) {
  const uint64_t ctx2[2] = {(uint64_t)(uintptr_t)ctx, (uint64_t)ctx_len};
  return JS(_sign)(sig, sk, ctx2, (uint64_t)(uintptr_t)msg, (uint64_t)msg_len,
                   rnd);
}
int sig_verify(const uint8_t *vk, const uint8_t *ctx, size_t ctx_len,
               const uint8_t *msg, size_t msg_len, const uint8_t *sig) {
  const uint64_t ctx2[2] = {(uint64_t)(uintptr_t)ctx, (uint64_t)ctx_len};
  return JS(_verify)(vk, ctx2, (uint64_t)(uintptr_t)msg, (uint64_t)msg_len, sig);
}
