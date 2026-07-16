(**
  The polynomial view of the NTT correctness results
  (M2 of nttalg-abstraction.md).

  Word arrays are linked to polynomials over Zq in the ambient logic:
  `pofw a` is the polynomial with coefficients `inzmod (to_sint a.[i])`.
  The forward invariant of `Nttalg`/`Fnttalg` is restated as a
  congruence of `Crspoly`:

      peqm (basis k j) (pofw p) (pofw_blk (reduce_tree p k) (j*2^k) (2^k))

  where `basis k j = X^(2^k) - C (zZ ^ E k j)` -- block (k, j) of the
  butterfly network is the residue of P modulo the basis element.
  At k = 0 this is evaluation:

      peval (pofw p) (zZ ^ E 0 j) = inzmod (to_sint (ntt p).[j]).

  Everything here is *derived* from the int-level theorems; no program
  or butterfly reasoning is redone.  The constructive core is
  `xnp_fold`: reduction of a coefficient list modulo X^n - c, by
  induction on the list of n-chunks, with the residue coefficients
  produced directly in the `nttsum` shape.
*)

(* ==================================================================== *)
require import AllCore List Ring IntDiv StdOrder StdBigop.
(*---*) import Bigint BIA IntOrder.

(* -------------------------------------------------------------------- *)
require import Nttlogspec Nttspec Nttzetas Nttalg Fnttalg.
require import Crspoly.
(*---*) import Zq ZqP ZqP.BigCf.

(* -------------------------------------------------------------------- *)
from Jasmin require import JUtils JWord.

(* -------------------------------------------------------------------- *)
require import Array256.

(* ==================================================================== *)
(* Bridges between int congruences mod q and Zq                         *)
(* ==================================================================== *)
lemma inzmod_exp (x n : int) : 0 <= n =>
  Zq.inzmod (x ^ n) = Zq.ZModpRing.exp (Zq.inzmod x) n.
proof.
elim: n => [|n ge0n ih].
- by rewrite Ring.IntID.expr0 Zq.ZModpRing.expr0.
rewrite Ring.IntID.exprS // Zq.ZModpRing.exprS //.
by rewrite Zq.inzmodM ih.
qed.

lemma inzmod0 : Zq.inzmod 0 = Zq.zero.
proof.
apply Zq.asint_inj.
by rewrite Zq.inzmodK Zq.zeroE mod0z.
qed.

lemma inzmod_sum (f : int -> int) (a b : int) :
  Zq.inzmod (BIA.bigi predT f a b)
    = BCA.bigi predT (fun i => Zq.inzmod (f i)) a b.
proof.
have h : forall (s : int list),
  Zq.inzmod (BIA.big predT f s) = BCA.big predT (fun i => Zq.inzmod (f i)) s.
- elim=> [|x s ih].
  - by rewrite BIA.big_nil BCA.big_nil inzmod0.
  rewrite BIA.big_cons BCA.big_cons /predT /=.
  by rewrite Zq.inzmodD ih.
by apply h.
qed.

(* zeta_ in Zq *)
op zZ : Zq.zmod = Zq.inzmod zeta_.

lemma inzmod_zpw (e : int) : 0 <= e =>
  Zq.inzmod (zpw e) = Zq.ZModpRing.exp zZ e.
proof.
move=> ge0e.
rewrite /zpw /zZ.
rewrite -(inzmod_exp zeta_ e ge0e).
rewrite -Zq.eq_inzmod.
by apply zexp_modE.
qed.

(* ==================================================================== *)
(* The linking ops                                                      *)
(* ==================================================================== *)
op pofw (a : wpoly) : poly =
  polyL (mkseq (fun i => Zq.inzmod (sval a.[i])) 256).

op pofw_blk (a : wpoly) (base len : int) : poly =
  polyL (mkseq (fun t => Zq.inzmod (sval a.[base + t])) len).

(* the moduli *)
op xnp (n : int) (c : Zq.zmod) : poly =
  PolyComRing.exp X n - polyC c.

op basis (k j : int) : poly =
  xnp (2^k) (Zq.ZModpRing.exp zZ (E k j)).

(* the residue polynomial, coefficients in the nttsum shape *)
op nttsump (p : wpoly) (k j : int) : poly =
  polyL (mkseq (fun t => Zq.inzmod (nttsum p k j t)) (2^k)).

(* ==================================================================== *)
(* polyL structure                                                      *)
(* ==================================================================== *)
lemma polyL_cat (xs ys : Zq.zmod list) :
  polyL (xs ++ ys) = polyL xs + PolyComRing.exp X (size xs) * polyL ys.
proof.
elim: xs => [|c xs ih].
- rewrite cat0s polyL_nil /=.
  rewrite PolyComRing.expr0 PolyComRing.mul1r.
  by rewrite PolyComRing.add0r.
rewrite cat_cons !polyL_cons ih /=.
rewrite PolyComRing.mulrDl -!PolyComRing.addrA.
congr.
congr.
rewrite (addzC 1 (size xs)) PolyComRing.exprS 1:size_ge0.
rewrite -PolyComRing.mulrA (PolyComRing.mulrC (polyL ys) X).
rewrite !PolyComRing.mulrA.
congr.
by rewrite PolyComRing.mulrC.
qed.

(* pointwise sum and scaling of equal-length coefficient lists *)
lemma polyL_add (f g : int -> Zq.zmod) (n : int) :
  polyL (mkseq f n) + polyL (mkseq g n)
    = polyL (mkseq (fun i => f i + g i) n).
proof.
apply poly_eqP => i ge0.
rewrite polyDE !polyLE.
case (i < n) => hcase.
- by rewrite !nth_mkseq //#.
rewrite !nth_default ?size_mkseq 1,2,3:/#.
by rewrite Zq.ZModpRing.addr0.
qed.

lemma polyL_scale (c : Zq.zmod) (f : int -> Zq.zmod) (n : int) :
  polyC c * polyL (mkseq f n) = polyL (mkseq (fun i => c * f i) n).
proof.
rewrite -scalepE.
apply poly_eqP => i ge0.
rewrite polyZE !polyLE.
case (i < n) => hcase.
- by rewrite !nth_mkseq //#.
rewrite !nth_default ?size_mkseq 1,2:/#.
by rewrite Zq.ZModpRing.mulr0.
qed.

(* ==================================================================== *)
(* Reduction modulo X^n - c                                             *)
(* ==================================================================== *)
lemma xnp_Xn (n : int) (c : Zq.zmod) :
  peqm (xnp n c) (PolyComRing.exp X n) (polyC c).
proof.
by exists poly1; rewrite PolyComRing.mul1r /xnp.
qed.

(* one chunk: X^n f1 + f0 == c f1 + f0 *)
lemma xnp_chunk (n : int) (c : Zq.zmod) (xs ys : Zq.zmod list) :
  size xs = n =>
  peqm (xnp n c) (polyL (xs ++ ys)) (polyL xs + polyC c * polyL ys).
proof.
move=> hsz.
rewrite polyL_cat hsz.
apply peqmD.
- by apply peqm_refl.
apply peqmM.
- by apply xnp_Xn.
by apply peqm_refl.
qed.

(* the fold: a (n*m)-coefficient list reduces to the n-coefficient
   residue, whose entries come out directly as Horner sums *)
lemma xnp_fold (n m : int) (c : Zq.zmod) (g : int -> Zq.zmod) :
  0 < n => 0 <= m =>
  peqm (xnp n c)
    (polyL (mkseq g (n * m)))
    (polyL (mkseq
       (fun t => BCA.bigi predT
                   (fun s => Zq.ZModpRing.exp c s * g (s * n + t)) 0 m)
       n)).
proof.
move=> gt0n ge0m.
elim: m ge0m g => [|m ge0m ih] g.
- rewrite (: n * 0 = 0) 1:/# mkseq0 polyL_nil.
  have -> : mkseq
      (fun t => BCA.bigi predT
         (fun s => Zq.ZModpRing.exp c s * g (s * n + t)) 0 0) n
    = mkseq (fun (_ : int) => Zq.zero) n.
  + apply eq_in_mkseq => t rgt /=.
    by rewrite BCA.big_geq.
  have -> : polyL (mkseq (fun (_ : int) => Zq.zero) n) = poly0.
  + apply poly_eqP => i ge0.
    rewrite polyLE poly0E.
    case (i < n) => hc.
    - by rewrite nth_mkseq //#.
    by rewrite nth_default ?size_mkseq /#.
  by apply peqm_refl.
rewrite (: n * (m + 1) = n + n * m) 1:/#.
rewrite mkseq_add 1,2:/#.
apply (peqm_trans _
  (polyL (mkseq g n) + polyC c * polyL (mkseq (fun i => g (n + i)) (n * m)))).
- apply xnp_chunk.
  by rewrite size_mkseq /#.
apply (peqm_trans _
  (polyL (mkseq g n) + polyC c * polyL (mkseq
     (fun t => BCA.bigi predT
        (fun s => Zq.ZModpRing.exp c s * g (n + (s * n + t))) 0 m) n))).
- apply peqmD.
  - by apply peqm_refl.
  apply peqmM.
  - by apply peqm_refl.
  by apply ih.
apply peqm_eq.
rewrite polyL_scale polyL_add.
congr.
apply eq_in_mkseq => t rgt /=.
rewrite BCA.big_int_recl 1:// /=.
congr.
- by rewrite Zq.ZModpRing.expr0 Zq.ZModpRing.mul1r.
rewrite BCA.mulr_sumr.
apply BCA.eq_big_int => s rgs /=.
rewrite Zq.ZModpRing.exprS 1:/#.
rewrite !Zq.ZModpRing.mulrA.
congr.
by rewrite (: (s + 1) * n + t = n + (s * n + t)) 1:/#.
qed.

(* ==================================================================== *)
(* The forward restatement                                              *)
(* ==================================================================== *)
(* the input polynomial is congruent to the nttsum polynomial *)
lemma pofw_nttsump (p : wpoly) (k j : int) :
  0 <= k <= 8 => 0 <= j < 2^(8-k) =>
  peqm (basis k j) (pofw p) (nttsump p k j).
proof.
move=> rgk rgj.
have e256 : 2^k * 2^(8-k) = 256.
- by rewrite -exprD_nneg 1,2:/# (: k + (8 - k) = 8) 1:/# /=.
have gt0n : 0 < 2^k by apply expr_gt0.
have := xnp_fold (2^k) (2^(8-k)) (Zq.ZModpRing.exp zZ (E k j))
  (fun i => Zq.inzmod (sval p.[i])) gt0n _; 1: by apply expr_ge0.
rewrite e256 -/(pofw p) -/(basis k j).
move=> h.
apply (peqm_trans _
  (polyL (mkseq
     (fun t => BCA.bigi predT
        (fun s => Zq.ZModpRing.exp (Zq.ZModpRing.exp zZ (E k j)) s
                  * Zq.inzmod (sval p.[s * 2^k + t])) 0 (2^(8-k)))
     (2^k)))).
- by apply h.
apply peqm_eq.
rewrite /nttsump.
congr.
apply eq_in_mkseq => t rgt /=.
rewrite /nttsum inzmod_sum.
apply BCA.eq_big_int => s rgs /=.
rewrite Zq.inzmodM.
congr.
rewrite inzmod_zpw 1:#smt:(E_range).
by rewrite Zq.ZModpRing.exprM.
qed.

(* block (k, j) of the butterfly network is the residue of P *)
lemma reduce_tree_polyP (p : wpoly) (B k j : int) :
  0 <= k <= 8 => 0 <= B => B + (8 - k) * q < 2^31 => cbnd p B =>
  0 <= j < 2^(8-k) =>
  peqm (basis k j)
    (pofw p)
    (pofw_blk (reduce_tree p k) (j * 2^k) (2^k)).
proof.
move=> rgk ge0B hB hbnd rgj.
apply (peqm_trans _ (nttsump p k j)).
- by apply pofw_nttsump.
apply peqm_eq.
rewrite /nttsump /pofw_blk.
congr.
apply eq_in_mkseq => t rgt /=.
have [_ hs] := reduce_tree_alg p B k rgk ge0B hB hbnd.
apply Zq.eq_inzmod.
by rewrite (hs j t rgj rgt).
qed.

(* congruence modulo a linear factor determines the evaluation *)
lemma peqm_lin_eval (u v : poly) (a : Zq.zmod) :
  peqm (X - polyC a) u v => peval u a = peval v a.
proof.
move=> h.
have hroot : root (X - polyC a) a.
- by rewrite pevalB pevalX pevalC Zq.ZModpRing.subrr.
have := peqm_root (X - polyC a) u v a h hroot.
rewrite pevalB.
by rewrite Zq.ZModpRing.subr_eq0.
qed.

lemma polyL1 (x : Zq.zmod) : polyL [x] = polyC x.
proof.
rewrite polyL_cons polyL_nil.
by rewrite PolyComRing.mul0r PolyComRing.addr0.
qed.

(* at the leaves, congruence modulo X - c is evaluation *)
lemma ntt_evalP (p : wpoly) (B j : int) :
  0 <= B => B + 8 * q < 2^31 => cbnd p B =>
  0 <= j < 256 =>
  peval (pofw p) (Zq.ZModpRing.exp zZ (E 0 j))
    = Zq.inzmod (sval (reduce_tree p 0).[j]).
proof.
move=> ge0B hB hbnd rgj.
have c1 : 0 <= 0 <= 8 by done.
have c2 : B + (8 - 0) * q < 2^31 by move: hB => /#.
have c3 : 0 <= j < 2^(8-0) by move: rgj => /= /#.
have h := reduce_tree_polyP p B 0 j c1 ge0B c2 hbnd c3.
move: h.
rewrite /basis /xnp /= PolyComRing.expr1.
move/peqm_lin_eval => ->.
rewrite /pofw_blk.
have -> : mkseq
    (fun t => Zq.inzmod (sval (reduce_tree p 0).[j * 2^0 + t])) (2^0)
  = [Zq.inzmod (sval (reduce_tree p 0).[j])].
- apply (eq_from_nth witness).
  - by rewrite size_mkseq /=.
  move=> i; rewrite size_mkseq /= => rgi.
  rewrite nth_mkseq 1:/# /=.
  have -> : i = 0 by smt().
  by rewrite ifT // /#.
by rewrite polyL1 pevalC.
qed.
