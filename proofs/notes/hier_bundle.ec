(* ====================================================================
   Bundles as abstract parameters -- with today's machinery only.

   On top of the mixin architecture (hier_mixin.ec), a bundle is a
   theory of REFERENCES: one type, one slot per structure level, the
   nested slots coherently threaded, and no library of its own.

   - Consumers declare ONE parameter:   clone import GrpBundle as K.
   - Instances substitute ONE theory:   theory K <= P.PB.

   The single-substitution shape also keeps every slot abstract until
   the one coherent instantiation, avoiding the concrete-vs-concrete
   matching that fails on generated members (the CoreIncompatible
   mode): matching here is always abstract-slot vs instance, which is
   the well-trodden path of every `theory Coeff <= ZModpRing` clone.
==================================================================== *)

require import AllCore List.

abstract theory Mon.
  type t.
  op e : t.
  op madd : t -> t -> t.
  axiom madd0 : forall x, madd x e = x.

  op dbl (x : t) = madd x x.
  lemma dbl0 : dbl e = e.
  proof. by rewrite /dbl madd0. qed.
end Mon.

abstract theory GrpMixin.
  type t.
  clone import Mon as M with type t <= t.
  op inv : t -> t.
  axiom maddN : forall x, M.madd (inv x) x = M.e.
end GrpMixin.

abstract theory BigMon.
  clone import Mon as M.
  op big (s : M.t list) = foldr M.madd M.e s.
  lemma big_nil : big [] = M.e.
  proof. by []. qed.
end BigMon.

(* -------------------------------------------------------------------- *)
(* the bundle: one slot per level, coherently threaded, no library      *)
abstract theory GrpBundle.
  type t.
  clone import Mon      as M with type t <= t.
  clone import GrpMixin as G with type t <= t, theory M <= M.
  clone        BigMon   as B with theory M <= M.
end GrpBundle.

(* -------------------------------------------------------------------- *)
theory P.
  clone Mon as PM with
    type t <= int, op e <= 0, op madd <= Int.(+)
    proof madd0 by smt().

  clone BigMon as PBig with theory M <= PM.

  clone GrpMixin as PG with
    type t <= int, theory M <= PM, op inv <= Int.([-])
    proof maddN by smt().

  (* the bundle instance: references to the three shared objects *)
  clone GrpBundle as PB with
    type t <= int, theory M <= PM, theory G <= PG, theory B <= PBig.
end P.

(* -------------------------------------------------------------------- *)
(* consumer: ONE abstract parameter                                     *)
abstract theory Use.
  type t.
  clone import GrpBundle as K with type t <= t.

  lemma useL (x : t) : K.B.big [K.G.inv x; x] = K.M.e.
  proof.
  rewrite /K.B.big /=.
  by rewrite K.M.madd0 K.G.maddN.
  qed.
end Use.

(* ==================================================================
   Instantiation: ONE substitution.
================================================================== *)
clone Use as U with type t <= int, theory K <= P.PB.

(* sharing is definitional, consumer lemmas transport *)
lemma shared_big (s : int list) : U.K.B.big s = P.PBig.big s.
proof. by []. qed.

lemma transported (x : int) : P.PBig.big [P.PG.inv x; x] = P.PM.e.
proof. by apply (U.useL x). qed.
