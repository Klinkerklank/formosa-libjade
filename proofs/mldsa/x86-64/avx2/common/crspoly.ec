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
(* Polynomials over Zq.  We clone the ComRing-level polynomial theory:  *)
(* the only integral-domain fact ever needed lives at the coefficient   *)
(* level and comes from Zq.ZModpField directly.                         *)
clone import Poly.PolyComRing as ZqP with
  type coeff   <= Zq.zmod,
  theory Coeff <= Zq.ZModpRing.

import BigCf.

(* ==================================================================== *)
(* Evaluation is a ring morphism                                        *)
(* ==================================================================== *)
(* range-flexible form of peval *)
lemma pevalE_ge (p : poly) (a : zmod) (n : int) : deg p <= n =>
  peval p a = BCA.bigi predT (fun i => p.[i] * Zq.ZModpRing.exp a i) 0 n.
proof.
move=> hn; rewrite /peval.
case (deg p + 1 <= n) => hcase.
- rewrite (BCA.big_cat_int (deg p + 1) 0 n) 1:#smt:(ge0_deg) 1://.
  have -> : BCA.bigi predT
              (fun (i : int) => p.[i] * Zq.ZModpRing.exp a i) (deg p + 1) n
          = Zq.zero.
  + rewrite BCA.big1_seq //=.
    move=> i /mem_range rgi.
    by rewrite gedeg_coeff 1:/# Zq.ZModpRing.mul0r.
  by rewrite Zq.ZModpRing.addr0.
have -> : n = deg p by smt().
rewrite (BCA.big_int_recr (deg p)) 1:#smt:(ge0_deg) /=.
by rewrite gedeg_coeff // Zq.ZModpRing.mul0r Zq.ZModpRing.addr0.
qed.

lemma pevalC (c : zmod) (a : zmod) : peval (polyC c) a = c.
proof.
rewrite (pevalE_ge (polyC c) a 1) 1:degC_le.
rewrite BCA.big_int1 /=.
by rewrite polyCE /= Zq.ZModpRing.expr0 Zq.ZModpRing.mulr1.
qed.

lemma peval0 (a : zmod) : peval poly0 a = Zq.zero.
proof. by rewrite pevalC. qed.

lemma pevalD (p q : poly) (a : zmod) :
  peval (p + q) a = peval p a + peval q a.
proof.
pose n := max (deg p) (deg q).
rewrite (pevalE_ge (p+q) a n) 1:#smt:(degD).
rewrite (pevalE_ge p a n) 1:/#.
rewrite (pevalE_ge q a n) 1:/#.
rewrite (BCA.eq_big_int 0 n _
  (fun i => p.[i] * Zq.ZModpRing.exp a i + q.[i] * Zq.ZModpRing.exp a i)).
- by move=> i rgi /=; rewrite polyDE Zq.ZModpRing.mulrDl.
by rewrite BCA.big_split.
qed.

lemma pevalN (p : poly) (a : zmod) : peval (- p) a = - peval p a.
proof.
have hd : deg (- p) <= deg p by rewrite degN.
rewrite (pevalE_ge (-p) a (deg p)) 1:hd.
rewrite (pevalE_ge p a (deg p)) 1://.
rewrite (BCA.eq_big_int 0 (deg p) _
  (fun i => - (p.[i] * Zq.ZModpRing.exp a i))).
- by move=> i rgi /=; rewrite polyNE Zq.ZModpRing.mulNr.
by rewrite -BCA.sumrN.
qed.

lemma pevalB (p q : poly) (a : zmod) :
  peval (p - q) a = peval p a - peval q a.
proof. by rewrite pevalD pevalN. qed.

lemma pevalMX (p : poly) (a : zmod) : peval (p * X) a = peval p a * a.
proof.
have hd : deg (p * X) <= deg p + 1.
- case (p = poly0) => [->|nz].
  - rewrite PolyComRing.mul0r.
    by smt(ge0_deg).
  have hX : X <> poly0.
  - by rewrite -deg_eq0 degX.
  have := degM_le p X nz hX.
  by rewrite degX /#.
rewrite (pevalE_ge (p * X) a (deg p + 1)) 1:hd.
rewrite (pevalE_ge p a (deg p)) 1://.
rewrite BCA.big_int_recl 1:#smt:(ge0_deg) /=.
rewrite polyMXE lt0_coeff 1:// Zq.ZModpRing.mul0r Zq.ZModpRing.add0r.
rewrite (BCA.eq_big_int 0 (deg p) _
  (fun i => p.[i] * Zq.ZModpRing.exp a i * a)).
- move=> i rgi /=.
  rewrite polyMXE /= Zq.ZModpRing.exprS 1:/#.
  by rewrite (Zq.ZModpRing.mulrC a) Zq.ZModpRing.mulrA.
by rewrite -BCA.mulr_suml.
qed.

lemma pevalX (a : zmod) : peval X a = a.
proof.
have := pevalMX poly1 a.
rewrite PolyComRing.mul1r pevalC.
by rewrite Zq.ZModpRing.mul1r.
qed.

lemma pevalZ (c : zmod) (p : poly) (a : zmod) :
  peval (c ** p) a = c * peval p a.
proof.
have hd : deg (c ** p) <= deg p by apply degZ_le.
rewrite (pevalE_ge (c ** p) a (deg p)) 1:hd.
rewrite (pevalE_ge p a (deg p)) 1://.
rewrite (BCA.eq_big_int 0 (deg p) _
  (fun i => c * (p.[i] * Zq.ZModpRing.exp a i))).
- by move=> i rgi /=; rewrite polyZE Zq.ZModpRing.mulrA.
by rewrite -BCA.mulr_sumr.
qed.

(* polyL structure lemmas used for the list inductions *)
lemma polyL_nil : polyL [<:zmod>] = poly0.
proof.
by apply poly_eqP => i ge0; rewrite polyLE poly0E /=.
qed.

lemma polyL_cons (c : zmod) (xs : zmod list) :
  polyL (c :: xs) = polyC c + polyL xs * X.
proof.
apply poly_eqP => i ge0.
rewrite polyLE polyDE polyCE polyMXE polyLE.
case (i = 0) => [->|nz] /=.
- by rewrite nth_neg // Zq.ZModpRing.addr0.
by rewrite Zq.ZModpRing.add0r /= ifF //.
qed.

lemma pevalM (p q : poly) (a : zmod) :
  peval (p * q) a = peval p a * peval q a.
proof.
have main : forall (xs : zmod list) (r : poly),
  peval (polyL xs * r) a = peval (polyL xs) a * peval r a.
- elim=> [|c xs ih] r.
  - rewrite polyL_nil PolyComRing.mul0r peval0.
    by rewrite Zq.ZModpRing.mul0r.
  rewrite polyL_cons PolyComRing.mulrDl pevalD.
  rewrite -scalepE pevalZ.
  have -> : polyL xs * X * r = polyL xs * r * X.
  - rewrite -PolyComRing.mulrA (PolyComRing.mulrC X r).
    by rewrite PolyComRing.mulrA.
  rewrite pevalMX ih.
  rewrite pevalD pevalC pevalMX.
  rewrite Zq.ZModpRing.mulrDl.
  congr.
  rewrite -Zq.ZModpRing.mulrA (Zq.ZModpRing.mulrC (peval r a) a).
  by rewrite Zq.ZModpRing.mulrA.
have [xs [_ ->]] := surj_polyL p (deg p) _; 1: by done.
by apply main.
qed.

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
    by rewrite PolyComRing.mulr0 PolyComRing.addr0.
  exists (h * X + polyC (peval (polyL xs) a)).
  rewrite polyL_cons {1}eh.
  rewrite pevalD pevalC pevalMX.
  rewrite PolyComRing.mulrDl PolyComRing.mulrDr polyCD.
  rewrite PolyComRing.mulrA.
  have -> : (X - polyC a) * polyC (peval (polyL xs) a)
          = polyC (peval (polyL xs) a) * X - polyC (peval (polyL xs) a * a).
  - rewrite PolyComRing.mulrBl polyCM.
    congr.
    - by rewrite PolyComRing.mulrC.
    by rewrite (PolyComRing.mulrC (polyC a)).
  rewrite -(PolyComRing.addrA ((X - polyC a) * h * X)).
  rewrite (PolyComRing.addrC (polyC c) (polyC (peval (polyL xs) a * a))).
  rewrite (PolyComRing.addrA
    (polyC (peval (polyL xs) a) * X - polyC (peval (polyL xs) a * a))
    (polyC (peval (polyL xs) a * a)) (polyC c)).
  rewrite PolyComRing.subrK.
  rewrite PolyComRing.addrCA.
  congr.
  by rewrite PolyComRing.addrC.
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
  by rewrite eh hroot PolyComRing.addr0.
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
by exists poly0; rewrite PolyComRing.subrr PolyComRing.mul0r.
qed.

lemma peqm_sym (m p1 p2 : poly) : peqm m p1 p2 => peqm m p2 p1.
proof.
move=> [h eh]; exists (- h).
by rewrite -PolyComRing.opprB eh PolyComRing.mulNr.
qed.

lemma peqm_trans (m p2 p1 p3 : poly) :
  peqm m p1 p2 => peqm m p2 p3 => peqm m p1 p3.
proof.
move=> [h1 e1] [h2 e2]; exists (h1 + h2).
have -> : p1 - p3 = (p1 - p2) + (p2 - p3).
- by rewrite PolyComRing.addrA PolyComRing.subrK.
by rewrite e1 e2 PolyComRing.mulrDl.
qed.

lemma peqm_eq (m p1 p2 : poly) : p1 = p2 => peqm m p1 p2.
proof. by move=> ->; apply peqm_refl. qed.

(* the modulus is congruent to zero *)
lemma peqm_m (m : poly) : peqm m m poly0.
proof.
by exists poly1; rewrite PolyComRing.subr0 PolyComRing.mul1r.
qed.

lemma peqmD (m p1 p2 q1 q2 : poly) :
  peqm m p1 p2 => peqm m q1 q2 => peqm m (p1 + q1) (p2 + q2).
proof.
move=> [h1 e1] [h2 e2]; exists (h1 + h2).
have -> : p1 + q1 - (p2 + q2) = (p1 - p2) + (q1 - q2).
- by rewrite PolyComRing.opprD PolyComRing.addrACA.
by rewrite e1 e2 PolyComRing.mulrDl.
qed.

lemma peqmN (m p1 p2 : poly) : peqm m p1 p2 => peqm m (- p1) (- p2).
proof.
move=> [h eh]; exists (- h).
have -> : - p1 - - p2 = -(p1 - p2).
- by rewrite PolyComRing.opprK PolyComRing.opprB PolyComRing.addrC.
by rewrite eh PolyComRing.mulNr.
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
- rewrite PolyComRing.mulrBr PolyComRing.mulrBl.
  by rewrite PolyComRing.addrA PolyComRing.subrK.
rewrite e1 e2 PolyComRing.mulrDl.
rewrite PolyComRing.mulrA.
have -> : h1 * m * q2 = h1 * q2 * m.
- by rewrite -PolyComRing.mulrA (PolyComRing.mulrC m q2) PolyComRing.mulrA.
by done.
qed.

(* restriction to a divisor of the modulus: the CRT-tree "descend"     *)
lemma peqm_mulm (m1 m2 p1 p2 : poly) :
  peqm (m1 * m2) p1 p2 => peqm m1 p1 p2.
proof.
move=> [h eh]; exists (h * m2).
rewrite eh -PolyComRing.mulrA (PolyComRing.mulrC m1 m2).
by rewrite PolyComRing.mulrA.
qed.

(* roots of the modulus are roots of the difference *)
lemma peqm_root (m p1 p2 : poly) (a : zmod) :
  peqm m p1 p2 => root m a => root (p1 - p2) a.
proof.
move=> [h eh] hroot.
by rewrite eh pevalM hroot Zq.ZModpRing.mulr0.
qed.

(* ==================================================================== *)
(* Products of monomials, root-based gluing                             *)
(* ==================================================================== *)
op mprod (rs : zmod list) : poly =
  foldr (fun (r : zmod) acc => (X - polyC r) * acc) poly1 rs.

lemma mprod_nil : mprod [] = poly1.
proof. by rewrite /mprod. qed.

lemma mprod_cons (r : zmod) (rs : zmod list) :
  mprod (r :: rs) = (X - polyC r) * mprod rs.
proof. by rewrite /mprod. qed.

lemma mprod_cat (rs1 rs2 : zmod list) :
  mprod (rs1 ++ rs2) = mprod rs1 * mprod rs2.
proof.
elim: rs1 => [|r rs1 ih].
- by rewrite mprod_nil cat0s PolyComRing.mul1r.
rewrite cat_cons !mprod_cons ih.
by rewrite PolyComRing.mulrA.
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
elim: rs => [|r rs ih] hin; 1: by done.
rewrite mprod_cons pevalM pevalB pevalX pevalC.
case (a = r) => [->|neq].
- by rewrite Zq.ZModpRing.subrr Zq.ZModpRing.mul0r.
rewrite ih; 1: smt().
by rewrite Zq.ZModpRing.mulr0.
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
by rewrite (PolyComRing.mulrC (X - polyC a) g) -PolyComRing.mulrA.
qed.

(* gluing a root list onto a modulus *)
lemma peqm_glue (rs : zmod list) (m p1 p2 : poly) :
  uniq rs =>
  (forall r, r \in rs => peval m r <> Zq.zero) =>
  (forall r, r \in rs => root (p1 - p2) r) =>
  peqm m p1 p2 => peqm (mprod rs * m) p1 p2.
proof.
elim: rs => [|r rs ih] huniq hout hroots hpeqm.
- by rewrite mprod_nil PolyComRing.mul1r.
rewrite mprod_cons -PolyComRing.mulrA.
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
