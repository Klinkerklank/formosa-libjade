(* -------------------------------------------------------------------- *)
(* A big array (AS, of size sizeS) viewed through block-sized windows   *)
(* (AB, of size sizeB): truncation/injection of the first block, and    *)
(* the generic sub/window lemmas shared by the ML-DSA samplers.         *)

require import AllCore List IntDiv.

from Jasmin require import JUtils JArray.

(* -------------------------------------------------------------------- *)
theory PrefixArray.
  op sizeB : int.
  op sizeS : int.

  axiom le_size : sizeB <= sizeS.

  clone import PolyArray as AB with op size <- sizeB.
  clone import PolyArray as AS with op size <- sizeS.

  op truncatea'B (a : 'a AS.t) : 'a AB.t =
    AB.init (fun i => a.[i]).

  op injecta'S (a : 'a AS.t) (b : 'a AB.t) : 'a AS.t =
    AS.init (fun i => if 0 <= i < sizeB then b.[i] else a.[i]).

  lemma truncatea'BE (a : 'a AS.t) :
    AB.init (fun i => a.[i]) = truncatea'B a.
  proof. by done. qed.

  lemma injecta'SE (a : 'a AS.t) (b : 'a AB.t) :
    AS.init (fun i => if 0 <= i < sizeB then b.[i] else a.[i])
    = injecta'S a b.
  proof. by done. qed.

  (* ------------------------------------------------------------------ *)
  lemma sub0'B (a : 'a AB.t) (base : int) : AB.sub a base 0 = [].
  proof. by rewrite /sub mkseq0. qed.

  lemma sub0'S (a : 'a AS.t) (base : int) : AS.sub a base 0 = [].
  proof. by rewrite /sub mkseq0. qed.

  hint simplify sub0'B, sub0'S.

  (* ------------------------------------------------------------------ *)
  lemma sub_cat'B (a : 'a AB.t) (off len1 len2 : int) :
    0 <= len1 => 0 <= len2 =>
       AB.sub a off (len1 + len2)
     = AB.sub a off len1 ++ AB.sub a (off + len1) len2.
  proof.
  move=> ge0_1 ge0_2; rewrite /sub mkseq_add //=; congr.
  by apply eq_in_mkseq => i rgi /=; congr; ring.
  qed.

  lemma sub_cat'S (a : 'a AS.t) (off len1 len2 : int) :
    0 <= len1 => 0 <= len2 =>
       AS.sub a off (len1 + len2)
     = AS.sub a off len1 ++ AS.sub a (off + len1) len2.
  proof.
  move=> ge0_1 ge0_2; rewrite /sub mkseq_add //=; congr.
  by apply eq_in_mkseq => i rgi /=; congr; ring.
  qed.

  (* ------------------------------------------------------------------ *)
  lemma take_sub'B (a : 'a AB.t) (k n m : int) :
    0 <= n <= m =>
    take n (AB.sub a k m) = AB.sub a k n.
  proof. by move=> h; rewrite /sub take_mkseq. qed.

  lemma take_sub'S (a : 'a AS.t) (k n m : int) :
    0 <= n <= m =>
    take n (AS.sub a k m) = AS.sub a k n.
  proof. by move=> h; rewrite /sub take_mkseq. qed.

  (* ------------------------------------------------------------------ *)
  lemma sub3E'B (a : 'a AB.t) (k : int) :
    AB.sub a k 3 = [a.[k]; a.[k + 1]; a.[k + 2]].
  proof. by rewrite /sub /mkseq -iotaredE /=. qed.

  lemma sub3E'S (a : 'a AS.t) (k : int) :
    AS.sub a k 3 = [a.[k]; a.[k + 1]; a.[k + 2]].
  proof. by rewrite /sub /mkseq -iotaredE /=. qed.

  (* ------------------------------------------------------------------ *)
  lemma sub_full'B (a : 'a AB.t) :
    AB.sub a 0 sizeB = AB.to_list a.
  proof. by rewrite /sub /to_list; apply eq_in_mkseq => i rgi /=. qed.

  lemma sub_full'S (a : 'a AS.t) :
    AS.sub a 0 sizeS = AS.to_list a.
  proof. by rewrite /sub /to_list; apply eq_in_mkseq => i rgi /=. qed.

  (* ------------------------------------------------------------------ *)
  (* writing a block into its window extends the byte prefix            *)
  lemma sub_window_catE (b : 'a AS.t) (a : 'a AB.t) (i : int) :
    0 <= i /\ i * sizeB + sizeB <= sizeS =>
    AS.sub
      (AS.init (fun j =>
         if i * sizeB <= j < i * sizeB + sizeB then a.[j - i * sizeB] else b.[j]))
      0 (sizeB * (i + 1))
    = AS.sub b 0 (sizeB * i) ++ AB.to_list a.
  proof.
  move=> rgi; apply (eq_from_nth witness).
  - rewrite AS.size_sub 1:#smt:(AB.ge0_size) size_cat AS.size_sub 1:#smt:(AB.ge0_size).
    by rewrite AB.size_to_list /#.
  move=> j; rewrite AS.size_sub 1:#smt:(AB.ge0_size) => rgj.
  rewrite AS.nth_sub 1:/# /= AS.initiE 1:/# /=.
  rewrite nth_cat AS.size_sub 1:#smt:(AB.ge0_size).
  case: (j < sizeB * i) => hcase.
  - by rewrite ifF 1:/# AS.nth_sub /#.
  by rewrite ifT 1:/# AB.get_to_list /#.
  qed.
end PrefixArray.
