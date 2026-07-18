(* ====================================================================
   The algebraic-hierarchy sharing problem, minimized.

   - Mon      : a structure with a lemma library (ComRing analogue).
   - Grp      : a refinement, STDLIB-STYLE: `clone include Mon` mints a
                fresh Mon inside (IDomain/ZModField analogue).
   - BigMon   : a functor over Mon (Bigop/BigComRing analogue).
   - P        : a "carrier constructor": one Mon instance PM, the
                authoritative BigMon PBig over it, and a refinement PG
                (Poly.ec analogue: PolyComRing / BigPoly / IDPoly).
   - Use      : a consumer parameterized by a Grp, that builds its own
                BigMon over it (CommAlgebra.Base analogue).

   The final clone fails: Use.B.M is bound to G (= P.PG), while
   P.PBig.M is P.PM -- two DISTINCT theory objects over the same
   carrier, even though every operator coincides.
==================================================================== *)

require import AllCore List.

abstract theory Mon.
  type t.
  op e : t.
  op madd : t -> t -> t.
  axiom madd0 : forall x, madd e x = x.

  op dbl (x : t) = madd x x.                    (* a defined member  *)
  lemma dbl0 : dbl e = e.                       (* the lemma library *)
  proof. by rewrite /dbl madd0. qed.
end Mon.

abstract theory Grp.
  clone include Mon.                            (* fresh Mon inside! *)
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

  clone BigMon as PBig with theory M <- PM.     (* authoritative bigs; CR inlined like BigPoly *)

  clone Grp as PG with
    type t <= int, op e <= 0, op madd <= Int.(+), op inv <= Int.([-])
    proof madd0 by smt(), maddN by smt().

  clear [PM.*].                                 (* like Poly's clear of PolyComRing.* *)
end P.

(* -------------------------------------------------------------------- *)
abstract theory Use.
  clone import Grp as G.
  clone BigMon as B with theory M <= G.         (* B.M := G           *)

  lemma useL : B.big [] = G.e.
  proof. by rewrite B.big_nil. qed.
end Use.

(* ==================================================================
   THE FAILURE: we want Use at P's instances, sharing P.PBig.
   B.M was bound to G; substituting G <= P.PG and B <= P.PBig requires
   P.PBig.M (= P.PM) to be P.PG -- distinct objects => no match.
================================================================== *)
clone Use as U with theory G <= P.PG, theory B <= P.PBig.
