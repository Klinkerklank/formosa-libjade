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
op mprod (rs : zmod list) : poly =
  BigPoly.PCM.big predT (fun r => X - polyC r) rs.

lemma mprod_nil : mprod [] = poly1.
proof. by rewrite /mprod BigPoly.PCM.big_nil. qed.

lemma mprod_cons (r : zmod) (rs : zmod list) :
  mprod (r :: rs) = (X - polyC r) * mprod rs.
proof. by rewrite /mprod BigPoly.PCM.big_consT. qed.

lemma mprod_cat (rs1 rs2 : zmod list) :
  mprod (rs1 ++ rs2) = mprod rs1 * mprod rs2.
proof. by rewrite /mprod BigPoly.PCM.big_cat. qed.

(* a member root gives a left factor of the product *)
lemma mprod_mem_factor (rs : zmod list) (r : zmod) :
  r \in rs => exists q, mprod rs = (X - polyC r) * q.
proof.
move=> hmem; exists (mprod (rem r rs)).
rewrite /mprod (BigPoly.PCM.eq_big_perm _ _ _ _ (perm_to_rem _ _ hmem)).
by rewrite BigPoly.PCM.big_consT.
qed.

lemma peval_mprod_out (rs : zmod list) (a : zmod) :
  ! (a \in rs) => peval (mprod rs) a <> Zq.zero.
proof.
elim: rs => [|r rs ih] hnin.
- rewrite mprod_nil pevalC.
  by apply Zq.ZModpRing.oner_neq0.
rewrite mprod_cons pevalM pevalB pevalX pevalC.
apply/negP => /Zq.ZModpField.mulf_eq0 [h0|h0].
- by move: h0; rewrite Zq.ZModpRing.subr_eq0; smt().
by move: h0; smt().
qed.

lemma mprod_root (rs : zmod list) (a : zmod) :
  a \in rs => root (mprod rs) a.
proof.
move=> hin; have [q ->] := mprod_mem_factor rs a hin.
by rewrite pevalM pevalB pevalX pevalC Zq.ZModpRing.subrr Zq.ZModpRing.mul0r.
qed.

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
lemma lc_XC (r : zmod) : lc (X - polyC r) = Zq.one.
proof.
rewrite (_ : X - polyC r = X + (- polyC r)) 1:// lcDl.
- by rewrite degN; smt(degC_le degX).
by rewrite lcX.
qed.

lemma deg_XC (r : zmod) : deg (X - polyC r) = 2.
proof.
rewrite (_ : X - polyC r = X + (- polyC r)) 1:// degDl.
- by rewrite degN; smt(degC_le degX).
by rewrite degX.
qed.

lemma deg_mprod (rs : zmod list) : deg (mprod rs) = 1 + size rs.
proof.
elim: rs => [|r rs ih].
- by rewrite mprod_nil deg1.
rewrite mprod_cons degM_proper.
- rewrite lc_XC Zq.ZModpRing.mul1r.
  apply /negP => h0.
  have : mprod rs = poly0 by rewrite -lc_eq0 h0.
  by rewrite -deg_eq0 ih; smt(size_ge0).
by rewrite deg_XC ih /= /#.
qed.

lemma degC_mul_le (c : zmod) (p : poly) : deg (polyC c * p) <= deg p.
proof.
case (c = Zq.zero) => [->|hc].
- by rewrite mul0r deg0 ge0_deg.
case (p = poly0) => [->|hp].
- by rewrite mulr0.
rewrite degM_proper.
- rewrite lcC.
  apply /negP => /Zq.ZModpField.mulf_eq0 [h0|h0]; 1: by apply hc.
  by move: hp; rewrite -lc_eq0 h0.
by rewrite degC hc /= /#.
qed.

(* ==================================================================== *)
(* Degree of polynomial sums                                            *)
(* ==================================================================== *)
lemma deg_big ['a] (P : 'a -> bool) (F : 'a -> poly) (s : 'a list) (n : int) :
  0 <= n => (forall x, x \in s => P x => deg (F x) <= n) =>
  deg (ZqP.BigPoly.PCA.big P F s) <= n.
proof.
move=> ge0n; elim: s => [|x s ih] hF.
- by rewrite ZqP.BigPoly.PCA.big_nil deg0.
rewrite ZqP.BigPoly.PCA.big_cons.
case (P x) => hP; last first.
- by apply ih; smt().
have h1 : deg (F x) <= n by apply hF.
have h2 : deg (ZqP.BigPoly.PCA.big P F s) <= n by apply ih; smt().
by smt(degD).
qed.

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
rewrite /lag.
have := degC_mul_le (Zq.inv (peval (mprod (rem r rs)) r)) (mprod (rem r rs)).
rewrite deg_mprod size_rem 1://.
by smt().
qed.

op interp (rs : zmod list) (f : zmod -> zmod) : poly =
  ZqP.BigPoly.PCA.big predT (fun r => polyC (f r) * lag rs r) rs.

lemma interp_evalP (rs : zmod list) (f : zmod -> zmod) (r0 : zmod) :
  uniq rs => r0 \in rs => peval (interp rs f) r0 = f r0.
proof.
move=> hu hm.
rewrite /interp peval_big.
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
rewrite /interp.
apply deg_big; 1: smt(size_ge0).
move=> r hr _.
have h1 := degC_mul_le (f r) (lag rs r).
have h2 := deg_lag rs r hu hr.
by smt().
qed.
