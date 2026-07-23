(* -------------------------------------------------------------------- *)
(* Agreement of a polynomial with a prefix of an accepted-coefficient   *)
(* stream: the sampler loop invariants of Aexpand and Sexpand.          *)
(* -------------------------------------------------------------------- *)
require import AllCore List.

from Jasmin require import JWord.

require import Array256.

(* -------------------------------------------------------------------- *)
op [opaque] agree (p : W32.t Array256.t) (base : int) (coeffs : W32.t list) =
  forall i,
       0 <= i < size coeffs
    => 0 <= i + base < 256
    => p.[base + i] = nth W32.zero coeffs i.

(* -------------------------------------------------------------------- *)
lemma agree_nil (p : W32.t Array256.t) (base : int) : agree p base [].
proof. by rewrite /agree /= /#. qed.

hint simplify agree_nil.

(* -------------------------------------------------------------------- *)
lemma agree_set (p : W32.t Array256.t) (l : W32.t list) (c : W32.t) :
  size l < 256 => agree p 0 l =>
  agree p.[size l <- c] 0 (l ++ [c]).
proof.
move=> hsz; rewrite /agree => hag i /=; rewrite size_cat /= => rgi rgb.
rewrite Array256.get_setE 1:/# nth_cat.
case: (i = size l) => [-> /=|ne] //.
by rewrite ifT 1:/#; smt().
qed.

(* -------------------------------------------------------------------- *)
lemma agree_full (p : W32.t Array256.t) (l1 l2 : W32.t list) :
  256 <= size l1 => agree p 0 l1 =>
  agree p 0 (l1 ++ l2).
proof.
move=> hsz; rewrite /agree => hag i /=; rewrite size_cat => rgi rgb.
by rewrite nth_cat ifT 1:/#; smt().
qed.
