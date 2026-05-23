require import AllCore List StdOrder IntDiv.

from Jasmin require import JModel_x86.

from JazzEC require import Ml_dsa_65_avx2 Mldsa_65_prelude.

from Spec require import GFq Rq Serialization Conversion Parameters VecMat
                         Symmetric Sampling MLDSA_W32_Rep MLDSA.

from CryptoSpecs require import Keccak1600_Spec.

import PolyLVec PolyKVec PolyMat.
import CDR Round Zq PolyReduceZq BigZMod.
import IntOrder.

require import Array48 Array136 Array256.
require import WArray136.

(* ==================================================================== *)
(* Streams                                                               *)
(*                                                                       *)
(* A stream of 'a is a total function int -> 'a. We use streams to       *)
(* model the (conceptually infinite) byte output of SHAKE256, and the    *)
(* per-iteration rejection sampling step of SampleInBall as a stream     *)
(* combinator (sfilter). All operators are total: sfilter pads with      *)
(* witness when the filtered substream is finite. We will only apply     *)
(* sfilter in situations where the witness branch is not reached.        *)
(* ==================================================================== *)

(* -------------------------------------------------------------------- *)
type 'a stream = int -> 'a.

(* -------------------------------------------------------------------- *)
op shead ['a] (s : 'a stream) : 'a       = s 0.
op stail ['a] (s : 'a stream) : 'a stream = fun i => s (i + 1).

op sdrop ['a] (n : int) (s : 'a stream) : 'a stream =
  fun i => s (i + n).

op smap ['a 'b] (f : 'a -> 'b) (s : 'a stream) : 'b stream =
  fun i => f (s i).

op stake ['a] (n : int) (s : 'a stream) : 'a list =
  mkseq s n.

(* -------------------------------------------------------------------- *)
lemma sdrop0 ['a] (s : 'a stream) : sdrop 0 s = s.
proof. by apply: fun_ext => i; rewrite /sdrop. qed.

lemma sdropD ['a] (n m : int) (s : 'a stream) :
  sdrop n (sdrop m s) = sdrop (n + m) s.
proof. by apply: fun_ext => i; rewrite /sdrop /#. qed.

lemma sdrop_stail ['a] (s : 'a stream) : sdrop 1 s = stail s.
proof. by apply: fun_ext => i; rewrite /sdrop /stail. qed.

lemma stake0 ['a] (s : 'a stream) : stake 0 s = [].
proof. by rewrite /stake mkseq0. qed.

lemma size_stake ['a] (n : int) (s : 'a stream) :
  0 <= n => size (stake n s) = n.
proof. by move=> ?; rewrite /stake size_mkseq; smt(). qed.

lemma nth_stake ['a] (dfl : 'a) (n i : int) (s : 'a stream) :
  0 <= i < n => nth dfl (stake n s) i = s i.
proof. by move=> ?; rewrite /stake nth_mkseq. qed.

(* ==================================================================== *)
(* Filtering a stream                                                    *)
(*                                                                       *)
(* sfilter P s : the substream of s consisting of elements passing P.    *)
(* nth_pass P s i : index in s of the i-th element passing P, or -1 if   *)
(* the filtered stream has fewer than i+1 elements.                      *)
(* ==================================================================== *)

(* -------------------------------------------------------------------- *)
(* "Position n is the i-th pass of P in s":                              *)
(*   0 <= n, s n passes P, and exactly i strictly earlier positions also *)
(*   pass P.                                                             *)
(* -------------------------------------------------------------------- *)
op is_nth_pass ['a] (P : 'a -> bool) (s : 'a stream) (i n : int) : bool =
     0 <= n
  /\ P (s n)
  /\ size (filter P (stake n s)) = i.

(* -------------------------------------------------------------------- *)
op nth_pass ['a] (P : 'a -> bool) (s : 'a stream) (i : int) : int =
  choiceb (is_nth_pass P s i) (-1).

(* -------------------------------------------------------------------- *)
op sfilter ['a] (P : 'a -> bool) (s : 'a stream) : 'a stream =
  fun i =>
    let n = nth_pass P s i in
    if n < 0 then witness else s n.

(* -------------------------------------------------------------------- *)
(* "accept": rejection-sampling primitive.                               *)
(*   accept P s = (b, k) where b is the first element of s passing P     *)
(*   and k = 1 + (number of rejected elements before b).                 *)
(* The padding case (no element of s passes P) is mapped to (witness, 0) *)
(* and is never reached in our usage.                                    *)
(* -------------------------------------------------------------------- *)
op accept ['a] (P : 'a -> bool) (s : 'a stream) : 'a * int =
  let n = nth_pass P s 0 in
  if n < 0 then (witness, 0) else (s n, n + 1).

(* -------------------------------------------------------------------- *)
(* "n is the FIRST pass of P in s" — a friendlier predicate than         *)
(* is_nth_pass with i=0. We will show is_nth_pass P s 0 n <=> is_first.  *)
(* -------------------------------------------------------------------- *)
op is_first_pass ['a] (P : 'a -> bool) (s : 'a stream) (n : int) : bool =
     0 <= n
  /\ P (s n)
  /\ (forall k, 0 <= k < n => !P (s k)).

(* -------------------------------------------------------------------- *)
lemma is_first_passE ['a] (P : 'a -> bool) (s : 'a stream) (n : int) :
  is_nth_pass P s 0 n <=> is_first_pass P s n.
proof.
rewrite /is_nth_pass /is_first_pass; split.
- move=> [#] hpos hP hsz; do! split => //.
  move=> k hk; apply/negP => hPk.
  have hk_in : s k \in filter P (stake n s).
  - rewrite mem_filter; split; first by done.
    by rewrite /stake; apply/mkseqP; exists k; smt().
  have : 0 < size (filter P (stake n s)).
  - by have/= := List.size_ge0 (filter P (stake n s)); smt(size_eq0 hasP).
  by rewrite hsz.
move=> [#] hpos hP hno; do! split => //.
apply/size_eq0/eq_in_filter_pred0 => x.
rewrite /stake; case/mkseqP => k [hk] ->.
by apply/negP; apply: hno.
qed.

(* -------------------------------------------------------------------- *)
lemma is_first_pass_uniq ['a] (P : 'a -> bool) (s : 'a stream) (a b : int) :
  is_first_pass P s a => is_first_pass P s b => a = b.
proof.
rewrite /is_first_pass.
move=> [#] ha1 ha2 ha3 [#] hb1 hb2 hb3.
case (a < b) => hab.
- by have := hb3 a _; [smt() | rewrite ha2].
case (b < a) => hba.
- by have := ha3 b _; [smt() | rewrite hb2].
smt().
qed.

(* -------------------------------------------------------------------- *)
lemma nth_pass_first ['a] (P : 'a -> bool) (s : 'a stream) (n : int) :
  is_first_pass P s n => nth_pass P s 0 = n.
proof.
move=> hn; rewrite /nth_pass.
have hex : exists m, is_nth_pass P s 0 m by exists n; rewrite is_first_passE.
have hpick : is_nth_pass P s 0 (choiceb (is_nth_pass P s 0) (-1)).
- by apply: (choicebP (is_nth_pass P s 0) (-1)).
move/is_first_passE: hpick => hpick.
by apply: is_first_pass_uniq hpick hn.
qed.

(* -------------------------------------------------------------------- *)
(* Characterization of accept under the "there is a first pass"          *)
(* assumption — the only one we will ever need.                          *)
(* -------------------------------------------------------------------- *)
lemma accept_first ['a] (P : 'a -> bool) (s : 'a stream) (n : int) :
  is_first_pass P s n =>
  accept P s = (s n, n + 1).
proof.
move=> hn @/accept /=; rewrite (nth_pass_first _ _ _ hn).
move: hn; rewrite /is_first_pass => /> hpos _ _.
by have ->: !(n < 0) by smt().
qed.

(* ==================================================================== *)
(* The SHAKE256 byte stream                                              *)
(*                                                                       *)
(* SHAKE256 produces an arbitrarily long byte sequence; we view it as a  *)
(* total stream indexed by int. The fundamental fact (axiomatized here,  *)
(* to be proved later from the SHAKE256 prefix property) is that any     *)
(* finite squeeze of length n is a prefix of this stream.                *)
(* ==================================================================== *)

(* -------------------------------------------------------------------- *)
op shake256_stream : W8.t list -> W8.t stream.

(* -------------------------------------------------------------------- *)
(* The finite squeeze SHAKE256 m n returns the first n bytes of the     *)
(* infinite stream.                                                      *)
(* -------------------------------------------------------------------- *)
axiom shake256_streamE (m : W8.t list) (n : int) :
  0 <= n => SHAKE256 m n = stake n (shake256_stream m).

(* -------------------------------------------------------------------- *)
(* Equivalent point-wise form: byte at offset i is shake256_stream m i, *)
(* provided i < n.                                                       *)
(* -------------------------------------------------------------------- *)
lemma shake256_streamP (m : W8.t list) (n i : int) :
  0 <= i < n =>
  nth witness (SHAKE256 m n) i = shake256_stream m i.
proof.
move=> hi; rewrite shake256_streamE 1:/# nth_stake //.
qed.

(* ==================================================================== *)
(* Functional view of SampleInBall                                       *)
(*                                                                       *)
(* sampleInBall_fun ct : poly                                            *)
(*                                                                       *)
(* Mirrors the spec module SampleInBall(MLDSA_XOF_SIB).sample but as a   *)
(* pure operator on the byte stream.                                     *)
(*                                                                       *)
(* The stream produced by SHAKE256 on the seed is split into:            *)
(*   - the first 8 bytes (sib_sign_bytes) decoded as 64 sign bits        *)
(*     (sib_h ct k = bit k of the sign-byte block, LSB-first per byte)   *)
(*   - the rest (sib_xof_stream ct), used for the rejection-sampling     *)
(*     coefficient placement.                                            *)
(*                                                                       *)
(* The outer loop is i = 256-tau .. 255; at each iteration we accept the *)
(* first byte b of the post-position stream with W8.to_uint b <= i.      *)
(* ==================================================================== *)

(* -------------------------------------------------------------------- *)
op sib_sign_bytes (ct : BytesCT.t) : W8.t list =
  stake 8 (shake256_stream (BytesCT.to_list ct)).

(* -------------------------------------------------------------------- *)
(* The sign-bit stream: bit k of the 64-bit sign block, LSB-first        *)
(* within each byte. Bit k is bit (k mod 8) of byte (k / 8).             *)
(* (Indices outside [0, 64) are irrelevant; we use sib_h ct only with    *)
(* 0 <= k < tau, and tau <= 60 across all ML-DSA parameter sets.)        *)
(* -------------------------------------------------------------------- *)
op sib_h (ct : BytesCT.t) : bool stream =
  fun k =>
    W8.int_bit (W8.to_uint (nth witness (sib_sign_bytes ct) (k %/ 8))) (k %% 8).

(* -------------------------------------------------------------------- *)
(* The XOF substream consumed by the sampling loop:                      *)
(*   the SHAKE256 stream starting at offset 8 (after the sign bytes).    *)
(* -------------------------------------------------------------------- *)
op sib_xof_stream (ct : BytesCT.t) : W8.t stream =
  sdrop 8 (shake256_stream (BytesCT.to_list ct)).

(* -------------------------------------------------------------------- *)
(* One iteration of the outer loop.                                      *)
(*                                                                       *)
(* state = (current polynomial, current offset into the XOF substream).  *)
(* i = the outer loop counter (256-tau ≤ i < 256).                       *)
(*                                                                       *)
(* Rejection-sample the next byte j with W8.to_uint j <= i, swap         *)
(* c.[i] and c.[j], then write ±1 into c.[j] depending on sign bit       *)
(* h (i + tau - 256).                                                    *)
(* -------------------------------------------------------------------- *)
op sib_step
   (s : W8.t stream)         (* XOF substream after the sign bytes  *)
   (h : bool stream)         (* sign-bit stream                     *)
   (state : poly * int)
   (i : int)
 : poly * int =
  let acc = accept (fun b => W8.to_uint b <= i) (sdrop state.`2 s) in
  let j   = W8.to_uint acc.`1 in
  (state.`1.[i <- state.`1.[j]].[j <-
       if h (i + tau - 256) then incoeff (-1) else incoeff 1],
   state.`2 + acc.`2).

(* -------------------------------------------------------------------- *)
op sampleInBall_fun (ct : BytesCT.t) : poly =
  let s = sib_xof_stream ct in
  let h = sib_h ct in
  (foldl (sib_step s h) (poly_zero, 0) (range (256 - tau) 256)).`1.

(* ==================================================================== *)
(* Range invariant: sampleInBall_fun emits a polynomial with each       *)
(* coefficient in {-1, 0, 1}.                                            *)
(* ==================================================================== *)

(* -------------------------------------------------------------------- *)
(* crepr of ±1 and 0 is the integer itself. We will need this to prove  *)
(* that the values written by sib_step satisfy -1 <= crepr c <= 1.      *)
(* -------------------------------------------------------------------- *)
lemma crepr_incoeff_small (n : int) :
  -1 <= n <= 1 => crepr (incoeff n) = n.
proof.
move=> hn; rewrite /crepr /=.
have hq : 2 < q by smt(prime_q gt1_prime).
rewrite (_ : (q + 1) %/ 2 = (q - 1) %/ 2 + 1) 1:/#.
have hbound : 0 < (q - 1) %/ 2 by smt().
case (0 <= n) => hn0.
- have ha : asint (incoeff n) = n.
  - by rewrite incoeffK; smt(modz_small).
  rewrite ha; smt().
have ha : asint (incoeff n) = n + q.
- have -> : incoeff n = incoeff (n + q) by rewrite -eq_incoeff; smt().
  by rewrite incoeffK; smt(modz_small).
rewrite ha; smt().
qed.

(* -------------------------------------------------------------------- *)
(* poly_srng 1 1 poly_zero — the all-zero polynomial trivially lies in   *)
(* [-1, 1].                                                              *)
(* -------------------------------------------------------------------- *)
lemma poly_srng_zero : poly_srng 1 1 poly_zero.
proof.
rewrite /poly_srng allP => k hk.
rewrite poly_zeroE 1:/# /=.
have -> : Zq.zero = incoeff 0 by smt(@Zq).
by rewrite crepr_incoeff_small // /#.
qed.

(* -------------------------------------------------------------------- *)
(* sib_step preserves poly_srng 1 1, provided i is a valid array index.  *)
(* (Always satisfied in our use: 256 - tau <= i < 256 and tau > 0.)     *)
(* -------------------------------------------------------------------- *)
lemma sib_step_range (s : W8.t stream) (h : bool stream) (st : poly * int) (i : int) :
  0 <= i < 256 =>
  poly_srng 1 1 st.`1 =>
  poly_srng 1 1 (sib_step s h st i).`1.
proof.
case: st => c pos /= hi hinv; rewrite /sib_step /=.
case _: (accept _ _) => j_byte dpos /= _.
pose c1 := c.[i <- c.[W8.to_uint j_byte]].
pose v  := if h (i + tau - 256) then incoeff (-1) else incoeff 1.
have hv : -1 <= crepr v <= 1.
- rewrite /v; case (h (i + tau - 256)) => _ /=.
  + by rewrite crepr_incoeff_small // /#.
  + by rewrite crepr_incoeff_small // /#.
move: hinv; rewrite {1}/poly_srng allP => hinv.
have hj : 0 <= W8.to_uint j_byte < 256.
- have := W8.to_uint_cmp j_byte.
  by rewrite -/W8.modulus /=; smt().
have h1 : poly_srng 1 1 c1.
- rewrite /poly_srng allP => k hk.
  rewrite /c1 Array256.get_setE 1:/#.
  case (k = i) => _.
  + by apply hinv.
  + by apply hinv.
rewrite /poly_srng allP => k hk.
rewrite Array256.get_setE //.
case (k = W8.to_uint j_byte) => _.
- by rewrite -/v.
- by move: h1; rewrite /poly_srng allP => /(_ k); apply.
qed.

(* -------------------------------------------------------------------- *)
(* The foldl preserves the invariant, provided every index in the input *)
(* list is a valid array index.                                          *)
(* -------------------------------------------------------------------- *)
lemma sib_foldl_range (s : W8.t stream) (h : bool stream) (st : poly * int) (rs : int list) :
  all (fun i => 0 <= i < 256) rs =>
  poly_srng 1 1 st.`1 =>
  poly_srng 1 1 (foldl (sib_step s h) st rs).`1.
proof.
elim: rs st => //= i rs IH st [hi hall] hst.
by apply IH => //; apply sib_step_range.
qed.

(* -------------------------------------------------------------------- *)
lemma sampleInBall_fun_range (ct : BytesCT.t) :
  poly_srng 1 1 (sampleInBall_fun ct).
proof.
rewrite /sampleInBall_fun /=.
apply sib_foldl_range; last by apply poly_srng_zero.
apply/List.allP => i; rewrite mem_range => /=; smt(MLDSAParams.tau_bound).
qed.

(* ==================================================================== *)
(* Sign-bit bridges                                                      *)
(*                                                                       *)
(* (a) Combinatorial: nth bit of BytesToBits l = bit (k mod 8) of        *)
(*     byte l.[k/8].                                                     *)
(* (b) Spec side: sib_h ct = BytesToBits of the spec sign-bytes.        *)
(* (c) Jasmin side: bit k of the W64 sign register equals sib_h ct k    *)
(*     (declared as axiom for now, to be discharged in step 8).         *)
(* ==================================================================== *)

(* -------------------------------------------------------------------- *)
(* nth bit of BytesToBits = bit (k mod 8) of byte (k / 8).               *)
(* -------------------------------------------------------------------- *)
lemma BytesToBits_nth (bs : W8.t list) (k : int) :
  0 <= k < 8 * size bs =>
  nth false (BytesToBits bs) k =
    W8.int_bit (W8.to_uint (nth witness bs (k %/ 8))) (k %% 8).
proof.
move=> hk; rewrite /BytesToBits.
have hall : all (fun s => size s = 8) (map W8.w2bits bs).
- by apply/List.allP => x /mapP [b] [_] ->; smt(W8.size_w2bits).
rewrite (BitEncoding.BitChunking.nth_flatten false 8 _ k hall).
have hsz_map : size (map W8.w2bits bs) = size bs by rewrite size_map.
have hd : 0 <= k %/ 8 < size bs by smt().
have hm : 0 <= k %% 8 < 8 by smt().
rewrite (nth_map witness []) /=; first by smt().
pose b := nth witness bs (k %/ 8).
have hb : nth false (W8.w2bits b) (k %% 8) = b.[k %% 8].
- have hszb : size (W8.w2bits b) = 8 by rewrite W8.size_w2bits.
  rewrite /W8.w2bits /=.
  by rewrite (nth_mkseq false) //.
have := W8.get_to_uint b (k %% 8); rewrite hm /= => ->.
by rewrite /W8.int_bit W8.to_uint_mod.
qed.

(* -------------------------------------------------------------------- *)
(* sib_h ct k = nth bit of the spec's BytesToBits (Bytes8.to_list (H_sib ct)) *)
(* for 0 <= k < 64.                                                      *)
(* -------------------------------------------------------------------- *)
lemma sib_hE (ct : BytesCT.t) (k : int) :
  0 <= k < 64 =>
  sib_h ct k =
    nth false (BytesToBits (Bytes8.to_list (H_sib ct))) k.
proof.
move=> hk; rewrite /sib_h /sib_sign_bytes /H_sib.
rewrite Bytes8.of_listK ?Keccak1600_Spec.size_SHAKE256 //.
rewrite BytesToBits_nth /=; first by smt(Keccak1600_Spec.size_SHAKE256).
do 2! congr.
have hd : 0 <= k %/ 8 < 8 by smt().
rewrite nth_stake //.
by rewrite shake256_streamP //; smt(Keccak1600_Spec.size_SHAKE256).
qed.

(* -------------------------------------------------------------------- *)
(* Jasmin-side bridge — declared, to be proved at step 8.                *)
(* For a 48-byte seed and an 8-byte sign block obtained from squeezing  *)
(* SHAKE256 on that seed, bit k of the W64 little-endian load equals    *)
(* sib_h (BytesCT.of_list (to_list seed)) k.                             *)
(* -------------------------------------------------------------------- *)
axiom signs_W64_bit_E (seed : W8.t Array48.t) (block : W8.t Array136.t) (k : int) :
  0 <= k < 64 =>
  (forall i, 0 <= i < 8 =>
     block.[i] = shake256_stream (Array48.to_list seed) i) =>
  W64.int_bit
    (W64.to_uint (get64_direct (WArray136.init8 (fun i => block.[i])) 0))
    k
  = sib_h (BytesCT.of_list (Array48.to_list seed)) k.

(* ==================================================================== *)
(* Step 7: Spec ↔ Pure (hoare)                                          *)
(*                                                                       *)
(* SampleInBall(MLDSA_XOF_SIB).sample, when it terminates, returns      *)
(* sampleInBall_fun _ct. Partial correctness only (no termination       *)
(* argument); the equiv composition will use this as a hoare.           *)
(* ==================================================================== *)

(* -------------------------------------------------------------------- *)
(* Helper: MLDSA_XOF_SIB.next at offset pos returns the SHAKE256 stream *)
(* byte at offset pos and advances pos by one.                          *)
(* -------------------------------------------------------------------- *)
hoare MLDSA_XOF_SIB_next_h _seed _pos :
    MLDSA_XOF_SIB.next
  : MLDSA_XOF_SIB.seed = _seed /\ MLDSA_XOF_SIB.pos = _pos /\ 0 <= _pos
  ==> res = shake256_stream (BytesCT.to_list _seed) _pos
   /\ MLDSA_XOF_SIB.seed = _seed
   /\ MLDSA_XOF_SIB.pos  = _pos + 1.
proof.
proc; auto => |> h0.
by rewrite shake256_streamP // /#.
qed.

(* -------------------------------------------------------------------- *)
(* Outer-loop invariant abbreviations.                                   *)
(* -------------------------------------------------------------------- *)
op outer_state (ct : BytesCT.t) (i : int) : poly * int =
  foldl
    (sib_step (sib_xof_stream ct) (sib_h ct))
    (poly_zero, 0)
    (range (256 - tau) i).

(* -------------------------------------------------------------------- *)
lemma outer_state_init (ct : BytesCT.t) :
  outer_state ct (256 - tau) = (poly_zero, 0).
proof. by rewrite /outer_state range_geq // /#. qed.

(* -------------------------------------------------------------------- *)
lemma accept_snd_ge0 ['a] (P : 'a -> bool) (s : 'a stream) :
  0 <= (accept P s).`2.
proof.
by rewrite /accept /=; case (nth_pass P s 0 < 0) => hlt /=; smt().
qed.

(* -------------------------------------------------------------------- *)
lemma outer_state_pos_ge0 (ct : BytesCT.t) (i : int) :
  0 <= (outer_state ct i).`2.
proof.
rewrite /outer_state.
have h : forall (ost : poly * int) rs, 0 <= ost.`2 =>
  0 <= (foldl (sib_step (sib_xof_stream ct) (sib_h ct)) ost rs).`2.
+ move=> ost rs; elim: rs ost => //=.
  move=> j rs IH [c pos] /= hge.
  apply IH; rewrite /sib_step /=.
  case _: (accept _ _) => b dp /= heq.
  have := accept_snd_ge0 (fun b0 => W8.to_uint b0 <= j) (sdrop pos (sib_xof_stream ct)).
  by rewrite heq /=; smt().
by apply (h (poly_zero, 0)).
qed.

(* -------------------------------------------------------------------- *)
lemma outer_state_step (ct : BytesCT.t) (i : int) :
  256 - tau <= i < 256 =>
  outer_state ct (i + 1) =
    sib_step (sib_xof_stream ct) (sib_h ct) (outer_state ct i) i.
proof.
move=> hi @/outer_state.
by rewrite (rangeSr (256 - tau) i) 1:/# foldl_rcons.
qed.

(* -------------------------------------------------------------------- *)
(* Main hoare: Spec ↔ Pure.                                              *)
(* -------------------------------------------------------------------- *)
hoare SampleInBall_fun_h _ct :
    SampleInBall(MLDSA_XOF_SIB).sample
  : arg = _ct
  ==> res.`1 = sampleInBall_fun _ct.
proof.
proc.
seq 4 : (c = poly_zero /\ s = H_sib _ct /\
         h = BytesToBits (Bytes8.to_list (H_sib _ct)) /\
         rho = _ct).
+ by auto.
seq 1 : (#pre /\ MLDSA_XOF_SIB.seed = _ct /\ MLDSA_XOF_SIB.pos = 8).
+ by inline MLDSA_XOF_SIB.init; auto.
seq 1 : (#pre /\ i = 256 - tau); first by auto.
(* Outer loop *)
while (
     rho = _ct
  /\ h = BytesToBits (Bytes8.to_list (H_sib _ct))
  /\ MLDSA_XOF_SIB.seed = _ct
  /\ 256 - tau <= i <= 256
  /\ MLDSA_XOF_SIB.pos = 8 + (outer_state _ct i).`2
  /\ c = (outer_state _ct i).`1
).
+ (* Outer body.                                                         *)
  (* Snapshot i and outer_state _ct i so they remain available after    *)
  (* MLDSA_XOF_SIB.pos is updated and after i <- i+1.                   *)
  exlim i, (outer_state _ct i) => _i _ost.
  (* First draw — establish post that captures the new pos.              *)
  seq 1 :
    (    rho = _ct
      /\ h = BytesToBits (Bytes8.to_list (H_sib _ct))
      /\ MLDSA_XOF_SIB.seed = _ct
      /\ i = _i
      /\ 256 - tau <= _i < 256
      /\ MLDSA_XOF_SIB.pos = 8 + _ost.`2 + 1
      /\ c = _ost.`1
      /\ _ost = outer_state _ct _i
      /\ j = sib_xof_stream _ct _ost.`2).
  + ecall (MLDSA_XOF_SIB_next_h MLDSA_XOF_SIB.seed MLDSA_XOF_SIB.pos).
    skip => &hr.
    move=> [#] hi_eq host_eq hrho hh hseed hbnd1 hbnd2 hpos hc hlt /=.
    have hpos0 : 0 <= MLDSA_XOF_SIB.pos{hr}.
    + by rewrite hpos; have := outer_state_pos_ge0 _ct i{hr}; smt().
    split; [smt() |].
    move=> _ result pos /= [#] hres hpos_eq.
    rewrite hres /sib_xof_stream /sdrop /=.
    do! split; smt().
  (* Process the inner while as the next 1-instruction segment.         *)
  (* Post-while invariant: j is the first byte <= _i in the substream;  *)
  (* MLDSA_XOF_SIB.pos has advanced accordingly.                         *)
  seq 1 :
    (    rho = _ct
      /\ h = BytesToBits (Bytes8.to_list (H_sib _ct))
      /\ MLDSA_XOF_SIB.seed = _ct
      /\ i = _i
      /\ 256 - tau <= _i < 256
      /\ c = _ost.`1
      /\ _ost = outer_state _ct _i
      /\ W8.to_uint j <= _i
      /\ (exists r,
              1 <= r
           /\ MLDSA_XOF_SIB.pos = 8 + _ost.`2 + r
           /\ j = sib_xof_stream _ct (_ost.`2 + r - 1)
           /\ (forall k, 0 <= k < r - 1 =>
                 _i < W8.to_uint (sib_xof_stream _ct (_ost.`2 + k))))).
  + (* Inner while, now at the tail of the segment. *)
    while (
         rho = _ct
      /\ h = BytesToBits (Bytes8.to_list (H_sib _ct))
      /\ MLDSA_XOF_SIB.seed = _ct
      /\ i = _i
      /\ 256 - tau <= _i < 256
      /\ c = _ost.`1
      /\ _ost = outer_state _ct _i
      /\ (exists r,
              1 <= r
           /\ MLDSA_XOF_SIB.pos = 8 + _ost.`2 + r
           /\ j = sib_xof_stream _ct (_ost.`2 + r - 1)
           /\ (forall k, 0 <= k < r - 1 =>
                 _i < W8.to_uint (sib_xof_stream _ct (_ost.`2 + k))))).
    + (* Inner body: leakage++; j <- next().                            *)
      ecall (MLDSA_XOF_SIB_next_h MLDSA_XOF_SIB.seed MLDSA_XOF_SIB.pos).
      auto => &hr.
      move=> [#] [#] hrho hh hseed hi_eq hbnd1 hbnd2 hc host_eq.
      move=> [r] [#] hr_pos hpos hj_eq hno hreject.
      have hpos0 : 0 <= MLDSA_XOF_SIB.pos{hr}.
      + by rewrite hpos; have := outer_state_pos_ge0 _ct _i; smt().
      split; [smt() |].
      move=> _ result pos /= [#] hres hpos_eq.
      split; 1: by smt().
      split; 1: by smt().
      split; 1: by smt().
      split; 1: by smt().
      split; 1: by smt().
      split; 1: by smt().
      split; 1: by smt().
      exists (r + 1).
      split; 1: by smt().
      split; 1: by smt().
      split.
      + by rewrite hres /sib_xof_stream /sdrop /=; congr; smt().
      move=> k hk.
      case (k = r - 1) => hk_eq.
      + subst k; rewrite (_ : _ost.`2 + (r - 1) = _ost.`2 + r - 1) 1:/#.
        by rewrite -hj_eq; smt().
      by apply hno; smt().
    (* Inner-while exit: skip, then provide both pre (invariant) and the *)
    (* post (the seq-1's target with to_uint j <= _i added).             *)
    skip => &hr h_pre.
    split; first by smt().
    move=> pos' j' h_exit h_inv.
    have hj_le : W8.to_uint j' <= _i by smt().
    smt().
  (* Post-inner-while: 4 assignments + i <- i+1 — close outer invariant. *)
  auto => &hr.
  move=> [#] hrho hh hseed hi_eq hbnd1 hbnd2 hc host_eq hj_le.
  move=> [r] [#] hr_pos hpos hj_eq hno.
  (* Build first-pass certificate from inner-loop exit data.            *)
  have hfirst :
    is_first_pass (fun b => W8.to_uint b <= _i)
                  (sdrop _ost.`2 (sib_xof_stream _ct))
                  (r - 1).
  + rewrite /is_first_pass; do! split.
    + smt().
    + rewrite /sdrop /=.
      have -> : r - 1 + _ost.`2 = _ost.`2 + r - 1 by smt().
      by rewrite -hj_eq; smt().
    move=> k hk; have := hno k _; first by smt().
    rewrite /sdrop /=.
    have -> : k + _ost.`2 = _ost.`2 + k by smt().
    smt().
  have h_accept :
    accept (fun b => W8.to_uint b <= _i)
           (sdrop _ost.`2 (sib_xof_stream _ct))
    = (sib_xof_stream _ct (_ost.`2 + r - 1), r).
  + have := accept_first _ _ _ hfirst.
    by rewrite /sdrop /=; smt().
  (* Show outer invariant at i+1.                                        *)
  do! split.
  + smt().
  + smt().
  + smt().
  + smt(MLDSAParams.tau_bound).
  + smt().
  + (* MLDSA_XOF_SIB.pos = 8 + (outer_state _ct (_i+1)).`2 *)
    rewrite hi_eq.
    rewrite (outer_state_step _ct _i); first by smt().
    rewrite -host_eq /sib_step /= h_accept /=.
    smt().
  (* c{hr}.[_i <- ...].[..] = (outer_state _ct (_i + 1)).`1            *)
  rewrite hi_eq.
  rewrite (outer_state_step _ct _i); first by smt().
  rewrite -host_eq /sib_step /= h_accept /=.
  (* The two sides differ only in the sign-bit lookup. Use sib_hE.     *)
  have hh_bit := sib_hE _ct (_i + tau - 256) _.
  + by smt(mldsa65_tau).
  rewrite -hc -hj_eq.
  have h_size : size (BytesToBits (Bytes8.to_list (H_sib _ct))) = 64.
  + by rewrite size_BytesToBits Bytes8.size_to_list.
  have -> : h{hr}.[_i + tau - 256]
          = sib_h _ct (_i + tau - 256).
  + rewrite hh hh_bit /"_.[_]".
    by rewrite (nth_change_dfl witness false); smt(mldsa65_tau).
  done.
(* After while: prove (a) entry, (b) post. *)
skip => &hr h_pre; split.
+ (* entry: invariant holds initially *)
  by smt(MLDSAParams.tau_bound outer_state_init).
(* post: i = 256 => c = sampleInBall_fun _ct *)
move=> pos c0 i0 lkg hnlt h_inv.
rewrite /sampleInBall_fun /outer_state /=.
by smt().
qed.

(* Equiv between the spec SampleInBall (with concrete MLDSA_XOF_SIB) and the
   Jasmin sample____challenge. The seed is the 48-byte commitment hash.

   Post also includes wpoly_srng 1 1 — sampleInBall emits a polynomial whose
   coefficients are in {-1, 0, 1} (with exactly tau nonzero entries), so the
   signed range is tight at [-1, 1]. *)
lemma sample_challenge_correct :
    equiv [ SampleInBall(MLDSA_XOF_SIB).sample ~ M.sample____challenge :
       arg{1} = BytesCT.of_list (to_list arg{2}.`2)
       ==>
       lifts_wpoly res{2} = res{1}.`1 /\
       wpoly_srng 1 1 res{2}
    ].
proc.

admitted. (* sample challenge *)
