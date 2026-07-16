(**
  Algebraic content of the machine-level inverse NTT.

  The code-level proof (`Inttcorrect`) shows that the AVX2 procedure
  computes `iscale (invtree p 8)`.  This theory gives those operators
  their meaning, as the inverse of the CRT tree of `Nttalg`:

  One `ireduce p base len z` is one Gentleman-Sande merge: from the two
  residues a = f mod (X^len - w), b = f mod (X^len + w) (blocks at base
  and base+len) it computes

      r1 = a + b            (= 2 f0)
      r2 = (b - a) * w'     (= 2 f1, for w' = -(w^-1) = zeta^(256-e))

  recovering 2 * (f mod (X^(2len) - w^2)).  Each level contributes a
  factor 2; after the 8 levels `invtree v 8 = 256 * p`, and the final
  `iscale` multiplies by 41978 = 2^64/256 mod q through `mmr` (which
  divides by 2^32), leaving `2^32 * p`: the procedure returns the
  inverse transform in Montgomery form.

  The inverse twiddle tables are implementation literals
  (zETAS_TO_INVERT_LAYER_k, de-permuted by `izetasL`); they are
  characterized here as zeta^(256 - E k (2j)) in centered Montgomery
  form (`izetaL`), by computation.

  The main statement (`invtree_cgr`) is relative: if v is congruent,
  coefficient-wise mod q, to the forward NTT of p (`nttsum p 0 j 0`),
  then after k inverse levels block j of size 2^k holds
  2^k * nttsum p k j t.  The induction steps are the two equations of
  `nttsum_split`, run backwards.

  Bounds: the additive half doubles the coefficient magnitude at each
  level (the mmr half resets to < q), so the assumption is
  cbnd v B with q <= B and 256 * B < 2^31.  Note that for the natural
  bound B = q this fits with a 0.1% margin:
  256 * q = 2145386752 < 2^31 = 2147483648.  In particular the input
  must be reduced: the raw forward-NTT output bound (B + 8q) would
  overflow.
*)

(* ==================================================================== *)
require import AllCore CoreUtils List Ring IntDiv BitEncoding.
require import StdRing StdOrder StdBigop.
(*---*) import Bigint BIA IntOrder.

(* -------------------------------------------------------------------- *)
require import ListExtra Listred Nttlogspec Nttspec Nttzetas Nttalg.

(* -------------------------------------------------------------------- *)
from Jasmin require import JUtils JWord.

(* -------------------------------------------------------------------- *)
require import Array256.

(* -------------------------------------------------------------------- *)
require import Listred.

(* ==================================================================== *)
(* The inverse twiddles: zeta^(256 - E k (2j)), centered Montgomery     *)
(* ==================================================================== *)
op izetaL (k : int) : int list =
  if 0 <= k < 8 then
    mkseq (fun j => qcenter (mrepr (zpw (256 - E k (2*j))))) (2^(7-k))
  else [].

(* -------------------------------------------------------------------- *)
(* The implementation tables compute the spec table, per level, by      *)
(* computation.                                                         *)
section.
hint simplify BS2Int.bs2int_nil, BS2Int.bs2int_cons.

lemma izetasL0E : izetasL 0 = map W32.of_int (izetaL 0).
proof. hint +listred. by rewrite /izetasL /izetaL; cbv delta. qed.

lemma izetasL1E : izetasL 1 = map W32.of_int (izetaL 1).
proof. hint +listred. by rewrite /izetasL /izetaL; cbv delta. qed.

lemma izetasL2E : izetasL 2 = map W32.of_int (izetaL 2).
proof. hint +listred. by rewrite /izetasL /izetaL; cbv delta. qed.

lemma izetasL3E : izetasL 3 = map W32.of_int (izetaL 3).
proof. hint +listred. by rewrite /izetasL /izetaL; cbv delta. qed.

lemma izetasL4E : izetasL 4 = map W32.of_int (izetaL 4).
proof. hint +listred. by rewrite /izetasL /izetaL; cbv delta. qed.

lemma izetasL5E : izetasL 5 = map W32.of_int (izetaL 5).
proof. hint +listred. by rewrite /izetasL /izetaL; cbv delta. qed.

lemma izetasL6E : izetasL 6 = map W32.of_int (izetaL 6).
proof. hint +listred. by rewrite /izetasL /izetaL; cbv delta. qed.

lemma izetasL7E : izetasL 7 = map W32.of_int (izetaL 7).
proof. hint +listred. by rewrite /izetasL /izetaL; cbv delta. qed.

(* the implementation tables compute the spec table *)
lemma izetasLE (k : int) : 0 <= k < 8 =>
  izetasL k = map W32.of_int (izetaL k).
proof.
move=> rgk.
case (k = 0) => [->|neq0].
- by apply izetasL0E.
case (k = 1) => [->|neq1].
- by apply izetasL1E.
case (k = 2) => [->|neq2].
- by apply izetasL2E.
case (k = 3) => [->|neq3].
- by apply izetasL3E.
case (k = 4) => [->|neq4].
- by apply izetasL4E.
case (k = 5) => [->|neq5].
- by apply izetasL5E.
case (k = 6) => [->|neq6].
- by apply izetasL6E.
have -> : k = 7 by smt().
by apply izetasL7E.
qed.
end section.

lemma size_izetaL (k : int) : 0 <= k < 8 => size (izetaL k) = 2^(7-k).
proof.
by move=> rgk; rewrite /izetaL ifT //; smt(size_mkseq expr_ge0).
qed.

lemma izetasL_nth (k j : int) : 0 <= k < 8 => 0 <= j < 2^(7-k) =>
  nth witness (izetasL k) j
    = W32.of_int (qcenter (mrepr (zpw (256 - E k (2*j))))).
proof.
move=> rgk rgj.
rewrite izetasLE // (nth_map witness).
- by rewrite size_izetaL.
by rewrite /izetaL ifT // nth_mkseq.
qed.

(* the key multiplicative identity: w' * zeta^E = -1 *)
lemma izeta_id (k j : int) : 0 <= k < 8 =>
  (zpw (256 - E k (2*j)) * zpw (E k (2*j))) %% q = (-1) %% q.
proof.
move=> rgk.
rewrite -zpwD.
have -> : 256 - E k (2*j) + E k (2*j) = 256 by ring.
by apply zpw_256.
qed.

(* ==================================================================== *)
(* Pointwise access to [ireduce]                                        *)
(* ==================================================================== *)
lemma ireduceiE_lo (p : wpoly) (base len : int) (z : W32.t) (t : int) :
  0 <= base => 0 <= t < len => base + 2*len <= 256 =>
  (ireduce p base len z).[base + t] = p.[base + t] + p.[base + len + t].
proof.
move=> ge0b rgt le256.
rewrite /ireduce /replace_ filliE 1:/# ireduce_coeff_flatten_size 1:/#.
rewrite ifT 1:/#.
rewrite /ireduce_coeff_flatten /= nth_cat ireduce_coeff_sizeL 1:/#.
rewrite ifT 1:/# ireduce_coeffLE nth_mkseq 1:/# /=.
by rewrite (: base + t - base = t) 1:/#.
qed.

lemma ireduceiE_hi (p : wpoly) (base len : int) (z : W32.t) (t : int) :
  0 <= base => 0 <= t < len => base + 2*len <= 256 =>
  (ireduce p base len z).[base + len + t]
    = mmr (p.[base + len + t] - p.[base + t]) z.
proof.
move=> ge0b rgt le256.
rewrite /ireduce /replace_ filliE 1:/# ireduce_coeff_flatten_size 1:/#.
rewrite ifT 1:/#.
rewrite /ireduce_coeff_flatten /= nth_cat ireduce_coeff_sizeL 1:/#.
rewrite ifF 1:/# ireduce_coeffRE nth_mkseq 1:/# /=.
by rewrite (: base + len + t - base - len = t) 1:/#.
qed.

(* ==================================================================== *)
(* Pointwise access to [ireduce_level]: block j is one GS merge         *)
(* ==================================================================== *)
lemma ireduce_leveliE (p : wpoly) (k j t : int) :
  0 <= k < 8 => 0 <= j < 2^(7-k) => 0 <= t < 2^k =>
     (ireduce_level p k).[j * 2^(k+1) + t]
       = p.[j * 2^(k+1) + t] + p.[j * 2^(k+1) + 2^k + t]
  /\ (ireduce_level p k).[j * 2^(k+1) + 2^k + t]
       = mmr (p.[j * 2^(k+1) + 2^k + t] - p.[j * 2^(k+1) + t])
             (W32.of_int (qcenter (mrepr (zpw (256 - E k (2*j)))))).
proof.
move=> rgk rgj rgt.
have gt0len : 0 < 2^k by apply expr_gt0.
have eSk : 2^(k+1) = 2 * 2^k by rewrite exprS 1:/#.
have e256 : 2^(7-k) * 2^(k+1) = 256.
- by rewrite -exprD_nneg 1,2:/# (: 7 - k + (k+1) = 8) 1:/# /=.
rewrite /ireduce_level.
rewrite (ireduce_nE p 0 (2^k)) 1:/#.
have hsz : size (izetasL k) = 2^(7-k).
- by rewrite izetasLE // size_map size_izetaL.
rewrite hsz.
pose F := fun (i : int) =>
  ireduce_coeff_flatten p (0 + 2 * i * 2^k) (2^k) (nth witness (izetasL k) i).
have hbsz : forall i, 0 <= i < 2^(7-k) => size (F i) = 2 * 2^k.
- by move=> i rgi; rewrite /F ireduce_coeff_flatten_size /#.
have hfsz : size (flatten (mkseq F (2^(7-k)))) = 256.
- rewrite size_flatten.
  have -> : map size (mkseq F (2^(7-k))) = nseq (2^(7-k)) (2 * 2^k).
  + apply (eq_from_nth witness).
    * by rewrite size_map size_mkseq size_nseq.
    move=> i; rewrite size_map size_mkseq => rgi.
    rewrite (nth_map witness) 1:size_mkseq 1:/# nth_mkseq 1:/# nth_nseq 1:/#.
    by rewrite hbsz /#.
  rewrite Bigint.sumz_nseq.
  + by apply expr_ge0.
  by rewrite -eSk /#.
have hx : j * 2^(k+1) + 2^(k+1) <= 256.
- have : (j + 1) * 2^(k+1) <= 2^(7-k) * 2^(k+1).
  + by apply IntOrder.ler_pmul2r; smt(expr_gt0).
  by rewrite e256 /#.
have hzj : nth witness (izetasL k) j
         = W32.of_int (qcenter (mrepr (zpw (256 - E k (2*j))))).
- by rewrite izetasL_nth.
have hnth : forall (r : int), 0 <= r < 2^(k+1) =>
    nth witness (flatten (mkseq F (2^(7-k)))) (j * 2^(k+1) + r)
  = nth witness (F j) r.
- move=> r rgr.
  rewrite (BitChunking.nth_flatten witness (2 * 2^k)).
  + by apply/List.allP=> s /mkseqP [i [rgi ->]] /=; rewrite hbsz.
  rewrite -eSk.
  have -> : (j * 2^(k+1) + r) %/ 2^(k+1) = j.
  + by rewrite divzMDl 1:#smt:(expr_gt0) pdiv_small //.
  have -> : (j * 2^(k+1) + r) %% 2^(k+1) = r by rewrite modzMDl pmod_small.
  by rewrite nth_mkseq 1:/#.
split.
- rewrite /replace_ filliE 1:/# hfsz ifT 1:/#.
  rewrite /= (: j * 2^(k+1) + t - 0 = j * 2^(k+1) + t) 1:/#.
  rewrite hnth 1:/#.
  rewrite /F /= hzj /ireduce_coeff_flatten /= nth_cat ireduce_coeff_sizeL 1:/#.
  rewrite ifT 1:/# ireduce_coeffLE nth_mkseq 1:/# /=.
  by have -> // : 2 * j * 2^k = j * 2^(k+1) by rewrite eSk; ring.
rewrite /replace_ filliE 1:/# hfsz ifT 1:/#.
rewrite /= (: j * 2^(k+1) + 2^k + t - 0 = j * 2^(k+1) + (2^k + t)) 1:/#.
rewrite hnth 1:/#.
rewrite /F /= hzj /ireduce_coeff_flatten /= nth_cat ireduce_coeff_sizeL 1:/#.
rewrite ifF 1:/# ireduce_coeffRE nth_mkseq 1:/# /=.
have -> : 2^k + t - 2^k = t by ring.
have -> : 2 * j * 2^k + t = j * 2^(k+1) + t by rewrite eSk; ring.
have -> : 2 * j * 2^k + 2^k + t = j * 2^(k+1) + (2^k + t) by rewrite eSk; ring.
done.
qed.

(* ==================================================================== *)
(* One level, at the level of values                                    *)
(* ==================================================================== *)
lemma ireduce_level_alg (p : wpoly) (M k : int) :
  0 <= k < 8 => q <= M => 2 * M < 2^31 => cbnd p M =>
     cbnd (ireduce_level p k) (2 * M)
  /\ forall (j t : int), 0 <= j < 2^(7-k) => 0 <= t < 2^k =>
       let base = j * 2^(k+1) in
       let w    = zpw (256 - E k (2*j)) in
          sval (ireduce_level p k).[base + t] %% q
            = (sval p.[base + t] + sval p.[base + 2^k + t]) %% q
       /\ sval (ireduce_level p k).[base + 2^k + t] %% q
            = ((sval p.[base + 2^k + t] - sval p.[base + t]) * w) %% q.
proof.
move=> rgk leqM hM hbnd.
have eSk : 2^(k+1) = 2 * 2^k by rewrite exprS 1:/#.
have e256 : 2^(7-k) * 2^(k+1) = 256.
- by rewrite -exprD_nneg 1,2:/# (: 7 - k + (k+1) = 8) 1:/# /=.
have e31 : 2147483648 = 2 ^ 31 by rewrite /=.
have hgen : forall (j t : int), 0 <= j < 2^(7-k) => 0 <= t < 2^k =>
     `|sval (ireduce_level p k).[j * 2^(k+1) + t]| <= 2 * M
  /\ `|sval (ireduce_level p k).[j * 2^(k+1) + 2^k + t]| <= 2 * M
  /\ (sval (ireduce_level p k).[j * 2^(k+1) + t] %% q
        = (sval p.[j * 2^(k+1) + t] + sval p.[j * 2^(k+1) + 2^k + t]) %% q)
  /\ (sval (ireduce_level p k).[j * 2^(k+1) + 2^k + t] %% q
        = ((sval p.[j * 2^(k+1) + 2^k + t] - sval p.[j * 2^(k+1) + t])
           * zpw (256 - E k (2*j))) %% q).
- move=> j t rgj rgt.
  have [-> ->] := ireduce_leveliE p k j t _ _ _ => //.
  have hidx1 : 0 <= j * 2^(k+1) + t < 256 by smt(expr_gt0 IntOrder.ler_pmul2r).
  have hidx2 : 0 <= j * 2^(k+1) + 2^k + t < 256 by smt(expr_gt0 IntOrder.ler_pmul2r).
  have h1 : `|sval p.[j * 2^(k+1) + t]| <= M by smt().
  have h2 : `|sval p.[j * 2^(k+1) + 2^k + t]| <= M by smt().
  have hsub : sval (p.[j * 2^(k+1) + 2^k + t] - p.[j * 2^(k+1) + t])
            = sval p.[j * 2^(k+1) + 2^k + t] - sval p.[j * 2^(k+1) + t].
  + rewrite to_sintB_small.
    * by rewrite -e31; smt().
    by done.
  have hm := mmr_table_bnd
    (p.[j * 2^(k+1) + 2^k + t] - p.[j * 2^(k+1) + t]) (zpw (256 - E k (2*j))).
  have hmc := mmr_table
    (p.[j * 2^(k+1) + 2^k + t] - p.[j * 2^(k+1) + t]) (zpw (256 - E k (2*j))).
  rewrite to_sintD_small.
  + by rewrite -e31; smt().
  do! split.
  + by move=> {hbnd hM e31 e256 eSk hmc}; smt().
  + by move=> {hbnd hM e31 e256 eSk hmc}; smt(gt0_q).
  by rewrite hmc hsub.
split.
- move=> x rgx.
  pose j := x %/ 2^(k+1); pose r := x %% 2^(k+1).
  have hj : 0 <= j < 2^(7-k).
  + split; first by rewrite /j divz_ge0 1:expr_gt0 /#.
    by move=> _; rewrite /j ltz_divLR 1:expr_gt0 // 1:/# e256 /#.
  have hr : 0 <= r < 2^(k+1) by smt(expr_gt0 modz_ge0 ltz_pmod).
  have hx : x = j * 2^(k+1) + r by rewrite /j /r -divz_eq.
  case (r < 2^k) => hcase.
  + by have := hgen j r _ _; smt().
  by have := hgen j (r - 2^k) _ _; smt().
move=> j t rgj rgt /=.
by have := hgen j t rgj rgt; smt().
qed.

(* ==================================================================== *)
(* The inverse tree, relative to the forward one                        *)
(* ==================================================================== *)
(* If v is congruent to the forward NTT of p, then after k inverse
   levels block j of size 2^k holds 2^k * (the level-k residue of p). *)
lemma invtree_cgr (p v : wpoly) (B k : int) :
  0 <= k <= 8 => q <= B => 2^8 * B < 2^31 => cbnd v B =>
  (forall i, 0 <= i < 256 => sval v.[i] %% q = nttsum p 0 i 0 %% q) =>
     cbnd (invtree v k) (2^k * B)
  /\ forall (j t : int), 0 <= j < 2^(8-k) => 0 <= t < 2^k =>
       sval (invtree v k).[j * 2^k + t] %% q = (2^k * nttsum p k j t) %% q.
proof.
move=> + leqB hB hbnd hv.
elim/natind: k => [k le0k rgk | k ge0k ih rgk].
- have -> : k = 0 by smt().
  rewrite /= invtree0.
  split; first by move: hbnd => /#.
  move=> j t rgj rgt.
  move: rgj rgt => /= rgj rgt.
  have -> : t = 0 by smt().
  have -> : j * 1 + 0 = j by ring.
  by apply hv.
have rgk8 : 0 <= k < 8 by smt().
have eSk : 2^(k+1) = 2 * 2^k by rewrite exprS 1:/#.
have le8 : 2^(k+1) <= 2^8.
- have e8 : 256 = 2 ^ 8 by rewrite /=.
  by apply IntOrder.ler_weexpn2l => /#.
have gt0B : 0 < B by smt(gt0_q).
have [ihb ihs] := ih _; 1: smt().
have hM1 : q <= 2^k * B by smt(expr_gt0 IntOrder.ler_pmul2r).
have hM2 : 2 * (2^k * B) < 2^31.
- have h1 : 2 * (2^k * B) = 2^(k+1) * B by rewrite eSk; ring.
  rewrite h1.
  have h2 : 2^(k+1) * B <= 2^8 * B.
  + rewrite IntOrder.ler_pmul2r 1:/#.
    by apply le8.
  by move: h2 hB; rewrite /= => h2b hBb; smt().
have [lvlb lvls] := ireduce_level_alg (invtree v k) (2^k * B) k rgk8 hM1 hM2 ihb.
have hstep : invtree v (k+1) = ireduce_level (invtree v k) k.
- by apply invtree_step.
split.
- rewrite hstep.
  by have -> : 2^(k+1) * B = 2 * (2^k * B) by rewrite eSk; ring.
move=> j t rgj rgt.
rewrite hstep.
have rgj7 : 0 <= j < 2^(7-k) by move: rgj; rewrite (: 8 - (k+1) = 7 - k) 1:/#.
have e8k : 2^(8-k) = 2 * 2^(7-k).
- by rewrite (: 8 - k = (7-k)+1) 1:/# exprS 1:/#.
case (t < 2^k) => hcase.
- (* low half of the merged block: r1 = a + b, the split equations sum up *)
  have := lvls j t rgj7 _; 1: smt().
  rewrite /= => -[l1 _].
  rewrite l1.
  have eA : j * 2^(k+1) + t = 2*j * 2^k + t by rewrite eSk; ring.
  have eB : j * 2^(k+1) + 2^k + t = (2*j+1) * 2^k + t by rewrite eSk; ring.
  rewrite eA eB.
  have hA := ihs (2*j) t _ _; 1: smt(); 1: smt().
  have hBv := ihs (2*j+1) t _ _; 1: smt(); 1: smt().
  have [c1 c2] := nttsum_split p k j t rgk8 rgj7 _; 1: smt().
  rewrite -modzDm hA hBv modzDm.
  have -> : 2^k * nttsum p k (2*j) t + 2^k * nttsum p k (2*j+1) t
          = 2^k * (nttsum p k (2*j) t + nttsum p k (2*j+1) t) by ring.
  rewrite -modzMmr.
  rewrite -modzDm c1 c2 modzDm.
  have -> : nttsum p (k+1) j t + zpw (E k (2*j)) * nttsum p (k+1) j (t + 2^k)
            + (nttsum p (k+1) j t - zpw (E k (2*j)) * nttsum p (k+1) j (t + 2^k))
          = 2 * nttsum p (k+1) j t by ring.
  rewrite modzMmr.
  by have -> : 2^k * (2 * nttsum p (k+1) j t) = 2^(k+1) * nttsum p (k+1) j t
    by rewrite eSk; ring.
(* high half: r2 = (b - a) * w', the split equations subtract and the
   table identity w' * zeta^E = -1 eats the sign *)
pose t2 := t - 2^k.
have et : t = 2^k + t2 by smt().
have rgt2 : 0 <= t2 < 2^k by smt().
have := lvls j t2 rgj7 rgt2.
rewrite /= => -[_ l2].
rewrite et (: j * 2^(k+1) + (2^k + t2) = j * 2^(k+1) + 2^k + t2) 1:/#.
rewrite l2.
have hA := ihs (2*j) t2 _ _; 1: smt(); 1: smt().
have hBv := ihs (2*j+1) t2 _ _; 1: smt(); 1: smt().
have [c1 c2] := nttsum_split p k j t2 rgk8 rgj7 rgt2.
have eA : j * 2^(k+1) + t2 = 2*j * 2^k + t2 by rewrite eSk; ring.
have eB : j * 2^(k+1) + 2^k + t2 = (2*j+1) * 2^k + t2 by rewrite eSk; ring.
rewrite eA eB.
rewrite -modzMml -modzBm hA hBv modzBm.
have -> : 2^k * nttsum p k (2*j+1) t2 - 2^k * nttsum p k (2*j) t2
        = 2^k * (nttsum p k (2*j+1) t2 - nttsum p k (2*j) t2) by ring.
rewrite -(modzMmr (2^k)) -modzBm c1 c2 modzBm.
have -> : nttsum p (k+1) j t2 - zpw (E k (2*j)) * nttsum p (k+1) j (t2 + 2^k)
          - (nttsum p (k+1) j t2 + zpw (E k (2*j)) * nttsum p (k+1) j (t2 + 2^k))
        = -2 * (zpw (E k (2*j)) * nttsum p (k+1) j (t2 + 2^k)) by ring.
rewrite (modzMmr (2^k)) modzMml.
have -> : 2^k * (-2 * (zpw (E k (2*j)) * nttsum p (k+1) j (t2 + 2^k)))
          * zpw (256 - E k (2*j))
        = (- (2^(k+1) * nttsum p (k+1) j (t2 + 2^k)))
          * (zpw (256 - E k (2*j)) * zpw (E k (2*j))) by rewrite eSk; ring.
rewrite -modzMmr izeta_id // modzMmr.
rewrite (: t2 + 2^k = 2^k + t2) 1:/#.
by have -> : (- 2^(k+1) * nttsum p (k+1) j (2^k + t2)) * -1
           = 2^(k+1) * nttsum p (k+1) j (2^k + t2) by ring.
qed.

(* ==================================================================== *)
(* Final scaling: mmr by 41978 = 2^64/256 mod q                         *)
(* ==================================================================== *)
lemma iscaleiE (p : wpoly) (i : int) : 0 <= i < 256 =>
  (iscale p).[i] = mmr p.[i] (W32.of_int 41978).
proof.
by move=> rgi; rewrite /iscale mapiE.
qed.

lemma sval41978 : sval (W32.of_int 41978) = 41978.
proof.
rewrite W32.to_sintK_small.
- by rewrite /=.
by done.
qed.

(* 256 * 41978 = 2^64 mod q: the tree factor 256 cancels and one
   Montgomery factor remains *)
lemma iscale_cgr (c : W32.t) (x : int) :
  (sval c) %% q = (256 * x) %% q =>
  sval (mmr c (W32.of_int 41978)) %% q = (2^32 * x) %% q.
proof.
move=> hc.
apply cgr_pow2_cancel.
rewrite mmr_cgr sval41978.
rewrite -modzMml hc modzMml.
have -> : 256 * x * 41978 = x * 10746368 by ring.
have -> : 2^32 * (2^32 * x) = x * (2^32 * 2^32) by ring.
have e64 : 10746368 %% q = (2^32 * 2^32) %% q by rewrite /q /=.
by rewrite -(modzMmr x 10746368 q) e64 modzMmr.
qed.

lemma iscale_bnd (c : W32.t) : `|sval (mmr c (W32.of_int 41978))| < q.
proof.
apply mmr_bnd.
rewrite sval41978.
by rewrite /q.
qed.

(* ==================================================================== *)
(* Endpoint: the roundtrip, output in Montgomery form                   *)
(* ==================================================================== *)
lemma intt_ntt_alg (p v : wpoly) (B : int) :
  q <= B => 2^8 * B < 2^31 => cbnd v B =>
  (forall i, 0 <= i < 256 => sval v.[i] %% q = nttsum p 0 i 0 %% q) =>
     cbnd (iscale (invtree v 8)) q
  /\ forall i, 0 <= i < 256 =>
       sval (iscale (invtree v 8)).[i] %% q = (2^32 * sval p.[i]) %% q.
proof.
move=> leqB hB hbnd hv.
have [tb ts] := invtree_cgr p v B 8 _ leqB hB hbnd hv; 1: by done.
split.
- move=> i rgi.
  rewrite iscaleiE //.
  by smt(iscale_bnd).
move=> i rgi.
rewrite iscaleiE //.
apply iscale_cgr.
have := ts 0 i _ _.
- by rewrite /=.
- by rewrite /=; smt().
rewrite (: 0 * 2^8 + i = i) 1:/# nttsum8.
by rewrite (: 2^8 = 256) 1:// => ->.
qed.
