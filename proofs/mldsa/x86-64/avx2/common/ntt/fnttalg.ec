(**
  Algebraic content of the machine-level forward NTT.

  The code-level proof (`Fnttcorrect`) shows that the AVX2 procedure
  computes the word-level operator `reduce_tree`.  This theory gives it
  its mathematical meaning, on top of the shared layer of `Nttalg`:
  one `reduce p base len z` is one CRT split

      f = f0 + X^len f1  |->  (f0 + w f1, f0 - w f1)
        = (f mod (X^len - w), f mod (X^len + w)),

  the table entry z being w in centered Montgomery form.  The main
  invariant (`reduce_tree_alg`): after levels 7..k, block j of size 2^k
  holds P mod (X^(2^k) - zeta_^(E k j)) coefficient-wise mod q, i.e.
  coefficient t of block j is congruent to `nttsum p k j t`; at k = 0
  this is the multipoint evaluation of P at the odd powers of zeta_ in
  bit-reversed order (`ntt_alg`).

  Word arithmetic does not overflow provided the input coefficients are
  bounded by B with B + 8q < 2^31: each level grows the magnitude by at
  most q (the `mmr` output is < q unconditionally).
*)

(* ==================================================================== *)
require import AllCore CoreUtils List Ring IntDiv BitEncoding.
require import StdRing StdOrder StdBigop.
(*---*) import Bigint BIA IntOrder.

(* -------------------------------------------------------------------- *)
require import ListExtra Nttlogspec Nttspec Nttzetas Nttalg.

(* -------------------------------------------------------------------- *)
from Jasmin require import JUtils JWord.

(* -------------------------------------------------------------------- *)
require import Array256.

(* -------------------------------------------------------------------- *)
require import Listred.

(* ==================================================================== *)
(* One butterfly block, at the level of values                          *)
(* ==================================================================== *)
(* pointwise access to [reduce] *)
lemma reduceiE_lo (p : wpoly) (base len : int) (z : W32.t) (t : int) :
  0 <= base => 0 <= t < len => base + 2*len <= 256 =>
  (reduce p base len z).[base + t] = p.[base + t] + mmr p.[base + len + t] z.
proof.
move=> ge0b rgt le256.
rewrite /reduce /replace_ filliE 1:/# reduce_coeff_flatten_size 1:/#.
rewrite ifT 1:/#.
rewrite /reduce_coeff_flatten /= nth_cat reduce_coeff_sizeL 1:/#.
rewrite ifT 1:/# reduce_coeffLE nth_mkseq 1:/# /=.
by rewrite (: base + t - base = t) 1:/#.
qed.

lemma reduceiE_hi (p : wpoly) (base len : int) (z : W32.t) (t : int) :
  0 <= base => 0 <= t < len => base + 2*len <= 256 =>
  (reduce p base len z).[base + len + t] = p.[base + t] - mmr p.[base + len + t] z.
proof.
move=> ge0b rgt le256.
rewrite /reduce /replace_ filliE 1:/# reduce_coeff_flatten_size 1:/#.
rewrite ifT 1:/#.
rewrite /reduce_coeff_flatten /= nth_cat reduce_coeff_sizeL 1:/#.
rewrite ifF 1:/# reduce_coeffRE nth_mkseq 1:/# /=.
by rewrite (: base + len + t - base - len = t) 1:/#.
qed.

lemma reduce_alg (p : wpoly) (base len : int) (w B : int) (t : int) :
  0 <= len => 0 <= base => base + 2 * len <= 256 =>
  0 <= B => B + q < 2^31 => cbnd p B =>
  0 <= t < len =>
  let z = W32.of_int (qcenter (mrepr w)) in
  let r = reduce p base len z in
     sval r.[base + t] %% q
       = (sval p.[base + t] + w * sval p.[base + len + t]) %% q
  /\ sval r.[base + len + t] %% q
       = (sval p.[base + t] - w * sval p.[base + len + t]) %% q
  /\ `|sval r.[base + t]| <= B + q
  /\ `|sval r.[base + len + t]| <= B + q.
proof.
move=> ge0len ge0b le256 ge0B hB hbnd rgt /=.
have h1 : `|sval p.[base + t]| <= B by smt().
have h2 : `|sval p.[base + len + t]| <= B by smt().
have hm := mmr_table_bnd p.[base + len + t] w.
have hmc := mmr_table p.[base + len + t] w.
have e31 : 2147483648 = 2 ^ 31 by rewrite /=.
rewrite reduceiE_lo // reduceiE_hi //.
do! split.
- rewrite to_sintD_small.
  + by rewrite -e31; smt().
  rewrite -modzDmr hmc modzDmr.
  by have -> : sval p.[base + t] + sval p.[base + len + t] * w
             = sval p.[base + t] + w * sval p.[base + len + t] by ring.
- rewrite to_sintB_small.
  + by rewrite -e31; smt().
  rewrite -modzDmr -modzNm hmc modzNm modzDmr.
  by have -> : sval p.[base + t] - sval p.[base + len + t] * w
             = sval p.[base + t] - w * sval p.[base + len + t] by ring.
- rewrite to_sintD_small.
  + by rewrite -e31; smt().
  by move=> {hbnd hB hmc e31}; smt().
rewrite to_sintB_small.
- by rewrite -e31; smt().
by move=> {hbnd hB hmc e31}; smt().
qed.

(* coefficients outside the block are untouched *)
lemma reduce_alg_out (p : wpoly) (base len : int) (z : W32.t) (i : int) :
  0 <= len => 0 <= i < 256 => ! (base <= i < base + 2 * len) =>
  (reduce p base len z).[i] = p.[i].
proof.
move=> ge0len rgi hout.
by rewrite /reduce /replace_ filliE 1:/# reduce_coeff_flatten_size 1:/# ifF 1:/#.
qed.

(* ==================================================================== *)
(* One level                                                            *)
(* ==================================================================== *)
lemma zetaL_size (k : int) : 0 <= k < 8 => size (zetaL k) = 2^(7-k).
proof.
by move=> rgk; rewrite /zetaL ifT //; smt(size_mkseq expr_ge0).
qed.

lemma zetaL_nth (k j : int) : 0 <= k < 8 => 0 <= j < 2^(7-k) =>
  nth witness (zetaL k) j = qcenter (mrepr (zpow (j + 2^(7-k)))).
proof.
by move=> rgk rgj; rewrite /zetaL ifT // nth_mkseq.
qed.

(* pointwise access to [reduce_level]: block j is one butterfly *)
lemma reduce_leveliE (p : wpoly) (k j t : int) :
  0 <= k < 8 => 0 <= j < 2^(7-k) => 0 <= t < 2^k =>
     (reduce_level p k).[j * 2^(k+1) + t]
       = p.[j * 2^(k+1) + t]
         + mmr p.[j * 2^(k+1) + 2^k + t]
             (W32.of_int (qcenter (mrepr (zpow (j + 2^(7-k))))))
  /\ (reduce_level p k).[j * 2^(k+1) + 2^k + t]
       = p.[j * 2^(k+1) + t]
         - mmr p.[j * 2^(k+1) + 2^k + t]
             (W32.of_int (qcenter (mrepr (zpow (j + 2^(7-k)))))).
proof.
move=> rgk rgj rgt.
have gt0len : 0 < 2^k by apply expr_gt0.
have eSk : 2^(k+1) = 2 * 2^k by rewrite exprS 1:/#.
have e256 : 2^(7-k) * 2^(k+1) = 256.
- by rewrite -exprD_nneg 1,2:/# (: 7 - k + (k+1) = 8) 1:/# /=.
rewrite /reduce_level.
rewrite (reduce_nE p 0 (2^k)) 1:/#.
rewrite size_map zetaL_size //.
pose F := fun (i : int) =>
  reduce_coeff_flatten p (0 + 2 * i * 2^k) (2^k)
    (nth witness (map W32.of_int (zetaL k)) i).
have hbsz : forall i, 0 <= i < 2^(7-k) => size (F i) = 2 * 2^k.
- by move=> i rgi; rewrite /F reduce_coeff_flatten_size /#.
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
have hzj : nth witness (map W32.of_int (zetaL k)) j
         = W32.of_int (qcenter (mrepr (zpow (j + 2^(7-k))))).
- by rewrite (nth_map witness) 1:zetaL_size 1,2:// zetaL_nth.
have hnth : forall (r : int), 0 <= r < 2^(k+1) =>
    nth witness (flatten (mkseq F (2^(7-k)))) (j * 2^(k+1) + r)
  = nth witness (F j) r.
- move=> r rgr.
  rewrite (BitChunking.nth_flatten witness (2 * 2^k)).
  + by apply/List.allP=> s /mkseqP [i [rgi ->]] /=; rewrite hbsz.
  rewrite -eSk.
  have -> : (j * 2^(k+1) + r) %/ 2^(k+1) = j.
  - by rewrite divzMDl 1:#smt:(expr_gt0) pdiv_small //.
  have -> : (j * 2^(k+1) + r) %% 2^(k+1) = r by rewrite modzMDl pmod_small.
  by rewrite nth_mkseq 1:/#.
split.
- rewrite /replace_ filliE 1:/# hfsz ifT 1:/#.
  rewrite /= (: j * 2^(k+1) + t - 0 = j * 2^(k+1) + t) 1:/#.
  rewrite hnth 1:/#.
  rewrite /F /= hzj /reduce_coeff_flatten /= nth_cat reduce_coeff_sizeL 1:/#.
  rewrite ifT 1:/# reduce_coeffLE nth_mkseq 1:/# /=.
  by have -> // : 2 * j * 2^k = j * 2^(k+1) by rewrite eSk; ring.
rewrite /replace_ filliE 1:/# hfsz ifT 1:/#.
rewrite /= (: j * 2^(k+1) + 2^k + t - 0 = j * 2^(k+1) + (2^k + t)) 1:/#.
rewrite hnth 1:/#.
rewrite /F /= hzj /reduce_coeff_flatten /= nth_cat reduce_coeff_sizeL 1:/#.
rewrite ifF 1:/# reduce_coeffRE nth_mkseq 1:/# /=.
have -> : 2^k + t - 2^k = t by ring.
have -> : 2 * j * 2^k + t = j * 2^(k+1) + t by rewrite eSk; ring.
have -> : 2 * j * 2^k + 2^k + t = j * 2^(k+1) + (2^k + t) by rewrite eSk; ring.
done.
qed.

lemma reduce_level_alg (p : wpoly) (B k : int) :
  0 <= k < 8 => 0 <= B => B + q < 2^31 => cbnd p B =>
     cbnd (reduce_level p k) (B + q)
  /\ forall (j t : int), 0 <= j < 2^(7-k) => 0 <= t < 2^k =>
       let base = j * 2^(k+1) in
       let w    = zpw (E k (2*j)) in
          sval (reduce_level p k).[base + t] %% q
            = (sval p.[base + t] + w * sval p.[base + 2^k + t]) %% q
       /\ sval (reduce_level p k).[base + 2^k + t] %% q
            = (sval p.[base + t] - w * sval p.[base + 2^k + t]) %% q.
proof.
move=> rgk ge0B hB hbnd.
have eSk : 2^(k+1) = 2 * 2^k by rewrite exprS 1:/#.
have e256 : 2^(7-k) * 2^(k+1) = 256.
- by rewrite -exprD_nneg 1,2:/# (: 7 - k + (k+1) = 8) 1:/# /=.
have e31 : 2147483648 = 2 ^ 31 by rewrite /=.
have hgen : forall (j t : int), 0 <= j < 2^(7-k) => 0 <= t < 2^k =>
     `|sval (reduce_level p k).[j * 2^(k+1) + t]| <= B + q
  /\ `|sval (reduce_level p k).[j * 2^(k+1) + 2^k + t]| <= B + q
  /\ (sval (reduce_level p k).[j * 2^(k+1) + t] %% q
        = (sval p.[j * 2^(k+1) + t]
           + zpw (E k (2*j)) * sval p.[j * 2^(k+1) + 2^k + t]) %% q)
  /\ (sval (reduce_level p k).[j * 2^(k+1) + 2^k + t] %% q
        = (sval p.[j * 2^(k+1) + t]
           - zpw (E k (2*j)) * sval p.[j * 2^(k+1) + 2^k + t]) %% q).
- move=> j t rgj rgt.
  have [-> ->] := reduce_leveliE p k j t _ _ _ => //.
  have hidx1 : 0 <= j * 2^(k+1) + t < 256 by smt(expr_gt0 IntOrder.ler_pmul2r).
  have hidx2 : 0 <= j * 2^(k+1) + 2^k + t < 256 by smt(expr_gt0 IntOrder.ler_pmul2r).
  have h1 : `|sval p.[j * 2^(k+1) + t]| <= B by smt().
  have h2 : `|sval p.[j * 2^(k+1) + 2^k + t]| <= B by smt().
  have hm := mmr_table_bnd p.[j * 2^(k+1) + 2^k + t] (zpow (j + 2^(7-k))).
  have hmc := mmr_table p.[j * 2^(k+1) + 2^k + t] (zpow (j + 2^(7-k))).
  have hw : zpow (j + 2^(7-k)) = zpw (E k (2*j)) %% q by rewrite zpow_zpw -E_even.
  rewrite to_sintD_small.
  + by rewrite -e31; smt().
  rewrite to_sintB_small.
  + by rewrite -e31; smt().
  do! split.
  + by move=> {hbnd hB e31 e256 eSk hmc hw hidx1 hidx2}; smt().
  + by move=> {hbnd hB e31 e256 eSk hmc hw hidx1 hidx2}; smt().
  + rewrite -modzDmr hmc hw modzMmr modzDmr.
    by have -> // : sval p.[j * 2^(k+1) + t]
           + sval p.[j * 2^(k+1) + 2^k + t] * zpw (E k (2*j))
         = sval p.[j * 2^(k+1) + t]
           + zpw (E k (2*j)) * sval p.[j * 2^(k+1) + 2^k + t] by ring.
  rewrite -modzDmr -modzNm hmc hw modzMmr modzNm modzDmr.
  by have -> // : sval p.[j * 2^(k+1) + t]
         - sval p.[j * 2^(k+1) + 2^k + t] * zpw (E k (2*j))
       = sval p.[j * 2^(k+1) + t]
         - zpw (E k (2*j)) * sval p.[j * 2^(k+1) + 2^k + t] by ring.
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
(* The tree: main invariant                                             *)
(* ==================================================================== *)
lemma reduce_tree8 (p : wpoly) : reduce_tree p 8 = p.
proof. by rewrite /reduce_tree range_geq. qed.

lemma reduce_tree_alg (p : wpoly) (B k : int) :
  0 <= k <= 8 => 0 <= B => B + (8 - k) * q < 2^31 => cbnd p B =>
     cbnd (reduce_tree p k) (B + (8 - k) * q)
  /\ forall (j t : int), 0 <= j < 2^(8-k) => 0 <= t < 2^k =>
       sval (reduce_tree p k).[j * 2^k + t] %% q = nttsum p k j t %% q.
proof.
move=> + ge0B.
have : forall (d : int), 0 <= d => forall (k' : int),
  k' = 8 - d => 0 <= k' <= 8 => B + (8 - k') * q < 2^31 => cbnd p B =>
     cbnd (reduce_tree p k') (B + (8 - k') * q)
  /\ forall (j t : int), 0 <= j < 2^(8-k') => 0 <= t < 2^k' =>
       sval (reduce_tree p k').[j * 2^k' + t] %% q = nttsum p k' j t %% q.
- elim => [|d ge0d ih] k' eqk rgk hB hbnd.
  + have rt8 : reduce_tree p 8 = p.
    * by rewrite /reduce_tree range_geq.
    have -> : k' = 8 by smt().
    split; first by smt().
    move=> j t rgj rgt.
    have -> : j = 0 by move: rgj => /= /#.
    by rewrite nttsum8 /= rt8.
  have cgrD : forall (a a' b b' : int),
    a %% q = a' %% q => b %% q = b' %% q => (a + b) %% q = (a' + b') %% q.
  + by move=> a a' b b' ha hb; rewrite -modzDm ha hb modzDm.
  have cgrB : forall (a a' b b' : int),
    a %% q = a' %% q => b %% q = b' %% q => (a - b) %% q = (a' - b') %% q.
  + by move=> a a' b b' ha hb; rewrite -modzBm ha hb modzBm.
  have cgrMr : forall (c b b' : int),
    b %% q = b' %% q => (c * b) %% q = (c * b') %% q.
  + by move=> c b b' hb; rewrite -modzMmr hb modzMmr.
  have rgk' : 0 <= k' < 8 by smt().
  have eSk : 2^(k'+1) = 2 * 2^k' by rewrite exprS 1:/#.
  have e8k : 2^(8-k') = 2 * 2^(7-k').
  + by rewrite (: 8 - k' = (7 - k') + 1) 1:/# exprS 1:/#.
  have hkd : k' + 1 = 8 - d by smt().
  have hrg : 0 <= k' + 1 <= 8 by smt().
  have hB2 : B + (8 - (k'+1)) * q < 2^31.
  + by move: hB; rewrite /q /#.
  have := ih (k'+1) hkd hrg hB2 hbnd.
  rewrite (: 8 - (k'+1) = 7 - k') 1:/#.
  move=> [ihb ihs].
  have hstep : reduce_tree p k' = reduce_level (reduce_tree p (k'+1)) k'.
  + by rewrite (reduce_tree_step p k') 1:/#.
  have hB3 : (B + (7 - k') * q) + q < 2^31.
  + by move: hB; rewrite /q /#.
  have ge0B2 : 0 <= B + (7 - k') * q by smt(gt0_q).
  have [lvlb lvls] := reduce_level_alg
    (reduce_tree p (k'+1)) (B + (7 - k') * q) k' rgk' ge0B2 hB3 ihb.
  split.
  + rewrite hstep.
    by have -> : B + (8 - k') * q = (B + (7 - k') * q) + q by ring.
  move=> j t rgj rgt.
  rewrite hstep.
  case (j %% 2 = 0) => hpar.
  + pose j2 := j %/ 2.
    have jE : j = 2 * j2 by smt().
    have rgj2 : 0 <= j2 < 2^(7-k') by smt().
    have [c1 _] := nttsum_split p k' j2 t rgk' rgj2 rgt.
    rewrite jE c1.
    have := lvls j2 t rgj2 rgt.
    rewrite /= => -[l1 _].
    have eidx : 2 * j2 * 2^k' + t = j2 * 2^(k'+1) + t.
    * by rewrite eSk; ring.
    rewrite eidx l1.
    apply cgrD.
    * by apply (ihs j2 t rgj2 _); smt().
    apply cgrMr.
    rewrite (: t + 2^k' = 2^k' + t) 1:/#.
    have := ihs j2 (2^k' + t) rgj2 _; 1: smt().
    by rewrite (: j2 * 2^(k'+1) + (2^k' + t) = j2 * 2^(k'+1) + 2^k' + t) 1:/#.
  pose j2 := j %/ 2.
  have jE : j = 2 * j2 + 1 by smt().
  have rgj2 : 0 <= j2 < 2^(7-k') by smt().
  have [_ c2] := nttsum_split p k' j2 t rgk' rgj2 rgt.
  rewrite jE c2.
  have := lvls j2 t rgj2 rgt.
  rewrite /= => -[_ l2].
  have eidx : (2 * j2 + 1) * 2^k' + t = j2 * 2^(k'+1) + 2^k' + t.
  + by rewrite eSk; ring.
  rewrite eidx l2.
  apply cgrB.
  + by apply (ihs j2 t rgj2 _); smt().
  apply cgrMr.
  rewrite (: t + 2^k' = 2^k' + t) 1:/#.
  have := ihs j2 (2^k' + t) rgj2 _; 1: smt().
  by rewrite (: j2 * 2^(k'+1) + (2^k' + t) = j2 * 2^(k'+1) + 2^k' + t) 1:/#.
move=> main rgk hB hbnd.
have := main (8 - k) _ k _ _ _ _ => //; smt().
qed.

(* ==================================================================== *)
(* Endpoint: the full NTT is a multipoint evaluation                    *)
(* ==================================================================== *)
lemma ntt_alg (p : wpoly) (B : int) :
  0 <= B => B + 8 * q < 2^31 => cbnd p B =>
     cbnd (reduce_tree p 0) (B + 8 * q)
  /\ forall j, 0 <= j < 256 =>
       sval (reduce_tree p 0).[j] %% q
         = (bigi predT (fun s => zpw (E 0 j * s) * sval p.[s]) 0 256) %% q.
proof.
move=> ge0B hB hbnd.
have [hb hs] := reduce_tree_alg p B 0 _ ge0B _ hbnd => //.
split; first by move: hb => /=.
move=> j rgj.
have := hs j 0 _ _; 1,2: smt().
by rewrite /nttsum /=.
qed.
