(**
  Generic kit for congruent representation systems over Zq
  (M1 of nttalg-abstraction.md).

  - Zq is the field Z/qZ (q = 8380417; primality is axiomatized via
    the [prime_p] axiom of the `ZModField` clone).
  - Polynomials over Zq come from the standard library (`Poly`); no
    quotient construction is used.  Congruence modulo m is the
    ambient-logic predicate

        peqm m p1 p2  <=>  exists h, p1 - p2 = h * m

    (an existential witness: no polynomial division theory needed).
  - The CRT machinery never mentions co-primality: bases are products
    of monomials (X - C a) with distinct roots, and gluing rests only
    on evaluation, the factor theorem and integrality.
*)

(* ==================================================================== *)
require import AllCore List Ring IntDiv StdOrder StdBigop.
(*---*) import Bigint IntOrder.

(* -------------------------------------------------------------------- *)
require import Nttlogspec.
require ZModP Poly CommAlgebra.

(* ==================================================================== *)
(* The field Zq (prime q axiomatized)                                   *)
(* ==================================================================== *)
clone import ZModP.ZModField as Zq with
  op p <- q.

(* -------------------------------------------------------------------- *)
(* Polynomials over Zq, at the Field level (Lagrange interpolation);    *)
(* the coefficient field is passed as the single bundle Zq.ZModpFieldBd *)
(* (references to Zq.ZModpRing + Zq.ZModpFieldMx), so every coefficient *)
(* slot in the chain resolves to the one ring object on Zq.zmod.        *)
clone import Poly.PolyField as ZqP with
  type coeff <= Zq.zmod,
  theory K   <= Zq.ZModpFieldBd.

import BigCf.

(* -------------------------------------------------------------------- *)
(* The commutative-algebra instance over ZqP.poly: one coherent         *)
(* substitution -- CommAlgebra.Base's ideal/CRT machinery with          *)
(* ZqP.BigPoly as the authoritative big operators (definitionally).     *)
clone import CommAlgebra.Base as ZqCA with
  type t     <= ZqP.poly,
  theory R   <= ZqP.PolyComRing,
  theory Dom <= ZqP.IDPoly,
  theory BR  <= ZqP.BigPoly { rename "BAdd" as "PCA" "BMul" as "PCM" }.

(* congruence modulo a polynomial: the generic modulus-parametric       *)
(* congruence of CommAlgebra.Base (kit: eqm_refl/sym/trans/eq, eqmP,    *)
(* eqmD/N/B/M, eqm_mod0, eqm_mulm)                                      *)
abbrev peqm (m p1 p2 : poly) = ZqCA.eqm m p1 p2.

(* ==================================================================== *)
(* Division with remainder by a monic linear factor; factor theorem     *)
(* ==================================================================== *)
lemma sdivP (p : poly) (a : zmod) :
  exists h, p = (X - polyC a) * h + polyC (peval p a).
proof.
have main : forall (xs : zmod list),
  exists h, polyL xs = (X - polyC a) * h + polyC (peval (polyL xs) a).
- elim=> [|c xs [h eh]].
  - exists poly0.
    rewrite polyL_nil peval0.
    by rewrite mulr0 addr0.
  exists (h * X + polyC (peval (polyL xs) a)).
  rewrite polyL_cons {1}eh.
  rewrite pevalD pevalC pevalMX.
  rewrite mulrDl mulrDr polyCD.
  rewrite mulrA.
  have -> : (X - polyC a) * polyC (peval (polyL xs) a)
          = polyC (peval (polyL xs) a) * X - polyC (peval (polyL xs) a * a).
  - rewrite mulrBl polyCM.
    congr.
    - by rewrite mulrC.
    by rewrite (mulrC (polyC a)).
  rewrite -(addrA ((X - polyC a) * h * X)).
  rewrite (addrC (polyC c) (polyC (peval (polyL xs) a * a))).
  rewrite (addrA
    (polyC (peval (polyL xs) a) * X - polyC (peval (polyL xs) a * a))
    (polyC (peval (polyL xs) a * a)) (polyC c)).
  rewrite subrK.
  rewrite addrCA.
  congr.
  by rewrite addrC.
have [xs [_ ->]] := surj_polyL p (deg p) _; 1: by done.
by apply main.
qed.

lemma factor_theorem (p : poly) (a : zmod) :
  root p a <=> exists h, p = (X - polyC a) * h.
proof.
split.
- move=> hroot.
  have [h eh] := sdivP p a.
  exists h.
  by rewrite eh hroot addr0.
move=> [h ->].
rewrite pevalM pevalB pevalX pevalC.
by rewrite Zq.ZModpRing.subrr Zq.ZModpRing.mul0r.
qed.

(* ==================================================================== *)
(* Congruences modulo a polynomial: the generic kit lives in ZqCA       *)
(* (eqm_refl/sym/trans/eq, eqmD/N/B/M, eqm_mod0, eqm_mulm); below,      *)
(* the facts that are genuinely about polynomials: roots and degrees    *)
(* ==================================================================== *)
(* roots of the modulus are roots of the difference *)
lemma peqm_root (m p1 p2 : poly) (a : zmod) :
  peqm m p1 p2 => root m a => root (p1 - p2) a.
proof.
move=> /eqmP [h eh] hroot.
by rewrite eh pevalM hroot Zq.ZModpRing.mulr0.
qed.

(* equal evaluation gives congruence modulo the monomial at that point *)
lemma peqm_lin_root (a : zmod) (p1 p2 : poly) :
  peval p1 a = peval p2 a => peqm (X - polyC a) p1 p2.
proof.
move=> heq.
have hroot : root (p1 - p2) a.
- by rewrite pevalB heq Zq.ZModpRing.subrr.
move/factor_theorem: hroot => [h eh].
apply/eqmP; exists h.
by rewrite eh mulrC.
qed.

(* uniqueness: congruent polynomials of degree below the modulus are   *)
(* equal (the "isomorphism" content of a CRS)                          *)
lemma peqm_deg_eq (m p1 p2 : poly) :
  deg p1 < deg m => deg p2 < deg m => peqm m p1 p2 => p1 = p2.
proof.
move=> h1 h2 /eqmP [h eh].
case (h = poly0) => [h0|hnz].
- move: eh; rewrite h0 mul0r => hsub.
  by rewrite -subr_eq0 hsub.
have hm : m <> poly0.
- by apply /negP => m0; move: h1; rewrite m0 deg0; smt(ge0_deg).
have hdeg : deg (h * m) = deg h + deg m - 1.
- apply degM_proper.
  apply /negP => /Zq.ZModpFieldMx.mulf_eq0 [h0|h0].
  + by move: hnz; rewrite -lc_eq0 h0.
  + by move: hm; rewrite -lc_eq0 h0.
have hlt : deg (p1 - p2) < deg m by smt(degB).
move: hlt; rewrite eh hdeg.
have : 1 <= deg h by rewrite deg_ge1.
by smt().
qed.

(* ==================================================================== *)
(* Co-maximality and CRT gluing for the NTT moduli                      *)
(* ==================================================================== *)
(* distinct binomials X^n - c are comaximal: constant Bezout witnesses *)
lemma comax_XnC (n : int) (c1 c2 : zmod) : c1 <> c2 =>
  ZqCA.comax (polyXn n - polyC c1) (polyXn n - polyC c2).
proof.
move=> ne; rewrite /ZqCA.comax.
exists (polyC (Zq.inv (c2 - c1))) (- polyC (Zq.inv (c2 - c1))).
rewrite mulNr -mulrBr opprB addrAC addrCA subrr addr0.
rewrite -polyCN -polyCD -polyCM.
by rewrite Zq.ZModpFieldMx.mulVf // Zq.ZModpRing.subr_eq0 eq_sym.
qed.

(* CRT gluing over a product of distinct monomials: congruence at each *)
(* monomial gives congruence modulo the product, by pairwise           *)
(* comaximality -- no root/evaluation argument                         *)
lemma peqm_mprod (rs : zmod list) (p1 p2 : poly) :
  uniq rs =>
  (forall r, r \in rs => peqm (X - polyC r) p1 p2) =>
  peqm (mprod rs) p1 p2.
proof.
move=> hu hleaf.
apply (dvdr_prodl_comax (fun r => X - polyC r)).
- move=> i j rgi rgj ne_ij; apply comax_XnC.
  by smt(index_uniq).
rewrite allP => b /mapP [r [hr ->]] /=.
by apply hleaf.
qed.

(* ==================================================================== *)
(* Degrees of the monomial products                                     *)
(* ==================================================================== *)
