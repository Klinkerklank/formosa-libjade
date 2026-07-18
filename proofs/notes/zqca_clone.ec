(* ====================================================================
   Goal: instantiate CommAlgebra.Base at the polynomial ring over Zq,
   sharing ONE authoritative BigComRing (ZqP.BigPoly) through the whole
   clone chain -- so that ZqCA.BR.BMul.big IS ZqP.BigPoly.PCM.big, with
   NO bridge lemma.

   Context of the two theories involved:

   * ZqP = clone Poly.PolyField over Zq.  Inside it (via PolyComRing):
       clone include BigComRing with theory CR <- PolyComRing   (-> ZqP.BigPoly)
     renamed BAdd/BMul as PCA/PCM.  So  ZqP.BigPoly.CR = ZqP.PolyComRing
     (the *ComRing* instance on ZqP.poly).
     Separately, at the IDomain level:  ZqP.IDPoly = clone Ring.IDomain
     (a *fresh* IDomain on ZqP.poly, whose internal ComRing ancestor is
     NOT ZqP.PolyComRing).

   * CommAlgebra.Base (current shape):
       type t.
       clone import IDomain as ID with type t <= t.
       clone BigComRing as BR with theory CR <= ID.     (* BR.CR = ID *)
       clone Ideal.Ideal as I with
         type t <- t, theory IDomain <- ID, theory BigDom <- BR.

   The instantiation we want:
==================================================================== *)

require import AllCore List Bigalg.
require ZModP Poly CommAlgebra.

clone import ZModP.ZModField as Zq with op p <- 8380417
  proof prime_p by admit.

print Zq.ComRing.

clone import BigComRing as BigZq
  with theory CR <- Zq.ComRing.


clone import Poly.PolyField as ZqP with
  type coeff    <= Zq.zmod,
  theory FCoeff <- Zq.ZModpField.

print ZqP.

(* ---- THE CLONE WE WANT TO MAKE WORK ---------------------------------

   Attempt A: substitute both ID and BR by the poly instances.

   clone CommAlgebra.Base as ZqCA with
     type t    <= ZqP.poly,
     theory ID <= ZqP.IDPoly,
     theory BR <= ZqP.BigPoly { rename "BAdd" as "PCA" "BMul" as "PCM" }.

   FAILS. Two observed error modes depending on how BigPoly binds CR:
     - BigPoly = `... with theory CR <- PolyComRing` (current, inlined):
         "unknown symbol: Top.ZqP.BigPoly.CR.t"  (BigPoly.CR has no
         accessible members to match BR.CR against).
     - BigPoly = `... with theory CR <= PolyComRing` (CR kept as alias):
         anomaly EcLib.EcTheoryReplay.CoreIncompatible.

   Diagnosis (my reading): Base records  BR.CR = ID.  Substituting
   ID <- ZqP.IDPoly forces  BR.CR = ZqP.IDPoly.  But the substitute
   ZqP.BigPoly has  CR = ZqP.PolyComRing.  ZqP.IDPoly and
   ZqP.PolyComRing are two DIFFERENT theory objects on ZqP.poly (one
   IDomain, one ComRing), so BR's CR slot is over-determined
   incompatibly.

   Root cause candidate: in Poly.ec, IDPoly is a fresh `clone
   Ring.IDomain`; its ComRing ancestor is not PolyComRing, and BigPoly
   is built over PolyComRing.  So there is no single ring theory on
   ZqP.poly that is simultaneously "the IDomain Base wants" and "the CR
   of the shared BigComRing".

   Question for you: what is the intended way to line these up?
   Options I can see:
     (1) Make Poly.IDPoly's ComRing ancestor BE PolyComRing (build the
         IDomain as an extension of PolyComRing rather than a fresh
         clone), so IDPoly.<ComRing> = PolyComRing = BigPoly.CR.
     (2) Change Base so BR is cloned over ID's ComRing part in a way
         that matches, or parameterise Base by the BigComRing's CR
         explicitly.
     (3) Something about the order / <= vs <- of the CR bindings.

   Below is the clone written the way I *want* it to read; uncomment to
   reproduce the anomaly.
--------------------------------------------------------------------- *)

(*
clone CommAlgebra.Base as ZqCA with
  type t    <= ZqP.poly,
  theory ID <= ZqP.IDPoly,
  theory BR <= ZqP.BigPoly { rename "BAdd" as "PCA" "BMul" as "PCM" }.
*)
