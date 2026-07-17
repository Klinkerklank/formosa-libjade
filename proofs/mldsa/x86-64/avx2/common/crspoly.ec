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
require ZModP Poly.

(* ==================================================================== *)
(* The field Zq (prime q axiomatized)                                   *)
(* ==================================================================== *)
clone import ZModP.ZModField as Zq with
  op p <- q.

(* -------------------------------------------------------------------- *)
(* Polynomials over Zq, at the IDomain level: ZqP.IDPoly is the ring    *)
(* instance consumed by the generic CRT theories.                       *)
clone import Poly.Poly as ZqP with
  type coeff     <= Zq.zmod,
  theory IDCoeff <= Zq.ZModpField.

import BigCf.

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
(* Congruences modulo a polynomial                                      *)
(* ==================================================================== *)
pred peqm (m p1 p2 : poly) = exists h, p1 - p2 = h * m.

lemma peqm_refl (m p : poly) : peqm m p p.
proof.
by exists poly0; rewrite subrr mul0r.
qed.

lemma peqm_sym (m p1 p2 : poly) : peqm m p1 p2 => peqm m p2 p1.
proof.
move=> [h eh]; exists (- h).
by rewrite -opprB eh mulNr.
qed.

lemma peqm_trans (m p2 p1 p3 : poly) :
  peqm m p1 p2 => peqm m p2 p3 => peqm m p1 p3.
proof.
move=> [h1 e1] [h2 e2]; exists (h1 + h2).
have -> : p1 - p3 = (p1 - p2) + (p2 - p3).
- by rewrite addrA subrK.
by rewrite e1 e2 mulrDl.
qed.

lemma peqm_eq (m p1 p2 : poly) : p1 = p2 => peqm m p1 p2.
proof. by move=> ->; apply peqm_refl. qed.

(* the modulus is congruent to zero *)
lemma peqm_m (m : poly) : peqm m m poly0.
proof.
by exists poly1; rewrite subr0 mul1r.
qed.

lemma peqmD (m p1 p2 q1 q2 : poly) :
  peqm m p1 p2 => peqm m q1 q2 => peqm m (p1 + q1) (p2 + q2).
proof.
move=> [h1 e1] [h2 e2]; exists (h1 + h2).
have -> : p1 + q1 - (p2 + q2) = (p1 - p2) + (q1 - q2).
- by rewrite opprD addrACA.
by rewrite e1 e2 mulrDl.
qed.

lemma peqmN (m p1 p2 : poly) : peqm m p1 p2 => peqm m (- p1) (- p2).
proof.
move=> [h eh]; exists (- h).
have -> : - p1 - - p2 = -(p1 - p2).
- by rewrite opprK opprB addrC.
by rewrite eh mulNr.
qed.

lemma peqmB (m p1 p2 q1 q2 : poly) :
  peqm m p1 p2 => peqm m q1 q2 => peqm m (p1 - q1) (p2 - q2).
proof.
move=> h1 h2; apply peqmD.
- by apply h1.
by apply peqmN.
qed.

lemma peqmM (m p1 p2 q1 q2 : poly) :
  peqm m p1 p2 => peqm m q1 q2 => peqm m (p1 * q1) (p2 * q2).
proof.
move=> [h1 e1] [h2 e2]; exists (p1 * h2 + h1 * q2).
have -> : p1 * q1 - p2 * q2 = p1 * (q1 - q2) + (p1 - p2) * q2.
- rewrite mulrBr mulrBl.
  by rewrite addrA subrK.
rewrite e1 e2 mulrDl.
rewrite mulrA.
have -> : h1 * m * q2 = h1 * q2 * m.
- by rewrite -mulrA (mulrC m q2) mulrA.
by done.
qed.

(* restriction to a divisor of the modulus: the CRT-tree "descend"     *)
lemma peqm_mulm (m1 m2 p1 p2 : poly) :
  peqm (m1 * m2) p1 p2 => peqm m1 p1 p2.
proof.
move=> [h eh]; exists (h * m2).
rewrite eh -mulrA (mulrC m1 m2).
by rewrite mulrA.
qed.

(* roots of the modulus are roots of the difference *)
lemma peqm_root (m p1 p2 : poly) (a : zmod) :
  peqm m p1 p2 => root m a => root (p1 - p2) a.
proof.
move=> [h eh] hroot.
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
exists h.
by rewrite eh mulrC.
qed.

(* uniqueness: congruent polynomials of degree below the modulus are   *)
(* equal (the "isomorphism" content of a CRS)                          *)
lemma peqm_deg_eq (m p1 p2 : poly) :
  deg p1 < deg m => deg p2 < deg m => peqm m p1 p2 => p1 = p2.
proof.
move=> h1 h2 [h eh].
case (h = poly0) => [h0|hnz].
- move: eh; rewrite h0 mul0r => hsub.
  by rewrite -subr_eq0 hsub.
have hm : m <> poly0.
- by apply /negP => m0; move: h1; rewrite m0 deg0; smt(ge0_deg).
have hdeg : deg (h * m) = deg h + deg m - 1.
- apply degM_proper.
  apply /negP => /Zq.ZModpField.mulf_eq0 [h0|h0].
  + by move: hnz; rewrite -lc_eq0 h0.
  + by move: hm; rewrite -lc_eq0 h0.
have hlt : deg (p1 - p2) < deg m by smt(degB).
move: hlt; rewrite eh hdeg.
have : 1 <= deg h by rewrite deg_ge1.
by smt().
qed.

(* ==================================================================== *)
(* Products of monomials, root-based gluing                             *)
(* ==================================================================== *)
(* one gluing step: a fresh root joins the modulus *)
lemma peqm_glue1 (m p1 p2 : poly) (a : zmod) :
  peval m a <> Zq.zero => root (p1 - p2) a =>
  peqm m p1 p2 => peqm ((X - polyC a) * m) p1 p2.
proof.
move=> hm hr [h eh].
have h0 : root h a.
- move: hr; rewrite eh pevalM.
  rewrite Zq.ZModpField.mulf_eq0.
  by case=> //.
move/factor_theorem: h0 => [g eg].
exists g.
rewrite eh eg.
by rewrite (mulrC (X - polyC a) g) -mulrA.
qed.

(* gluing a root list onto a modulus *)
lemma peqm_glue (rs : zmod list) (m p1 p2 : poly) :
  uniq rs =>
  (forall r, r \in rs => peval m r <> Zq.zero) =>
  (forall r, r \in rs => root (p1 - p2) r) =>
  peqm m p1 p2 => peqm (mprod rs * m) p1 p2.
proof.
elim: rs => [|r rs ih] huniq hout hroots hpeqm.
- by rewrite mprod_nil mul1r.
rewrite mprod_cons -mulrA.
apply peqm_glue1.
- rewrite pevalM.
  apply/negP => /Zq.ZModpField.mulf_eq0 [h0|h0].
  - have := peval_mprod_out rs r _; 1: smt().
    by smt().
  have := hout r _; 1: by rewrite in_cons.
  by smt().
- by apply hroots; rewrite in_cons.
apply ih.
- by smt().
- by move=> r' hr'; apply hout; rewrite in_cons; right.
- by move=> r' hr'; apply hroots; rewrite in_cons; right.
by apply hpeqm.
qed.

(* the CRS form: congruent modulo two root-disjoint monomial products
   => congruent modulo their product *)
lemma peqm_mprod2 (rs1 rs2 : zmod list) (p1 p2 : poly) :
  uniq (rs1 ++ rs2) =>
  peqm (mprod rs1) p1 p2 => peqm (mprod rs2) p1 p2 =>
  peqm (mprod (rs1 ++ rs2)) p1 p2.
proof.
move=> hu h1 h2.
rewrite mprod_cat.
apply peqm_glue => //.
- by smt(cat_uniq).
- move=> r hr.
  apply peval_mprod_out.
  by smt(cat_uniq hasP).
move=> r hr.
apply (peqm_root (mprod rs1)) => //.
by apply mprod_root.
qed.

(* ==================================================================== *)
(* Degrees of the monomial products                                     *)
(* ==================================================================== *)
(* ==================================================================== *)
(* Lagrange interpolation over a uniq root list (the surjectivity half  *)
(* of the CRS: any assignment of values at the roots is realized by a   *)
(* polynomial of degree at most the number of roots)                    *)
(* ==================================================================== *)
op lag (rs : zmod list) (r : zmod) : poly =
  polyC (Zq.inv (peval (mprod (rem r rs)) r)) * mprod (rem r rs).

lemma lag_eval_same (rs : zmod list) (r : zmod) :
  uniq rs => r \in rs => peval (lag rs r) r = Zq.one.
proof.
move=> hu hmem.
rewrite /lag pevalM pevalC.
apply Zq.ZModpField.mulVf.
apply peval_mprod_out.
rewrite (rem_filter r rs hu) mem_filter /predC1.
by smt().
qed.

lemma lag_eval_other (rs : zmod list) (r r' : zmod) :
  uniq rs => r' \in rs => r' <> r => peval (lag rs r) r' = Zq.zero.
proof.
move=> hu hm hne.
rewrite /lag pevalM.
rewrite (mprod_root (rem r rs) r').
- rewrite (rem_filter r rs hu) mem_filter /predC1.
  by smt().
by rewrite Zq.ZModpRing.mulr0.
qed.

lemma deg_lag (rs : zmod list) (r : zmod) :
  uniq rs => r \in rs => deg (lag rs r) <= size rs.
proof.
move=> hu hm.
rewrite /lag -scalepE.
have := degZ_le (Zq.inv (peval (mprod (rem r rs)) r)) (mprod (rem r rs)).
rewrite deg_mprod size_rem 1://.
by smt().
qed.

op interp (rs : zmod list) (f : zmod -> zmod) : poly =
  ZqP.BigPoly.PCA.big predT (fun r => polyC (f r) * lag rs r) rs.

lemma interp_evalP (rs : zmod list) (f : zmod -> zmod) (r0 : zmod) :
  uniq rs => r0 \in rs => peval (interp rs f) r0 = f r0.
proof.
move=> hu hm.
rewrite /interp peval_sum.
rewrite (ZqP.BigCf.BCA.eq_big_perm _ _ _ _ (perm_to_rem _ _ hm)).
rewrite ZqP.BigCf.BCA.big_cons /predT /=.
rewrite pevalM pevalC lag_eval_same 1,2:// Zq.ZModpRing.mulr1.
rewrite ZqP.BigCf.BCA.big1_seq /=.
- move=> r hr.
  have := hr; rewrite (rem_filter r0 rs hu) mem_filter /predC1 => -[hne hmem2].
  rewrite /root pevalM pevalC (lag_eval_other rs r r0) 1:// 1:// 1:/#.
  by rewrite Zq.ZModpRing.mulr0.
by rewrite Zq.ZModpRing.addr0.
qed.

lemma deg_interp (rs : zmod list) (f : zmod -> zmod) :
  uniq rs => deg (interp rs f) <= size rs.
proof.
move=> hu.
rewrite /interp BigPoly.PCA.big_seq.
apply BigPoly.deg_sum; 1: smt(size_ge0).
move=> r /= hr.
rewrite -scalepE.
have h1 := degZ_le (f r) (lag rs r).
have h2 := deg_lag rs r hu hr.
by smt().
qed.
