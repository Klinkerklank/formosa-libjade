/* mldsa-native SIG adapter: maps the deterministic *_internal API onto the
 * common ABI. Built with -DMLD_CONFIG_NO_RANDOMIZED_API so only the internal
 * functions remain. The common ABI's sig_sign/sig_verify take a context, which
 * ML-DSA folds into the message as pre = 0x00 || len(ctx) || ctx; this shim
 * reconstructs that prefix (matching what the Jasmin entry point does). */
#include "common_abi.h"
#include "mldsa_native.h"
#include <stddef.h>
#include <string.h>

void sig_keygen(uint8_t *vk, uint8_t *sk, const uint8_t *seed) {
  (void)MLD_API_NAMESPACE(keypair_internal)(vk, sk, seed);
}

static size_t make_pre(uint8_t pre[2 + 255], const uint64_t ctx[2]) {
  const uint8_t *cb = (const uint8_t *)(uintptr_t)ctx[0];
  uint64_t clen = ctx[1];
  pre[0] = 0x00;
  pre[1] = (uint8_t)clen;
  if (clen) memcpy(pre + 2, cb, (size_t)clen);
  return (size_t)(2 + clen);
}

int sig_sign(uint8_t *sig, const uint8_t *sk, const uint64_t ctx[2],
             uint64_t msg_ptr, uint64_t msg_len, const uint8_t *rnd) {
  uint8_t pre[2 + 255];
  size_t prelen = make_pre(pre, ctx), siglen = 0;
  return MLD_API_NAMESPACE(signature_internal)(
      sig, &siglen, (const uint8_t *)(uintptr_t)msg_ptr, (size_t)msg_len, pre,
      prelen, rnd, sk, 0 /* externalmu */);
}

int sig_verify(const uint8_t *vk, const uint64_t ctx[2], uint64_t msg_ptr,
               uint64_t msg_len, const uint8_t *sig) {
  uint8_t pre[2 + 255];
  size_t prelen = make_pre(pre, ctx);
  return MLD_API_NAMESPACE(verify_internal)(
      sig, MLDSA_BYTES(MLD_CONFIG_PARAMETER_SET),
      (const uint8_t *)(uintptr_t)msg_ptr, (size_t)msg_len, pre, prelen, vk,
      0 /* externalmu */);
}
