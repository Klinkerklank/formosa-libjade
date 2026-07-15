(**
  Algebraic content of the machine-level NTT.

  The code-level proofs (`Fnttcorrect`, `Inttcorrect`) show that the AVX2
  procedures compute the word-level operators `reduce_tree` / `invtree` +
  `iscale`.  This theory gives those operators their mathematical meaning,
  in terms of polynomial modular reduction:

    Rq = Zq[X]/(X^256 + 1),  q = 8380417,  zeta_ = 1753 of order 512,
    X^256 + 1 = X^256 - zeta_^256, and the CRT tree

      X^(2m) - zeta_^(2e) = (X^m - zeta_^e) (X^m + zeta_^e)
      X^m + zeta_^e = X^m - zeta_^(e + 256)

  One `reduce p base len z` is one CRT split: if the block holds
  f = f0 + X^len f1 then the two halves of the result hold
  f mod (X^len -+ w) = f0 +- w f1, where the table entry z is w in
  centered Montgomery form (`qcenter (mrepr w)`) and `mmr` cancels the
  Montgomery factor.

  The main invariant (`reduce_tree_alg`): after levels 7..k, block j of
  size 2^k holds P mod (X^(2^k) - zeta_^(E k j)), coefficient-wise mod q,
  stated in closed form: coefficient t of block j is congruent to

      sum_{s < 2^(8-k)} zeta_^(E k j * s) * p[s * 2^k + t]      (nttsum)

  Values are interpreted through `W32.to_sint`; word arithmetic does not
  overflow provided the input coefficients are small enough: each level
  grows the coefficient magnitude by at most q (the `mmr` output is < q
  unconditionally), whence the assumption B + 8q < 2^31.
*)

(* ==================================================================== *)
require import AllCore CoreUtils List Ring IntDiv BitEncoding.
require import StdRing StdOrder StdBigop.
(*---*) import Bigint BIA IntOrder.

(* -------------------------------------------------------------------- *)
require import ListExtra Nttlogspec Nttspec Nttzetas.

(* -------------------------------------------------------------------- *)
from Jasmin require import JUtils JWord.

(* -------------------------------------------------------------------- *)
require import Array256.

(* -------------------------------------------------------------------- *)
require import Listred.

(* ==================================================================== *)
(* Interpretation of word-level data                                    *)
(* ==================================================================== *)
abbrev sval (w : W32.t) = W32.to_sint w.

(* all coefficients bounded by B in magnitude *)
op cbnd (p : wpoly) (B : int) =
  forall i, 0 <= i < 256 => `|sval p.[i]| <= B.

(* ==================================================================== *)
(* Basic facts about q                                                  *)
(* ==================================================================== *)
lemma gt0_q : 0 < q.
proof. by rewrite /q. qed.

lemma odd_q : 2 %| (q - 1).
proof. by rewrite /q. qed.

lemma lt_q_2p23 : q < 2^23.
proof. by rewrite /q. qed.

(* ==================================================================== *)
(* Word-level arithmetic (no-overflow conditions)                       *)
(* ==================================================================== *)
lemma to_sintD_small (a b : W32.t) :
  `|sval a + sval b| < 2^31 => sval (a + b) = sval a + sval b.
proof. by move=> h; apply: W32.to_sintD_small; move: h => /= /#. qed.

lemma to_sintB_small (a b : W32.t) :
  `|sval a - sval b| < 2^31 => sval (a - b) = sval a - sval b.
proof. by move=> h; apply: W32.to_sintB_small; move: h => /= /#. qed.

(* ==================================================================== *)
(* qcenter / mrepr                                                      *)
(* ==================================================================== *)
lemma qcenter_cgr (x : int) : qcenter x %% q = x %% q.
proof. by smt(gt0_q). qed.

lemma qcenter_bnd (x : int) : 2 * `|qcenter x| < q.
proof. by smt(gt0_q odd_q). qed.

(* table entries are read back exactly by to_sint *)
lemma to_sint_qcenter (x : int) :
  sval (W32.of_int (qcenter x)) = qcenter x.
proof. by rewrite W32.to_sintK_small; smt(qcenter_bnd gt0_q lt_q_2p23). qed.

lemma mrepr_cgr (w : int) : mrepr w %% q = (w * 2^32) %% q.
proof. by rewrite /mrepr modz_mod. qed.

(* ==================================================================== *)
(* Montgomery multiply-reduce: congruence and bound                     *)
(* ==================================================================== *)
(* master lemma: the word-level mmr computes the exact integer
   (u*z - T*q) / 2^32, where T is the (signed) low-word multiplier *)
lemma mmr_svalE (u z : W32.t) :
  sval (mmr u z)
    = (sval u * sval z
        - sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) * q)
      %/ 2^32.
proof.
rewrite /mmr /=.
have hA : W64.to_uint (u \sx z) = (sval u * sval z) %% W64.modulus.
- by rewrite /(\sx) W64.to_uintM /sigextu64 !W64.of_uintK modzMml modzMmr.
have hT64 : W64.to_uint
    (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449) \sx W32.of_int 8380417)
  = (sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) * q)
    %% W64.modulus.
- rewrite /(\sx) W64.to_uintM /sigextu64 !W64.of_uintK modzMml modzMmr.
  have -> // : sval (W32.of_int 8380417) = q.
  rewrite W32.to_sintK_small.
  - by rewrite /=.
  by rewrite /q.
rewrite W32.to_sintE W2u32.to_uint_truncateu32 W64.to_uint_shr //.
rewrite W64.to_uintD W64.to_uintN hA hT64.
have -> : (sval u * sval z %% JModel_x86.ptr_modulus +
    (- sval (truncateu32 ((u \sx z) * of_int 58728449)) * q %%
       JModel_x86.ptr_modulus) %%
    JModel_x86.ptr_modulus) %% JModel_x86.ptr_modulus
  = (sval u * sval z - sval (truncateu32 ((u \sx z) * of_int 58728449)) * q)
    %% JModel_x86.ptr_modulus.
- by smt(modzBm modz_mod modzNm modzDml modzDmr).
rewrite (: JModel_x86.ptr_modulus = 2^64) 1:// (: W32.modulus = 2^32) 1://.
rewrite modz_pow2_div 1:// (: 64 - 32 = 32) 1:// modz_mod.
have c1 : `|sval u| <= 2147483648.
- by have := W32.to_sint_cmp u => /= /#.
have c2 : `|sval z| <= 2147483648.
- by have := W32.to_sint_cmp z => /= /#.
have c3 : `|sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449))| <= 2147483648.
- by have := W32.to_sint_cmp (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) => /= /#.
have habs : `|sval u * sval z| <= 2147483648 * 2147483648.
- by rewrite normrM; apply IntOrder.ler_pmul; smt(IntOrder.normr_ge0).
have habsT : `|sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) * q|
    <= 2147483648 * q.
- rewrite normrM (: `|q| = q) 1:/q //.
  by apply IntOrder.ler_pmul; smt(IntOrder.normr_ge0 gt0_q).
rewrite /W32.smod /=.
smt().
qed.

lemma mmr_cgr (u z : W32.t) :
  (2^32 * sval (mmr u z)) %% q = (sval u * sval z) %% q.
proof.
have hA : W64.to_uint (u \sx z) = (sval u * sval z) %% W64.modulus.
- by rewrite /(\sx) W64.to_uintM /sigextu64 !W64.of_uintK modzMml modzMmr.
have hu : W32.to_uint (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449))
    = (sval u * sval z * 58728449) %% 2^32.
- rewrite W2u32.to_uint_truncateu32 W64.to_uintM hA W64.of_uintK.
  rewrite modzMml modzMmr (: W64.modulus = 2^64) 1:// (: W32.modulus = 2^32) 1://.
  by rewrite modz_dvd_pow 1://.
have hT : sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) %% 2^32
    = (sval u * sval z * 58728449) %% 2^32.
- rewrite W32.to_sintE /W32.smod /=.
  by case (2147483648 <= W32.to_uint (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449))) => _;
       rewrite hu; smt().
have hdvd : 2^32 %|
    (sval u * sval z - sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) * q).
- rewrite dvdzE.
  rewrite -modzBm -(modzMml (sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449))) q) hT.
  rewrite (modzMml (sval u * sval z * 58728449) q) modzBm.
  have -> : sval u * sval z - sval u * sval z * 58728449 * q
          = (sval u * sval z) * (1 - 58728449 * q) by ring.
  rewrite -modzMmr.
  have -> : (1 - 58728449 * q) %% W32.modulus = 0.
  - by rewrite /q /=.
  by rewrite /=.
rewrite mmr_svalE.
have -> : 2^32 * ((sval u * sval z
      - sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) * q) %/ 2^32)
  = sval u * sval z - sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) * q.
- by rewrite mulzC divzK.
rewrite -modzBm modzMl /=.
by rewrite modz_mod.
qed.

lemma mmr_bnd (u z : W32.t) :
  2 * `|sval z| < q => `|sval (mmr u z)| < q.
proof.
move=> hz.
rewrite mmr_svalE.
have c1 : `|sval u| <= 2147483648.
- by have := W32.to_sint_cmp u => /= /#.
have hsz : `|sval z| <= 4190208.
- by move: hz; rewrite /q /#.
have habs : `|sval u * sval z| <= 2147483648 * 4190208.
- rewrite normrM.
  apply IntOrder.ler_pmul.
  - by apply IntOrder.normr_ge0.
  - by apply IntOrder.normr_ge0.
  - by apply c1.
  by apply hsz.
have c3 : `|sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449))| <= 2147483648.
- by have := W32.to_sint_cmp (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) => /= /#.
have hq : `|q| = q.
- by rewrite /q.
have habsT : `|sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) * q|
    <= 2147483648 * q.
- rewrite normrM hq.
  apply IntOrder.ler_pmul.
  - by apply IntOrder.normr_ge0.
  - by rewrite /q.
  - by apply c3.
  by done.
(* bound the dividend, then conclude by monotonicity of division:
   no division reasoning is left to the provers *)
have hDu : sval u * sval z
    - sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) * q
    <= 26995211632640000.
- by move: habs habsT; rewrite /q /#.
have hDl : -26995211632640000
    <= sval u * sval z
       - sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) * q.
- by move: habs habsT; rewrite /q /#.
have hup := leq_div2r (2^32)
  (sval u * sval z - sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) * q)
  26995211632640000 hDu _.
- by apply expr_ge0.
have hdn := leq_div2r (2^32) (-26995211632640000)
  (sval u * sval z - sval (W2u32.truncateu32 ((u \sx z) * W64.of_int 58728449)) * q)
  hDl _.
- by apply expr_ge0.
move: hup hdn.
rewrite (: 26995211632640000 %/ 2^32 = 6285312) 1://.
rewrite (: (-26995211632640000) %/ 2^32 = -6285313) 1://.
move=> hup hdn.
apply (IntOrder.ler_lt_trans 6285313).
- rewrite IntOrder.ler_norml.
  split.
  - by apply hdn.
  move=> _.
  apply (IntOrder.ler_trans 6285312).
  - by apply hup.
  by done.
by rewrite /q.
qed.

(* 2^32 is invertible mod q (q odd): cancellation *)
lemma cgr_pow2_cancel (a b : int) :
  (2^32 * a) %% q = (2^32 * b) %% q => a %% q = b %% q.
proof.
move=> h.
have e : (8265825 * 2^32) %% q = 1 by rewrite /q /=.
have -> : a %% q = ((8265825 * 2^32) %% q * a) %% q.
- by rewrite e /=.
have -> : b %% q = ((8265825 * 2^32) %% q * b) %% q.
- by rewrite e /=.
rewrite !modzMml.
have -> : 8265825 * 2^32 * a = 8265825 * (2^32 * a) by ring.
have -> : 8265825 * 2^32 * b = 8265825 * (2^32 * b) by ring.
by rewrite -modzMmr h modzMmr.
qed.

(* mmr against a table entry: the Montgomery factor cancels *)
lemma mmr_table (u : W32.t) (w : int) :
  (sval (mmr u (W32.of_int (qcenter (mrepr w)))) %% q)
    = (sval u * w) %% q.
proof.
apply cgr_pow2_cancel.
rewrite mmr_cgr to_sint_qcenter.
rewrite -(modzMmr (sval u) (qcenter (mrepr w)) q) qcenter_cgr mrepr_cgr modzMmr.
by have -> : sval u * (w * 2^32) = 2^32 * (sval u * w) by ring.
qed.

lemma mmr_table_bnd (u : W32.t) (w : int) :
  `|sval (mmr u (W32.of_int (qcenter (mrepr w))))| < q.
proof. by apply mmr_bnd; rewrite to_sint_qcenter qcenter_bnd. qed.

(* ==================================================================== *)
(* Integer powers of zeta_                                              *)
(* ==================================================================== *)
(* helper: mod-pow compatibility (missing from IntDiv) *)
lemma modzXm (x n m : int) : 0 <= n => (x %% m) ^ n %% m = x ^ n %% m.
proof.
move=> ge0_n; elim: n ge0_n => [|n ge0_n ih]; first by rewrite !expr0.
by rewrite !exprS // modzMml -modzMmr ih modzMmr.
qed.

(* zeta_ has order 512 mod q *)
lemma zeta_512 : zeta_ ^ 512 %% q = 1.
proof. by rewrite /zeta_ /q /=. qed.

lemma zexp_modE (n : int) : 0 <= n =>
  zeta_ ^ (n %% 512) %% q = zeta_ ^ n %% q.
proof.
move=> ge0_n.
rewrite {2}(divz_eq n 512) exprD_nneg 1:mulr_ge0 1:divz_ge0 // 1:modz_ge0 //.
rewrite mulzC (mulzC (n %/ 512) 512) exprM.
rewrite -(modzMmr (zeta_ ^ (n %% 512)) (zeta_ ^ 512 ^ (n %/ 512)) q).
rewrite -(modzXm (zeta_ ^ 512) (n %/ 512) q) 1:divz_ge0 ~-1://.
by rewrite zeta_512 expr1z modzMmr /=.
qed.

(* reduce exponents mod 512 *)
op zpw (e : int) : int = zeta_ ^ (e %% 512).

lemma zpw_cgr_exp (e e' : int) :
  e %% 512 = e' %% 512 => zpw e = zpw e'.
proof. by move=> @/zpw ->. qed.

lemma zpwD (a b : int) : zpw (a + b) %% q = (zpw a * zpw b) %% q.
proof.
by rewrite /zpw -exprD_nneg ?modz_ge0 // -modzDm zexp_modE ?addr_ge0 ?modz_ge0.
qed.

(* zeta_^256 = -1 mod q: the key sign identity of the CRT tree *)
lemma zpw_256 : zpw 256 %% q = (-1) %% q.
proof. by rewrite /zpw /zeta_ /q /=. qed.

lemma zpw_oppE (e : int) : zpw (e + 256) %% q = (- zpw e) %% q.
proof. by rewrite zpwD -modzMmr zpw_256 modzMmr mulrN1. qed.

lemma bitrev8_rg (x : int) : 0 <= bitrev8 x < 256.
proof.
rewrite /bitrev8; split; [exact BS2Int.bs2int_ge0 | move=> _].
have := BS2Int.bs2int_le2Xs (rev (BS2Int.int2bs 8 x)).
by rewrite size_rev BS2Int.size_int2bs /=.
qed.

lemma bitrev8_0 : bitrev8 0 = 0.
proof.
by rewrite /bitrev8 BS2Int.int2bs0 rev_nseq BS2Int.bs2int_nseq_false.
qed.

(* the halving identity behind the exponent tree *)
lemma bitrev8_half (x : int) : 0 <= x < 256 =>
  2 * bitrev8 x = bitrev8 (x %/ 2) + 256 * (x %% 2).
proof.
move=> rgx @/bitrev8.
rewrite (BS2Int.int2bs_cons 8 x) // rev_cons BS2Int.bs2int_rcons.
rewrite size_rev BS2Int.size_int2bs /=.
rewrite (BS2Int.int2bs_rcons 8 (x %/ 2)) //.
have -> /=: x %/ 2 %/ 2 ^ (8 - 1) = 0 by smt().
rewrite rev_rcons BS2Int.bs2int_cons /max /=.
case (2 %| x) => hx /=.
- rewrite b2i0 /=.
  by have -> : x %% 2 = 0 by rewrite -dvdzE.
rewrite b2i1 /=.
have -> : x %% 2 = 1 by smt().
by ring.
qed.

(* link with the table exponents of Nttlogspec *)
lemma zpow_zpw (x : int) : zpow x = zpw (bitrev8 x) %% q.
proof.
by rewrite /zpow /zpw (pmod_small (bitrev8 x) 512); smt(bitrev8_rg).
qed.

(* ==================================================================== *)
(* The exponent tree                                                    *)
(* ==================================================================== *)
(* E k j: block j at level k holds P mod (X^(2^k) - zeta_^(E k j)).
   Level 8 is the whole input: X^256 + 1 = X^256 - zeta_^256.
   Splitting block j of level k+1 with w = zeta_^(bitrev8 (j + 2^(7-k)))
   yields children 2j (minus sign) and 2j+1 (plus sign, i.e. e + 256). *)
op E (k j : int) : int =
  if k = 8 then 256
  else bitrev8 (j %/ 2 + 2^(7-k)) + 256 * (j %% 2).

lemma E_even (k j : int) : 0 <= k < 8 =>
  E k (2*j) = bitrev8 (j + 2^(7-k)).
proof. by move=> rgk @/E; rewrite ifF 1:/# mulKz // modzMr /=. qed.

lemma E_odd (k j : int) : 0 <= k < 8 =>
  E k (2*j+1) = E k (2*j) + 256.
proof. by move=> rgk @/E; rewrite !ifF 1,2:/#; smt(). qed.

lemma E_range (k j : int) :
  0 <= k <= 8 => 0 <= j < 2^(8-k) => 0 <= E k j < 512.
proof. by move=> rgk rgj @/E; smt(bitrev8_rg). qed.

(* squaring a child exponent gives the parent exponent *)
lemma E_double (k j : int) : 0 <= k < 8 => 0 <= j < 2^(7-k) =>
  (2 * E k (2*j)) %% 512 = E (k+1) j %% 512.
proof.
move=> rgk rgj; rewrite E_even //.
case (k = 7) => [->>|neq7].
- move: rgj => /= rgj; have ->: j = 0 by smt().
  by have := bitrev8_half 1 _; smt(bitrev8_0).
have h2: 2^(7-k) = 2 * 2^(6-k) by rewrite -exprS 1:/# /#.
rewrite /E ifF 1:/#.
have le: 2^(7-k) <= 128.
- have e7 : 128 = 2 ^ 7 by rewrite /=.
  by rewrite e7; apply IntOrder.ler_weexpn2l => /#.
rewrite bitrev8_half 1:/#.
have -> : (j + 2^(7-k)) %/ 2 = j %/ 2 + 2^(6-k) by smt().
have -> : (j + 2^(7-k)) %% 2 = j %% 2 by smt().
by have -> : 7 - (k + 1) = 6 - k by smt().
qed.

(* ==================================================================== *)
(* The target sums: coefficients of P mod (X^(2^k) - zeta_^(E k j))     *)
(* ==================================================================== *)
(* helpers: congruence of big sums, and even/odd splitting *)
lemma big_cgr (m : int) (f g : int -> int) (a b : int) :
  (forall i, a <= i < b => f i %% m = g i %% m) =>
  bigi predT f a b %% m = bigi predT g a b %% m.
proof.
move=> h; have {h} : forall i, i \in range a b => f i %% m = g i %% m.
- by move=> i /mem_range; apply h.
elim: (range a b) => [|x s ih] hs; first by rewrite !big_nil.
rewrite !big_cons /predT /=.
by rewrite -modzDm hs // ih 1:/# modzDm.
qed.

lemma big_split_parity (F : int -> int) (n : int) : 0 <= n =>
    bigi predT F 0 (2*n)
  = bigi predT (fun u => F (2*u)) 0 n + bigi predT (fun u => F (2*u+1)) 0 n.
proof.
elim: n => [|n ge0_n ih]; first by rewrite !big_geq.
have ->: 2*(n+1) = (2*n+1)+1 by ring.
rewrite big_int_recr 1:/# big_int_recr 1:/# ih.
rewrite big_int_recr // big_int_recr //=.
by ring.
qed.

(* Since X^(s * 2^k + t) = (X^(2^k))^s * X^t = zeta_^(E k j * s) * X^t
   modulo the block modulus, coefficient t of the residue is: *)
op nttsum (p : wpoly) (k j t : int) : int =
  bigi predT (fun s => zpw (E k j * s) * sval p.[s * 2^k + t]) 0 (2^(8-k)).

(* level 8: the residue is the polynomial itself *)
lemma nttsum8 (p : wpoly) (t : int) : nttsum p 8 0 t = sval p.[t].
proof. by rewrite /nttsum /= big_int1 /= /zpw /=. qed.

(* the butterfly identity on sums: splitting even/odd s in the parent
   sum realizes the CRT step *)
lemma nttsum_split (p : wpoly) (k j t : int) :
  0 <= k < 8 => 0 <= j < 2^(7-k) => 0 <= t < 2^k =>
     nttsum p k (2*j) t %% q
       = (nttsum p (k+1) j t + zpw (E k (2*j)) * nttsum p (k+1) j (t + 2^k)) %% q
  /\ nttsum p k (2*j+1) t %% q
       = (nttsum p (k+1) j t - zpw (E k (2*j)) * nttsum p (k+1) j (t + 2^k)) %% q.
proof.
move=> rgk rgj rgt.
have cgrM : forall (a a' b : int), a %% q = a' %% q => (a * b) %% q = (a' * b) %% q.
- by move=> a a' b h; rewrite -modzMml h modzMml.
have e8k : 2^(8-k) = 2 * 2^(7-k).
- by rewrite (_ : 8 - k = (7 - k) + 1) 1:/# exprS 1:/#.
have heven : forall u, zpw (E k (2*j) * (2*u)) = zpw (E (k+1) j * u).
- move=> u; apply zpw_cgr_exp.
  have ->: E k (2*j) * (2*u) = (2 * E k (2*j)) * u by ring.
  by rewrite -modzMml E_double // modzMml.
have hidx : forall u, (2*u) * 2^k + t = u * 2^(k+1) + t.
- by move=> u; rewrite exprS 1:/# /#.
have hidx1 : forall u, (2*u+1) * 2^k + t = u * 2^(k+1) + (t + 2^k).
- by move=> u; rewrite exprS 1:/# /#.
have hodd :
    bigi predT
      (fun u => zpw (E k (2*j) * (2*u+1)) * sval p.[(2*u+1) * 2^k + t])
      0 (2^(7-k)) %% q
  = (zpw (E k (2*j)) *
       bigi predT
         (fun u => zpw (E (k+1) j * u) * sval p.[u * 2^(k+1) + (t + 2^k)])
         0 (2^(7-k))) %% q.
- rewrite BIA.mulr_sumr.
  apply big_cgr => u rgu /=.
  rewrite hidx1 mulrA.
  rewrite -modzMml -(modzMml
    (zpw (E k (2*j)) * zpw (E (k+1) j * u))
    (sval p.[u * 2^(k+1) + (t + 2^k)]) q).
  congr; congr.
  have ->: E k (2*j) * (2*u+1) = E k (2*j) + E k (2*j) * (2*u) by ring.
  by rewrite zpwD heven.
split.
- rewrite /nttsum.
  have -> : 8 - (k + 1) = 7 - k by smt().
  rewrite e8k big_split_parity 1:expr_ge0 //=.
  have -> :
      bigi predT
        (fun (u : int) => zpw (E k (2*j) * (2*u)) * sval p.[(2*u) * 2^k + t])
        0 (2^(7-k))
    = bigi predT
        (fun (u : int) => zpw (E (k+1) j * u) * sval p.[u * 2^(k+1) + t])
        0 (2^(7-k)).
  + by apply eq_big_int => u rgu /=; rewrite heven hidx.
  by rewrite -modzDmr hodd modzDmr.
have heven2 : forall u, zpw (E k (2*j+1) * (2*u)) = zpw (E (k+1) j * u).
- move=> u; rewrite E_odd //; apply zpw_cgr_exp.
  have ->: (E k (2*j) + 256) * (2*u) = u * 512 + (2 * E k (2*j)) * u by ring.
  by rewrite modzMDl -modzMml E_double // modzMml.
have hodd2 :
    bigi predT
      (fun u => zpw (E k (2*j+1) * (2*u+1)) * sval p.[(2*u+1) * 2^k + t])
      0 (2^(7-k)) %% q
  = (- zpw (E k (2*j)) *
       bigi predT
         (fun u => zpw (E (k+1) j * u) * sval p.[u * 2^(k+1) + (t + 2^k)])
         0 (2^(7-k))) %% q.
- rewrite BIA.mulr_sumr BIA.sumrN /=.
  apply big_cgr => u rgu /=.
  rewrite hidx1 E_odd //.
  have ->: (E k (2*j) + 256) * (2*u+1)
         = (E k (2*j) + 256) + (E k (2*j) + 256) * (2*u) by ring.
  rewrite mulrA -mulNr.
  rewrite mulrA.
  apply cgrM.
  rewrite zpwD.
  have ->: (E k (2*j) + 256) * 2 * u = E k (2*j+1) * (2*u).
  + by rewrite E_odd //; ring.
  rewrite heven2.
  by apply cgrM; apply zpw_oppE.
rewrite /nttsum.
have -> : 8 - (k + 1) = 7 - k by smt().
rewrite e8k big_split_parity 1:expr_ge0 //=.
have -> :
    bigi predT
      (fun (u : int) => zpw (E k (2*j+1) * (2*u)) * sval p.[(2*u) * 2^k + t])
      0 (2^(7-k))
  = bigi predT
      (fun (u : int) => zpw (E (k+1) j * u) * sval p.[u * 2^(k+1) + t])
      0 (2^(7-k)).
- by apply eq_big_int => u rgu /=; rewrite heven2 hidx.
by rewrite -modzDmr hodd2 modzDmr.
qed.

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
