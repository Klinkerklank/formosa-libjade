require import AllCore List IntDiv RealExp.

from Jasmin require import JModel_x86.

from JazzEC require import Ml_dsa_65_avx2 Mldsa_65_prelude.

from Spec require import GFq Rq Parameters MLDSA_W32_Rep.

import Round ZModQ Zq.

require import XArray256 Array256.
require import CircuitBindings Bindings.

(* ================================================================== *)
(* polynomial__decompose                                                *)
(* Decomposes each coefficient into (LowBits, HighBits) per FIPS 204. *)
(* Uses gamma2 = (q-1)/32 for ML-DSA-65.                              *)
(* Input: polynomial in [0, q-1] (after conditionally_add_modulus).    *)
(* Output: lows in [-gamma2, gamma2] (NOT [-(gamma2-1), gamma2]: the   *)
(*         FIPS r - r0 = q-1 branch returns r0 - 1; see lb_rng),        *)
(*         highs in [0, (q-1)/(2*gamma2)]                             *)
(* Spec connection (via Decompose from GFq.ec):                        *)
(*   lows.[i]  = LowBits((liftu_wpoly _a).[i])                       *)
(*   highs.[i] = HighBits((liftu_wpoly _a).[i])                      *)
(* ================================================================== *)

lemma polynomial__decompose_ll : islossless M.polynomial__decompose.
proof.
proc.
wp; while (0 <= offset <= (256 * 32) %/ 8 /\ offset %% 32 = 0)
         ((256 * 32) %/ 8 - offset); last by auto => /#.
by move => *; auto => /#.
qed.

(* ------------------------------------------------------------------ *)
(* Per-lane specification, in plain 32-bit scalar arithmetic.          *)
(*                                                                     *)
(* These are deliberately NOT structural copies of the vector code:    *)
(* the program uses VPMULHU_16u16 / VPMULHRS_16u16, which are 16-bit    *)
(* lane operations, whereas these use 32-bit multiplies.  `circuit`     *)
(* still accepts the equivalence because the postcondition below is     *)
(* proved under a per-lane range precondition confining every input to  *)
(* [0, q), where the two agree: after `(c + 127) >> 7` the value is at  *)
(* most 65472 < 2^16, so the 16-bit lane ops see a zero high half.      *)
(*                                                                     *)
(* The range must be stated in the blastable per-lane form             *)
(*   List.all (fun i => _a.[i] \ult W32.of_int q) (iotared 0 256)      *)
(* (\ult is bound as "ult"); `wpoly_urng` is an allP over the array     *)
(* and does not attach to a collapsed lane.                            *)
(* ------------------------------------------------------------------ *)

op hi_lane (c : W32.t) : W32.t =
  let t  = (c + W32.of_int 127) `>>` W8.of_int 7 in
  let u  = (t * W32.of_int 1025) `>>` W8.of_int 16 in
  let p  = (u * W32.of_int 512) `>>` W8.of_int 14 in
  let s  = p + W32.one in
  (s `>>` W8.of_int 1) `&` W32.of_int 15.

(* lo_lane must CALL hi_lane rather than inline it: inlining duplicates the
   reciprocal chain per lane and breaks lane aggregation (collapse_lanes then
   finds no uniform period and gives up, 8192 posts instead of 256). *)
op lo_lane (c : W32.t) : W32.t =
  let l = c - hi_lane c * W32.of_int 523776 in
  l - (if W32.of_int 4190208 \slt l then W32.of_int 8380417 else W32.zero).

(* ------------------------------------------------------------------ *)
(* Arithmetic bridge: the word-level lane functions compute the FIPS    *)
(* 204 Decompose.  The impl approximates 1/(2*gamma2) = 1/523776 by a   *)
(* two-step multiply-high chain; concretizing gamma2 from param_sets    *)
(* turns each goal into numeric %/ and %% arithmetic that smt closes.   *)
(* ------------------------------------------------------------------ *)

(* The mulhrs rounding step collapses: (x*512 %/ 2^14 + 1) %/ 2 = (x+32) %/ 64 *)
lemma hb_u2_collapse (u1 : int) :
    0 <= u1 < 1024 =>
    ((u1 * 512) %/ 16384 + 1) %/ 2 = (u1 + 32) %/ 64.
proof.
move => H; have E : u1 * 512 %/ 16384 = u1 %/ 32 by smt(divzMr divz_eq).
by rewrite E; smt(divz_eq modz_cmp divzMr).
qed.

lemma hb_spec (r : int) :
    0 <= r < q =>
    (((r + 127) %/ 128 * 1025) %/ 65536 + 32) %/ 64 %% 16 = HighBits (incoeff r).
proof.
move => Hr; rewrite /HighBits /Decompose /=.
have -> : asint (incoeff r) = r by rewrite incoeffK; smt().
have Hg : gamma2 = 261888 by smt(param_sets).
(* must be its own sentence: chaining after a by-closed `have` swallows it *)
rewrite Hg /= /smodem /=.
by smt(divz_eq modz_cmp).
qed.

(* Low side: r - h*(2*gamma2), corrected by -q when it exceeds q %/ 2.
   The correction fires exactly on the r - rzero = q-1 interval, where the
   masked h wrapped to 0 and so the uncorrected low is still near r.       *)
lemma lb_spec (r : int) :
    0 <= r < q =>
    (let h = (((r + 127) %/ 128 * 1025) %/ 65536 + 32) %/ 64 %% 16 in
     let l = r - h * (2 * gamma2) in
     if q %/ 2 < l then l - q else l) = LowBits (incoeff r).
proof.
move => Hr; rewrite /LowBits /Decompose /=.
have -> : asint (incoeff r) = r by rewrite incoeffK; smt().
have Hg : gamma2 = 261888 by smt(param_sets).
rewrite Hg /smodem /=.
by smt(divz_eq modz_cmp).
qed.

(* Range bounds on the two outputs, needed for wpoly_srng / wpoly_urng. *)
lemma hb_rng (r : int) :
    0 <= r < q =>
    0 <= (((r + 127) %/ 128 * 1025) %/ 65536 + 32) %/ 64 %% 16 < 16.
proof.
by move => Hr; smt(modz_cmp).
qed.

(* The low output lands in [-gamma2, gamma2].  Note the LEFT end is -gamma2,
   not -(gamma2-1): on the r - rzero = q-1 interval the masked h wraps to 0
   and the -q correction pushes the low value one step below the textbook
   (-gamma2, gamma2] band.  See lb_spec's comment. *)
lemma lb_rng (r : int) :
    0 <= r < q => -gamma2 <= LowBits (incoeff r) <= gamma2.
proof.
move => Hr; rewrite /LowBits /Decompose /=.
have -> : asint (incoeff r) = r by rewrite incoeffK; smt().
have Hg : gamma2 = 261888 by smt(param_sets).
rewrite Hg /smodem /=.
by smt(divz_eq modz_cmp).
qed.

(* `wpoly_urng` is an `allP` over a quantified bound; `attach_compatible_pres`
   cannot attach it to the per-lane circuit obligations.  The `List.all` form
   over a concrete literal bound is the shape circuit blasts (same trick as
   error_polynomial.ec / check_inf_norm_circuit). *)
lemma urng_at (a : W32.t Array256.t) (i : int) :
    wpoly_urng q a => 0 <= i < 256 => 0 <= W32.to_uint a.[i] < q.
proof.
rewrite /wpoly_urng allP /= => H Hi; by apply (H i _); smt().
qed.

lemma urng_to_lanes (a : W32.t Array256.t) :
    wpoly_urng q a =>
    List.all (fun i => a.[i] \ult W32.of_int 8380417) (iotared 0 256).
proof.
move => Hrng; rewrite iotaredE allP => x; rewrite mem_iota /= => Hx.
have Hb := urng_at a x Hrng _; first smt().
by rewrite W32.ultE /q W32.of_uintK /=; smt().
qed.

(* ------------------------------------------------------------------ *)
(* Word level: the two lane functions, read as integer operations.     *)
(* These are pure `to_uint`/`to_sint` bookkeeping over the reciprocal  *)
(* chain; every step stays inside W32 because the input is < q.        *)
(* ------------------------------------------------------------------ *)

lemma hi_lane_val (c : W32.t) :
    0 <= W32.to_uint c < q =>
    W32.to_uint (hi_lane c) =
      ((W32.to_uint c + 127) %/ 128 * 1025 %/ 65536 + 32) %/ 64 %% 16.
proof.
move => Hc.
have Ht : to_uint (c + W32.of_int 127 `>>` W8.of_int 7) = (to_uint c + 127) %/ 128
  by rewrite W32.shr_div_le 1:// W32.to_uintD_small /=; smt(W32.to_uint_cmp).
have Hu : to_uint ((c + W32.of_int 127 `>>` W8.of_int 7) * W32.of_int 1025 `>>` W8.of_int 16)
        = (to_uint c + 127) %/ 128 * 1025 %/ 65536
  by rewrite W32.shr_div_le 1:// W32.to_uintM_small /= 1:/# Ht.
have Hp : to_uint (((c + W32.of_int 127 `>>` W8.of_int 7) * W32.of_int 1025 `>>` W8.of_int 16)
                     * W32.of_int 512 `>>` W8.of_int 14)
        = (to_uint c + 127) %/ 128 * 1025 %/ 65536 * 512 %/ 16384
  by rewrite W32.shr_div_le 1:// W32.to_uintM_small /= 1:/# Hu.
have Hs : to_uint ((((c + W32.of_int 127 `>>` W8.of_int 7) * W32.of_int 1025 `>>` W8.of_int 16)
                      * W32.of_int 512 `>>` W8.of_int 14) + W32.one `>>` W8.one)
        = ((to_uint c + 127) %/ 128 * 1025 %/ 65536 * 512 %/ 16384 + 1) %/ 2
  by rewrite W32.shr_div_le 1:// W32.to_uintD_small /= 1:/# Hp.
rewrite /hi_lane /=.
have -> : W32.of_int 15 = W32.of_int (2^4 - 1) by done.
rewrite W32.to_uint_and_mod 1:// Hs.
have -> : XWord4.W4.modulus = 16 by done.
by rewrite hb_u2_collapse 1:/#.
qed.

lemma hi_lane_rng (c : W32.t) : 0 <= W32.to_uint (hi_lane c) < 16.
proof.
rewrite /hi_lane /=.
have -> : W32.of_int 15 = W32.of_int (2^4 - 1) by done.
rewrite W32.to_uint_and_mod 1://.
have -> : XWord4.W4.modulus = 16 by done.
by smt(modz_cmp).
qed.

(* The subtraction c - hi_lane c * alpha may go negative, so it must be read
   through `to_sint`; the -q correction fires exactly on the FIPS q %/ 2
   threshold, which is what makes lb_spec applicable. *)
lemma lo_lane_val (c : W32.t) :
    0 <= W32.to_uint c < q =>
    W32.to_sint (lo_lane c) = LowBits (incoeff (W32.to_uint c)).
proof.
move => Hc.
have Hhb := hi_lane_rng c.
have Hhval := hi_lane_val c Hc.
have Hg : gamma2 = 261888 by smt(param_sets).
have Hlb := lb_spec (W32.to_uint c) Hc.
have Hmul : to_uint (hi_lane c * W32.of_int 523776) = to_uint (hi_lane c) * 523776
  by rewrite W32.to_uintM_small /=; smt().
rewrite /lo_lane /=.
pose L := c - hi_lane c * W32.of_int 523776.
have HLu := W32.to_uintBb c (hi_lane c * W32.of_int 523776) false.
move: HLu; rewrite /b2i /= Hmul => HLu.
have Hlrng : -7856640 <= to_uint c - to_uint (hi_lane c) * 523776 <= 8380416 by smt().
have HLs : W32.to_sint L = to_uint c - to_uint (hi_lane c) * 523776.
+ rewrite /to_sint /L HLu /smod /=; by smt().
move: Hlb; rewrite /= -Hhval Hg /= => Hlb.
rewrite W32.sltE HLs /to_sint W32.of_uintK /smod /=.
case (4190208 < to_uint c - to_uint (hi_lane c) * 523776) => Hcnd /=.
+ have HQ := W32.to_uintBb L (W32.of_int q) false.
  move: HQ; rewrite /b2i /q /= => HQ.
  have HLuv : to_uint L = to_uint c - to_uint (hi_lane c) * 523776
    by move: HLu; rewrite -/L; smt().
  by rewrite HQ HLuv -Hlb Hcnd /q /=; smt().
rewrite W32.WRingA.subr0.
have -> : (if 2147483648 <= to_uint L then to_uint L - 4294967296 else to_uint L)
        = W32.to_sint L by rewrite /to_sint /smod /=.
by rewrite HLs -Hlb Hcnd.
qed.

lemma polynomial__decompose_correct
      (_low : W32.t Array256.t) (_high : W32.t Array256.t) (_a : W32.t Array256.t) :
    hoare [ M.polynomial__decompose :
        lows = _low /\ highs = _high /\ polynomial = _a /\
        wpoly_urng q _a  (* input in [0, q-1] *)
        ==>
        (* LowBits: signed, [-gamma2, gamma2].
           NB the lower bound is -gamma2, NOT -(gamma2-1) as originally stated:
           the FIPS special case r - r0 = q-1 (reachable, e.g. r = 8118529)
           gives LowBits = r0 - 1 = -261888 = -gamma2. Verified exhaustively
           over all r < q: the program's low output range is exactly
           [-261888, 261888]. *)
        (forall i, 0 <= i < 256 =>
            W32.to_sint res.`1.[i] = LowBits ((liftu_wpoly _a).[i])) /\
        wpoly_srng gamma2 gamma2 res.`1 /\
        (* HighBits: unsigned, [0, (q-1)/(2*gamma2)] *)
        (forall i, 0 <= i < 256 =>
            W32.to_uint res.`2.[i] = HighBits ((liftu_wpoly _a).[i])) /\
        wpoly_urng ((q - 1) %/ (2 * gamma2)) res.`2
    ].
proof.
proc => /=.
(* Rewrite the WArray slice get/set into the BSWAS slice forms circuit knows. *)
proc change ^while.1 : { coefficients <- if (0 <= offset*8 <= 32*256-256) then BSWAS_256u32_256.sliceget polynomial (offset*8) else WArray1024.WArray1024.get256_direct (WArray1024.WArray1024.init32 (fun (i_0:int) => polynomial.[i_0])) offset; }; first (auto => /> &2; case (0 <= offset{2} * 8 <= 7936); [by move => *; rewrite -BSWAS_256u32_256_slicegetE 1:/# | by auto]).
proc change ^while.12 : { lows <- if (0 <= offset*8 <= 32*256-256) then BSWAS_256u32_256.sliceset lows (offset*8) lower else Array256.init (WArray1024.WArray1024.get32 (WArray1024.WArray1024.set256_direct (WArray1024.WArray1024.init32 (fun (i_0:int) => lows.[i_0])) offset lower)); }; first (auto => /> &2; case (0 <= offset{2} * 8 <= 7936); [by move => *; rewrite BSWAS_256u32_256_slicesetE 1:/# | by auto]).
proc change ^while.13 : { highs <- if (0 <= offset*8 <= 32*256-256) then BSWAS_256u32_256.sliceset highs (offset*8) upper else Array256.init (WArray1024.WArray1024.get32 (WArray1024.WArray1024.set256_direct (WArray1024.WArray1024.init32 (fun (i_0:int) => highs.[i_0])) offset upper)); }; first (auto => /> &2; case (0 <= offset{2} * 8 <= 7936); [by move => *; rewrite BSWAS_256u32_256_slicesetE 1:/# | by auto]).
unroll for ^while.
(* `wp -i` consumes i statements from the SUFFIX. Absorb exactly the trailing
   integer assignment `offset <- 1024` (circuit cannot convert an int
   assignment) and KEEP the 423 vector instructions as a program.
   A positive `wp n` instead leaves n statements and dissolves the rest into
   the postcondition as a let-chain; circuit then has no program to analyse,
   every program variable of the memory becomes a free circuit input, and
   `lows`/`highs` show up as spurious inputs. *)
wp -1.
(* `circuit` flattens the WHOLE postcondition into one list of single-bit
   obligations and then looks for a single recurrence period across the
   concatenation.  A post naming two different output arrays has no global
   period, so nothing merges and 16384 bit-obligations go straight to SMT.
   `hoare split` gives one conjunct at a time; each then compresses
   8192 -> 256 (one obligation per 32-bit lane). *)
(* `hoare split` peels the FIRST conjunct off into a fresh goal and leaves the
   remainder focused, so three splits give, in focus order:
     1. wpoly_urng ... highs      (highs range)
     2. to_uint highs.[i] = ...   (highs value)
     3. wpoly_srng ... lows       (lows range)
     4. to_sint lows.[i] = ...    (lows value)                            *)
hoare split.
hoare split.
hoare split.

(* ---- 1. highs: unsigned range ---- *)
+ conseq (: polynomial = _a /\
            List.all (fun i => _a.[i] \ult W32.of_int 8380417) (iotared 0 256) ==>
            highs = BSWA_256u32.init (fun (i:int) => hi_lane _a.[i])).
  + by move => &hr [# _ _ -> Hrng]; split; [ done | exact urng_to_lanes ].
  + move => &hr [# _ _ _ Hrng] highs0 ->.
    have Hg : gamma2 = 261888 by smt(param_sets).
    rewrite Hg /= /wpoly_urng allP => i Hi.
    by rewrite /BSWA_256u32.init initiE 1:/# /=; smt(hi_lane_rng).
  by rewrite /hi_lane /=; circuit.

(* ---- 2. highs: value ---- *)
+ conseq (: polynomial = _a /\
            List.all (fun i => _a.[i] \ult W32.of_int 8380417) (iotared 0 256) ==>
            highs = BSWA_256u32.init (fun (i:int) => hi_lane _a.[i])).
  + by move => &hr [# _ _ -> Hrng]; split; [ done | exact urng_to_lanes ].
  + move => &hr [# _ _ _ Hrng] highs0 -> i Hi.
    rewrite /BSWA_256u32.init initiE 1:/# /=.
    have Hai : 0 <= W32.to_uint _a.[i] < q by exact (urng_at _a i).
    by rewrite (hi_lane_val _ Hai) /liftu_wpoly mapiE 1:/# /= hb_spec.
  by rewrite /hi_lane /=; circuit.

(* ---- 3. lows: signed range ---- *)
+ conseq (: polynomial = _a /\
            List.all (fun i => _a.[i] \ult W32.of_int 8380417) (iotared 0 256) ==>
            lows = BSWA_256u32.init (fun (i:int) => lo_lane _a.[i])).
  + by move => &hr [# _ _ -> Hrng]; split; [ done | exact urng_to_lanes ].
  + move => &hr [# _ _ _ Hrng] lows0 ->.
    rewrite /wpoly_srng allP => x; rewrite /BSWA_256u32.init /= => Hx.
    rewrite initiE 1:/# /=.
    have Hai : 0 <= W32.to_uint _a.[x] < q by exact (urng_at _a x).
    by rewrite (lo_lane_val _ Hai); exact (lb_rng _ Hai).
  by rewrite /lo_lane /hi_lane /=; circuit.

(* ---- 4. lows: value ---- *)
conseq (: polynomial = _a /\
          List.all (fun i => _a.[i] \ult W32.of_int 8380417) (iotared 0 256) ==>
          lows = BSWA_256u32.init (fun (i:int) => lo_lane _a.[i])).
+ by move => &hr [# _ _ -> Hrng]; split; [ done | exact urng_to_lanes ].
+ move => &hr [# _ _ _ Hrng] lows0 -> i Hi.
  rewrite /BSWA_256u32.init initiE 1:/# /=.
  have Hai : 0 <= W32.to_uint _a.[i] < q by exact (urng_at _a i).
  by rewrite (lo_lane_val _ Hai) /liftu_wpoly mapiE 1:/#.
by rewrite /lo_lane /hi_lane /=; circuit.
qed.

lemma polynomial__decompose_ph
      (_low : W32.t Array256.t) (_high : W32.t Array256.t) (_a : W32.t Array256.t) :
    phoare [ M.polynomial__decompose :
        lows = _low /\ highs = _high /\ polynomial = _a /\
        wpoly_urng q _a
        ==>
        (forall i, 0 <= i < 256 =>
            W32.to_sint res.`1.[i] = LowBits ((liftu_wpoly _a).[i])) /\
        wpoly_srng gamma2 gamma2 res.`1 /\
        (forall i, 0 <= i < 256 =>
            W32.to_uint res.`2.[i] = HighBits ((liftu_wpoly _a).[i])) /\
        wpoly_urng ((q - 1) %/ (2 * gamma2)) res.`2
    ] = 1%r
  by conseq polynomial__decompose_ll (polynomial__decompose_correct _low _high _a).

(* ================================================================== *)
(* polynomial__use_hints                                                *)
(* Applies hints to adjust HighBits of commitment coefficients.        *)
(* Internally calls polynomial__decompose, then uses VPSIGN-based     *)
(* conditional adjustment of high bits based on sign of low bits.      *)
(* Spec connection (via poly_UseHint from Rq.ec):                      *)
(*   liftu_wpoly res = poly_UseHint (liftu_wpoly _hints)               *)
(*                                   (liftu_wpoly _commitment)         *)
(* ================================================================== *)

lemma polynomial__use_hints_ll : islossless M.polynomial__use_hints.
proof.
proc.
while (0 <= offset <= (256 * 32) %/ 8 /\ offset %% 32 = 0)
       ((256 * 32) %/ 8 - offset); last first.
+ wp; call polynomial__decompose_ll.
  by auto => /#.
by move => *; auto => /#.
qed.

(* Tight output bound: the AVX2 impl ends use_hints with `& 15` (4-bit mask),     *)
(* so output is always in [0..15] = wpoly_urng ((q-1)/(2*gamma2)) = wpoly_urng 16.*)
(* See submodules/dilithium/dilithium/ref/rounding.c:91-95 for the reference.     *)
lemma polynomial__use_hints_correct
      (_commitment : W32.t Array256.t) (_hints : W32.t Array256.t) :
    hoare [ M.polynomial__use_hints :
        commitment = _commitment /\ hint_polynomial = _hints /\
        wpoly_urng q _commitment /\   (* standard range [0, q-1] *)
        wpoly_urng 2 _hints           (* hints are 0 or 1 *)
        ==>
        liftu_wpoly res = poly_UseHint (liftu_wpoly _hints) (liftu_wpoly _commitment) /\
        wpoly_urng ((q - 1) %/ (2 * gamma2)) res
    ].
proof.
admitted. (* poly use hints *)

lemma polynomial__use_hints_ph
      (_commitment : W32.t Array256.t) (_hints : W32.t Array256.t) :
    phoare [ M.polynomial__use_hints :
        commitment = _commitment /\ hint_polynomial = _hints /\
        wpoly_urng q _commitment /\
        wpoly_urng 2 _hints
        ==>
        liftu_wpoly res = poly_UseHint (liftu_wpoly _hints) (liftu_wpoly _commitment) /\
        wpoly_urng ((q - 1) %/ (2 * gamma2)) res
    ] = 1%r
  by conseq polynomial__use_hints_ll (polynomial__use_hints_correct _commitment _hints).
