(* -------------------------------------------------------------------- *)
(* The rejection-sampling stream algebra shared by the ML-DSA samplers: *)
(* a byte stream decodes to candidates, accepted candidates map to      *)
(* coefficients; plus the XOF-slice and staged four-lane layers.        *)
(*                                                                      *)
(* Instances: Aexpand (3-byte candidates, align 3, coeff = idfun) and   *)
(* Sexpand (nibbles, align 1, coeff = 4 - z).                           *)
(* -------------------------------------------------------------------- *)
require import AllCore List IntDiv BitEncoding.
import BitChunking.

from Jasmin require import JWord JUtils.

require import Agree.
require import Array4 Array256.

(* -------------------------------------------------------------------- *)
abstract theory RejStream.

type cand.

(* the primitive decoder of one align-sized group of bytes             *)
op dec1  : W8.t list -> cand list.
op align : int.

axiom gt0_align : 0 < align.

op accept : cand -> bool.
op coeff  : cand -> W32.t.

(* decoding is group-local: the candidate stream of a byte stream      *)
op decode (bs : W8.t list) : cand list =
  flatten (map dec1 (chunk align bs)).

lemma decode_nil : decode [] = [].
proof. by rewrite /decode chunk_nil. qed.

lemma decode_cat (xs ys : W8.t list) :
  align %| size xs => decode (xs ++ ys) = decode xs ++ decode ys.
proof.
by move=> h; rewrite /decode chunk_cat // map_cat flatten_cat.
qed.

(* -------------------------------------------------------------------- *)
op [opaque] reject (bs : W8.t list) : W32.t list =
  map coeff (filter accept (decode bs)).

lemma rejectE (bs : W8.t list) :
  reject bs = map coeff (filter accept (decode bs)).
proof. by rewrite /reject. qed.

lemma reject_nil : reject [] = [].
proof. by rewrite rejectE decode_nil. qed.

hint simplify reject_nil.

lemma reject_cat (xs ys : W8.t list) :
  align %| size xs =>
  reject (xs ++ ys) = reject xs ++ reject ys.
proof. by move=> h; rewrite !rejectE decode_cat // filter_cat map_cat. qed.

(* -------------------------------------------------------------------- *)
(* the XOF byte-stream layer                                            *)
op rate  : int.
op slice : W8.t list -> int -> int -> W8.t list.

axiom size_slice (n : W8.t list) (i m : int) :
  0 <= m => size (slice n i m) = m.
axiom slice_cat (n : W8.t list) (i m l : int) :
  0 <= m => 0 <= l =>
  slice n i (m + l) = slice n i m ++ slice n (i + m) l.

lemma reject_slice_block (n : W8.t list) (m l : int) :
  0 <= m => 0 <= l => align %| m =>
  reject (slice n 0 (m + l))
  = reject (slice n 0 m) ++ reject (slice n m l).
proof.
move=> hm hl hdvd; rewrite slice_cat //=.
by rewrite reject_cat // size_slice.
qed.

(* -------------------------------------------------------------------- *)
(* a sampled polynomial holds the accepted prefix, count capped at 256  *)
op reject_ok (nonce : W8.t list) (sz : int) (p : W32.t Array256.t) (filled : int) =
     agree p 0 (reject (slice nonce 0 sz))
  /\ filled = min 256 (size (reject (slice nonce 0 sz))).

(* a finished lane satisfies the invariant at any longer prefix         *)
lemma reject_ok_full (nonce : W8.t list) (m l : int) (p : W32.t Array256.t) :
  0 <= m => 0 <= l => align %| m =>
  reject_ok nonce m p 256 =>
  reject_ok nonce (m + l) p 256.
proof.
move=> hm hl hdvd @/reject_ok [hag hf].
rewrite reject_slice_block //; split.
- by apply agree_full; [smt(size_ge0) | exact hag].
by smt(size_cat size_ge0).
qed.

(* -------------------------------------------------------------------- *)
(* the four sampling lanes, staged: lanes below j are one block ahead   *)
op lanes_ok (data : W8.t list Array4.t) (k j : int)
            (ps : W32.t Array256.t list) (fs : W64.t list) =
  forall i, 0 <= i < 4 =>
    reject_ok data.[i] (rate * (k + b2i (i < j)))
      (nth witness ps i) (to_uint (nth witness fs i)).

(* -------------------------------------------------------------------- *)
(* each lane buffer starts with the block squeezed at offset rate * k   *)
type buf.

op headb : buf -> W8.t list.

op blocks_ok (data : W8.t list Array4.t) (k : int) (bs : buf list) =
  forall i, 0 <= i < 4 =>
    headb (nth witness bs i) = slice data.[i] (rate * k) rate.

end RejStream.
