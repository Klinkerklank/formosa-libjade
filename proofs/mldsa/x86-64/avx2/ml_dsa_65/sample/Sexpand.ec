(* -------------------------------------------------------------------- *)
require import AllCore CoreUtils List List_extra IntDiv.

(* -------------------------------------------------------------------- *)
from Jasmin require import JWord JModel_x86.
from JazzEC require import Ml_dsa_65_avx2.

require import Avx2red.
require import Prefixarray.
require import Sha3x4. import Shake256x4.
require import Array4 Array25 Array64 Array136 Array256 Array272.
require import WArray272.

(* -------------------------------------------------------------------- *)
clone import Prefixarray.PrefixArray as PA_272_136 with
      op sizeB <- 136,
      op sizeS <- 272,
  theory AB    <- Array136,
  theory AS    <- Array272

  rename "'S" as "_272"
         "'B" as "_136"

  proof le_size by done.

(* -------------------------------------------------------------------- *)
type rho'  = W8.t Array64.t.
type wpoly = W32.t Array256.t.

(* -------------------------------------------------------------------- *)
(* the 2-block squeeze wrapper: each iteration squeezes one 136-byte    *)
(* block into every lane's next window of the 272-byte buffers          *)
lemma error_4x____shake256_squeeze_multiple_blocks_4xP (data : W8.t list Array4.t)
: hoare[
  M.error_4x____shake256_squeeze_multiple_blocks_4x :
      state \sha3for Array4.map (mk_absorbed) data
    ==>
         res.`1 \sha3for Array4.map (mk_read (136 * 2)) data
      /\ (forall i, 0 <= i < 4 =>
            let b = nth witness [res.`2; res.`3; res.`4; res.`5] i in
            Array272.sub b 0 272 = shake256_slice data.[i] 0 272)
  ].
proof.
proc.
sp.
while (0 <= i <= 2
    /\ state \sha3for Array4.map (mk_read (136 * i)) data
    /\ Array272.sub b0 0 (136 * i) = shake256_slice data.[0] 0 (136 * i)
    /\ Array272.sub b1 0 (136 * i) = shake256_slice data.[1] 0 (136 * i)
    /\ Array272.sub b2 0 (136 * i) = shake256_slice data.[2] 0 (136 * i)
    /\ Array272.sub b3 0 (136 * i) = shake256_slice data.[3] 0 (136 * i)).
- exlim i => i_.
  wp; ecall (shake256_squeezeblock4xP data i_).
  skip => &hr |> hi0 _ hst hs0 hs1 hs2 hs3 hlt r hres hblk /=.
  move: (hblk 0 _) (hblk 1 _) (hblk 2 _) (hblk 3 _) => //= hb0 hb1 hb2 hb3.
  do! split; 1,2: smt().
  - by rewrite sub_window_catE 1:/# hs0
       (shake256_slice_cat_block data.[0] i{hr} r.`2 hi0 hb0).
  - by rewrite sub_window_catE 1:/# hs1
       (shake256_slice_cat_block data.[1] i{hr} r.`3 hi0 hb1).
  - by rewrite sub_window_catE 1:/# hs2
       (shake256_slice_cat_block data.[2] i{hr} r.`4 hi0 hb2).
  by rewrite sub_window_catE 1:/# hs3
     (shake256_slice_cat_block data.[3] i{hr} r.`5 hi0 hb3).
(* entry: nothing is read yet; exit: the two windows cover 272 bytes *)
skip => &hr |> hst; split.
- by do! split; smt(size_shake256_slice size_eq0).
move=> b00 b10 b20 b30 i0 state0 hge2 hi0 hi2 hrel h0 h1 h2 h3.
have ->>: i0 = 2 by smt().
split; first by exact hrel.
move=> j hj0 hj4.
by have [->|[->|[->|->]]] /=: j = 0 \/ j = 1 \/ j = 2 \/ j = 3 by smt().
qed.

(* -------------------------------------------------------------------- *)
(* -------------------------------------------------------------------- *)
(* the abstract nibble-candidate stream: every byte yields TWO          *)
(* candidates, low nibble first; a candidate z is accepted when z < 9   *)
(* and then contributes the signed coefficient 4 - z                    *)

op saccept (z : W8.t) : bool = to_uint z < 9.

op scoeff (z : W8.t) : W32.t = W32.of_int 4 - zeroextu32 z.

op nibbles (b : W8.t) : W8.t list = [b `&` W8.of_int 15; b `>>>` 4].

op [opaque] scands (bs : W8.t list) : W8.t list = flatten (map nibbles bs).

(* -------------------------------------------------------------------- *)
lemma size_nibbles (b : W8.t) : size (nibbles b) = 2.
proof. by rewrite /nibbles. qed.

(* -------------------------------------------------------------------- *)
lemma scands_nil : scands [] = [].
proof. by rewrite /scands. qed.

hint simplify scands_nil.

lemma scands_cons (b : W8.t) (bs : W8.t list) :
  scands (b :: bs) = nibbles b ++ scands bs.
proof. by rewrite /scands /= flatten_cons. qed.

lemma scands_cat (xs ys : W8.t list) :
  scands (xs ++ ys) = scands xs ++ scands ys.
proof. by rewrite /scands map_cat flatten_cat. qed.

lemma size_scands (bs : W8.t list) : size (scands bs) = 2 * size bs.
proof.
elim: bs => [|b bs ih]; first by rewrite scands_nil.
by rewrite scands_cons size_cat size_nibbles ih /#.
qed.

(* -------------------------------------------------------------------- *)
op [opaque] sreject (bs : W8.t list) : W32.t list =
  map scoeff (filter saccept (scands bs)).

lemma srejectE (bs : W8.t list) :
  sreject bs = map scoeff (filter saccept (scands bs)).
proof. by rewrite /sreject. qed.

lemma sreject_nil : sreject [] = [].
proof. by rewrite srejectE /=. qed.

hint simplify sreject_nil.

(* no alignment premise: candidates never straddle a byte boundary *)
lemma sreject_cat (xs ys : W8.t list) :
  sreject (xs ++ ys) = sreject xs ++ sreject ys.
proof. by rewrite !srejectE scands_cat filter_cat map_cat. qed.

(* one byte = two candidates, low nibble first *)
lemma sreject1E (b : W8.t) :
  sreject [b]
  = (if saccept (b `&` W8.of_int 15)
     then [scoeff (b `&` W8.of_int 15)] else [])
    ++
    (if saccept (b `>>>` 4)
     then [scoeff (b `>>>` 4)] else []).
proof.
rewrite srejectE /scands /nibbles /= flatten_cons flatten_nil cats0 /=.
by case: (saccept (b `&` W8.of_int 15)); case: (saccept (b `>>>` 4)).
qed.

lemma sreject_cons (b : W8.t) (bs : W8.t list) :
  sreject (b :: bs) = sreject [b] ++ sreject bs.
proof. by rewrite -cat1s sreject_cat. qed.

lemma size_sreject_le (bs : W8.t list) :
  size (sreject bs) <= 2 * size bs.
proof.
rewrite srejectE size_map size_filter -size_scands.
by apply/count_size.
qed.

(* -------------------------------------------------------------------- *)
(* splitting the accepted stream at a byte offset of the buffer         *)
lemma sreject_block (a : W8.t Array272.t) (n m : int) :
  0 <= n => 0 <= m =>
  sreject (Array272.sub a 0 (n + m))
  = sreject (Array272.sub a 0 n) ++ sreject (Array272.sub a n m).
proof.
move=> hn hm; rewrite sub_cat_272 // (_ : 0 + n = n) 1:/#.
by rewrite sreject_cat.
qed.
