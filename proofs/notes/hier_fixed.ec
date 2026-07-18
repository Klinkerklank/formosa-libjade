(* ====================================================================
   The fix, with NO language support.  Same Mon / Grp / BigMon / P /
   Use as in hier_problem.ec; the only changes are discipline:

     (1) auxiliary-functor parameters are bound with <= (kept
         navigable), never <- (which erases the subtheory's members
         and makes any later substitution against it fail with
         "unknown symbol ...M.t");

     (2) the base instance keeps its full library: no `clear [PM.*]`.
         (What may be cleared is the *refinement's* duplicated
         library, never the base that auxiliary instances point at.)

   Then theory substitution -- structural at depth 1 -- unfolds
   through the shared operator aliases: the consumer's aux slot B,
   nominally built over the refinement G, accepts the authoritative
   aux P.PBig built over the base PM, because every member of B
   matches a member of PBig up to unfolding (both sides reduce to the
   same Int operators).  No bridge lemma, and the sharing is
   definitional (see the final lemmas).
==================================================================== *)

require import AllCore List.

abstract theory Mon.
  type t.
  op e : t.
  op madd : t -> t -> t.
  axiom madd0 : forall x, madd e x = x.

  op dbl (x : t) = madd x x.
  lemma dbl0 : dbl e = e.
  proof. by rewrite /dbl madd0. qed.
end Mon.

abstract theory Grp.
  clone include Mon.
  op inv : t -> t.
  axiom maddN : forall x, madd (inv x) x = e.
end Grp.

abstract theory BigMon.
  clone import Mon as M.
  op big (s : M.t list) = foldr M.madd M.e s.
  lemma big_nil : big [] = M.e.
  proof. by []. qed.
end BigMon.

(* -------------------------------------------------------------------- *)
theory P.
  clone Mon as PM with
    type t <= int, op e <= 0, op madd <= Int.(+)
    proof madd0 by smt().

  clone BigMon as PBig with theory M <= PM.     (* (1): <=, navigable *)

  clone Grp as PG with
    type t <= int, op e <= 0, op madd <= Int.(+), op inv <= Int.([-])
    proof madd0 by smt(), maddN by smt().

  (* (2): no clear of PM *)
end P.

(* -------------------------------------------------------------------- *)
abstract theory Use.
  clone import Grp as G.
  clone BigMon as B with theory M <= G.

  lemma useL : B.big [] = G.e.
  proof. by rewrite B.big_nil. qed.
end Use.

(* ==================================================================
   The instantiation that failed in hier_problem.ec now goes through:
   B.M is nominally G (= P.PG) while P.PBig.M is P.PM, but matching
   unfolds both to the same operators.
================================================================== *)
clone Use as U with theory G <= P.PG, theory B <= P.PBig.

(* Sharing is definitional: U's big IS P.PBig's big ... *)
lemma shared_big (s : int list) : U.B.big s = P.PBig.big s.
proof. by []. qed.

(* ... and the consumer's lemmas hold of the authoritative instance. *)
lemma transported : P.PBig.big [] = P.PG.e.
proof. by apply U.useL. qed.
