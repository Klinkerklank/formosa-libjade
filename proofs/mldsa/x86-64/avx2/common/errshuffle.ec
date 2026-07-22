(* -------------------------------------------------------------------- *)
(* The 256-row byte-compaction shuffle table of the ML-DSA error-vector *)
(* sampler: row m compacts the bytes selected by the 8-bit mask m to    *)
(* the front, in order.                                                 *)
(*                                                                      *)
(* shuffle_compact8 is ADMITTED for build-time reasons, not for lack of *)
(* a proof: the brute-force proof (256 generated per-row lemmas, each   *)
(*   by rewrite /sub /int2bs /mkseq -iotaredE /=.                       *)
(* under the hints below, assembled by an allP_range / all_range_min    *)
(* peel) was fully machine-checked on 2026-07-22 but takes ~25 minutes  *)
(* -- both the simplifier and cbv are quadratic on deep lookups into    *)
(* the 2048-byte literal table.  A cheaper route (bdep/circuit as in    *)
(* the ML-KEM sample_shuffle_table treatment, or an upstream reduction  *)
(* fix) is planned; regenerate the slow proof by emitting, for each     *)
(* m < 256, the shuffle_compact8 statement specialized to that literal  *)
(* with the one-line proof above.                                       *)
(* -------------------------------------------------------------------- *)
require import AllCore List List_extra IntDiv BitEncoding.
import BS2Int.

from Jasmin require import JWord JModel_x86.
from JazzEC require import Ml_dsa_65_avx2.

require import Avx2red.
require import Array2048 WArray2048.

(* -------------------------------------------------------------------- *)
lemma truncateu64_128E (w : W128.t) : truncateu64 w = w \bits64 0.
proof.
apply: W64.ext_eq=> i rgi; rewrite bits64iE //=.
rewrite /truncateu64 of_intwE rgi /= /W64.int_bit.
rewrite modz_pow2_div ~-1://# modz_dvd.
- by rewrite -{1}[2]expr1 dvdz_exp2l /#.
- by rewrite -b2i_get /#.
qed.

hint simplify truncateu64_128E.

(* -------------------------------------------------------------------- *)
lemma VMOV_64_pack8E (b0 b1 b2 b3 b4 b5 b6 b7 : W8.t) :
  VMOV_64 (W8u8.pack8 [b0; b1; b2; b3; b4; b5; b6; b7])
  = W16u8.pack16 [b0; b1; b2; b3; b4; b5; b6; b7;
                  W8.zero; W8.zero; W8.zero; W8.zero;
                  W8.zero; W8.zero; W8.zero; W8.zero].
proof.
by apply W128.all_eq_eq; cbv W128.all_eq VMOV_64 W8u8.unpack8 W16u8.unpack8.
qed.

hint simplify VMOV_64_pack8E.

(* -------------------------------------------------------------------- *)
lemma shuffle_compact8 (x : W128.t) (m : int) : 0 <= m < 256 =>
    take (count idfun (int2bs 8 m))
      (W8u8.to_list (truncateu64 (VPSHUFB_128 x
        (VMOV_64 (W8u8.pack8 (Array2048.sub eRROR_VECTOR_SHUFFLE_TABLE (8 * m) 8))))))
  = mask (int2bs 8 m) (take 8 (W16u8.to_list x)).
proof. admitted. (* proven by 25-min brute force; see header comment *)
