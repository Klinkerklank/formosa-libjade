(* ====================================================================
   Goal: instantiate CommAlgebra.Base at the polynomial ring over Zq,
   sharing ONE authoritative BigComRing (ZqP.BigPoly) through the whole
   clone chain -- so that ZqCA.BR.BMul.big IS ZqP.BigPoly.PCM.big, with
   NO bridge lemma.

   RESOLVED by the mixin/bundle rework of the algebraic hierarchy
   (comm-algebra branch):

   * Poly.Poly no longer mints a fresh Ring.IDomain (the old IDPoly)
     next to PolyComRing.  It takes CR : ComRing + CoeffDom :
     IDomainMixin as parameters, realizes PolyComRing's unit/invr
     definitionally, and grows the domain level as the delta-only
     mixin  IDPoly : IDomainMixin  over the ONE PolyComRing object.
   * Poly.PolyField takes the coefficient field as a single
     FieldBundle parameter K (concrete instance: Zq.ZModpFieldBd).
   * BigPoly keeps its CR slot as a navigable alias (<=), so it stays
     substitutable from outside.
   * Ideal.Ideal and CommAlgebra.Base are parameterized the same way
     (R : ComRing + Dom : IDomainMixin), with Base owning BR and
     pushing it into Ideal with <-.

   The instantiation is now one coherent substitution:
==================================================================== *)

require import AllCore List.
require ZModP Poly CommAlgebra.

clone import ZModP.ZModField as Zq with op p <- 8380417
  proof prime_p by admit.

clone import Poly.PolyField as ZqP with
  type coeff <= Zq.zmod,
  theory K   <= Zq.ZModpFieldBd.

clone CommAlgebra.Base as ZqCA with
  type t     <= ZqP.poly,
  theory R   <= ZqP.PolyComRing,
  theory Dom <= ZqP.IDPoly,
  theory BR  <= ZqP.BigPoly { rename "BAdd" as "PCA" "BMul" as "PCM" }.

(* the sharing that was the whole point: definitional, no bridge *)
lemma shared_big (P : ZqP.poly -> bool) (F : ZqP.poly -> ZqP.poly) (s : ZqP.poly list) :
  ZqCA.BR.BMul.big P F s = ZqP.BigPoly.PCM.big P F s.
proof. by []. qed.
