(*
 * Specification of the mask generation function MGF1 (RFC 8017), used by
 * H_msg of the SHA2 parameter sets.
 *
 * author: H.M. Yousuf 2026-11-13 (hmyousuf@nirapod.org)
 * author: Rifat Ahmed 2026-11-13 (rifatahmed@nirapod.org)
 * from: https://github.com/nirapod-labs/slhdsa-spec (commit e4a51b7)
 *
 * SPDX-FileCopyrightText: 2026 H.M. Yousuf and Rifat Ahmed
 * SPDX-License-Identifier: CC0-1.0 OR Apache-2.0
 *
 * The mask generation function MGF1 of RFC 8017 (PKCS #1 v2.2), appendix
 * B.2.1, over a hash function with output length hLen bytes. FIPS 205
 * section 11.2 uses MGF1-SHA-256 and MGF1-SHA-512 to instantiate H_msg.
 *
 * Domain. RFC 8017 rejects maskLen > 2^32 * hLen ("mask too long", step 1).
 * FIPS 205 calls MGF1 only with maskLen = m <= 49, so the error branch is
 * outside every use and is not modelled.
 *)

require import AllCore List IntDiv.
from Jasmin require import JWord.
require import Bytes FIPS180_SHA2.

(* Steps 2 to 4: T = Hash(mgfSeed || I2OSP(0, 4)) || ...
   || Hash(mgfSeed || I2OSP(ceil(maskLen / hLen) - 1, 4)), and the output is
   the leading maskLen octets of T. I2OSP(c, 4) is the 4-byte big-endian
   encoding of the counter c < 2^32. *)
op mgf1 (hash : bytes -> bytes) (hlen : int) (seed : bytes) (masklen : int) : bytes =
  take masklen
    (flatten (map (fun c => hash (seed ++ be_bytes 4 c)) (range 0 (cdiv masklen hlen)))).

op mgf1_sha256 (seed : bytes) (masklen : int) : bytes = mgf1 SHA256.sha256 32 seed masklen.
op mgf1_sha512 (seed : bytes) (masklen : int) : bytes = mgf1 SHA512.sha512 64 seed masklen.
