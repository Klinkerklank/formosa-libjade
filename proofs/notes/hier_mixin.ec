(* ====================================================================
   The mixin architecture, minimized -- no language support needed.

   Refinements are DELTA-ONLY theories taking the parent structure as
   a named parameter, instead of `clone include`-ing a fresh copy:

     - exactly ONE library per structure level per carrier;
     - no duplicated generated members (intmul/AddMonoid analogues),
       hence no structural-matching fragility and nothing to clear;
     - consumers take one parameter per level; coherent substitution
       makes every nested slot resolve to the SAME object, so matching
       is nominal (object identity), not structural unfolding.

   GrpMixin below is the IDomainMixin/FieldMixin analogue.
==================================================================== *)

require import AllCore List.

abstract theory Mon.
  type t.
  op e : t.
  op madd : t -> t -> t.
  axiom madd0 : forall x, madd x e = x.

  op dbl (x : t) = madd x x.                (* generated member: exists ONCE *)
  lemma dbl0 : dbl e = e.
  proof. by rewrite /dbl madd0. qed.
end Mon.

(* refinement as a mixin: parent by reference, delta only *)
abstract theory GrpMixin.
  type t.
  clone import Mon as M with type t <= t.

  op inv : t -> t.
  axiom maddN : forall x, M.madd (inv x) x = M.e.

  (* only the NEW lemmas live here *)
  lemma inv_can (x : t) : M.madd (inv x) x = M.e.
  proof. by apply maddN. qed.
end GrpMixin.

abstract theory BigMon.
  clone import Mon as M.
  op big (s : M.t list) = foldr M.madd M.e s.
  lemma big_nil : big [] = M.e.
  proof. by []. qed.
end BigMon.

(* -------------------------------------------------------------------- *)
(* carrier constructor: ONE Mon instance; aux and refinement over IT    *)
theory P.
  clone Mon as PM with
    type t <= int, op e <= 0, op madd <= Int.(+)
    proof madd0 by smt().

  clone BigMon as PBig with theory M <= PM.

  clone GrpMixin as PG with
    type t <= int, theory M <= PM, op inv <= Int.([-])
    proof maddN by smt().
end P.

(* -------------------------------------------------------------------- *)
(* consumer: one parameter per level, coherently threaded               *)
abstract theory Use.
  type t.
  clone import Mon      as M with type t <= t.
  clone import GrpMixin as G with type t <= t, theory M <= M.
  clone        BigMon   as B with theory M <= M.

  lemma useL (x : t) : B.big [G.inv x; x] = M.e.
  proof.
  rewrite /B.big /=.
  by rewrite M.madd0 G.maddN.
  qed.
end Use.

(* ==================================================================
   Instantiation: every slot names its level's unique object; the
   nested slots (G.M, B.M) resolve to P.PM on both sides -- nominal
   identity, no structural unfolding needed anywhere.
================================================================== *)
clone Use as U with
  type t <= int, theory M <= P.PM, theory G <= P.PG, theory B <= P.PBig.

(* sharing is definitional, and consumer lemmas transport *)
lemma shared_big (s : int list) : U.B.big s = P.PBig.big s.
proof. by []. qed.

lemma transported (x : int) : P.PBig.big [P.PG.inv x; x] = P.PM.e.
proof. by apply (U.useL x). qed.
