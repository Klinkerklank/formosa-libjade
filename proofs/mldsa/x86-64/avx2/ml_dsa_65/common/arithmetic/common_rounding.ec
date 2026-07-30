require import AllCore List IntDiv RealExp.

from Jasmin require import JModel_x86.

from JazzEC require import Ml_dsa_65_avx2 Mldsa_65_prelude.

from Spec require import GFq Rq Parameters MLDSA_W32_Rep.

import Round ZModQ Zq.

require import XArray256 Array256.
require import CircuitBindings Bindings.

(* ================================================================== *)
(* polynomial____make_hint                                              *)
(* For each coefficient i:                                             *)
(*   hints[i] = MakeHint(low_coefficients[i], high_coefficients[i])   *)
(*            = 1 if HighBits(low+high) != HighBits(high), else 0     *)
(* Also returns the total weight (count of 1s).                        *)
(* Spec connection (via poly_MakeHintImpl from Rq.ec):                 *)
(*   liftu_wpoly res.`1 = poly_MakeHintImpl (lifts_wpoly _high)        *)
(*                                           (lifts_wpoly _low)         *)
(*   res.`2 = count (fun i => (liftu_wpoly res.`1).[i] <> Zq.zero)    *)
(*                  (iota_ 0 256)                                      *)
(* ================================================================== *)

lemma polynomial____make_hint_ll : islossless M.polynomial____make_hint.
proof.
proc.
wp; while (offset <= (256 * 32) %/ 8 /\ offset %% 32 = 0)
         ((256 * 32) %/ 8 - offset);
  last by auto => /> /#. 
by move => *; auto => /> /#. 
qed.

lemma polynomial____make_hint_correct
      (_h : W32.t Array256.t) (_low : W32.t Array256.t) (_high : W32.t Array256.t) :
    hoare [ M.polynomial____make_hint :
        hints = _h /\ low_coefficients = _low /\ high_coefficients = _high /\
        (* low: w0_minus_cs2_plus_ct0 range — tightest achievable from norm checks *)
        wpoly_srng (2*gamma2 - Beta - 2) (2*gamma2 - Beta - 2) _low /\
        (* high: HighBits (w1) output range [0, (q-1) / (2*gamma2)] *)
        wpoly_urng ((q - 1) %/ (2 * gamma2)) _high
        ==>
        wpoly_urng 2 res.`1 /\
        liftu_wpoly res.`1 = poly_MakeHintImpl (lifts_wpoly _high) (lifts_wpoly _low) /\
        res.`2 = count (fun i => (liftu_wpoly res.`1).[i] <> Zq.zero) (iota_ 0 256)
    ].
proof.
admitted. (*poly  make hint *)

lemma polynomial____make_hint_ph
      (_h : W32.t Array256.t) (_low : W32.t Array256.t) (_high : W32.t Array256.t) :
    phoare [ M.polynomial____make_hint :
        hints = _h /\ low_coefficients = _low /\ high_coefficients = _high /\
        wpoly_srng (2*gamma2 - Beta - 2) (2*gamma2 - Beta - 2) _low /\
        wpoly_urng ((q - 1) %/ (2 * gamma2)) _high
        ==>
        wpoly_urng 2 res.`1 /\
        liftu_wpoly res.`1 = poly_MakeHintImpl (lifts_wpoly _high) (lifts_wpoly _low) /\
        res.`2 = count (fun i => (liftu_wpoly res.`1).[i] <> Zq.zero) (iota_ 0 256)
    ] = 1%r
  by conseq polynomial____make_hint_ll (polynomial____make_hint_correct _h _low _high).

(* ================================================================== *)
(* polynomial____power2round                                             *)
(* Splits each coefficient into high and low parts using 2^d:          *)
(*   highbits = (a + 2^(d-1)) >> d                                    *)
(*   lowbits  = a - highbits * 2^d                                    *)
(* Spec connection: poly_Power2Round from Rq.ec                        *)
(*   (liftu_wpoly res.`1, lifts_wpoly res.`2) ~ poly_Power2Round      *)
(* ================================================================== *)

lemma polynomial____power2round_ll : islossless M.polynomial____power2round.
proof.
proc.
wp; while (0 <= offset <= (256 * 32) %/ 8 /\ offset %% 32 = 0)
         ((256 * 32) %/ 8 - offset); last by auto => /#.
by move => *; auto => /#.
qed.

lemma polynomial____power2round_correct
      (_high : W32.t Array256.t) (_low : W32.t Array256.t) (_a : W32.t Array256.t) :
    hoare [ M.polynomial____power2round :
        highbits = _high /\ lowbits = _low /\ polynomial = _a /\
        wpoly_urng q _a  (* input in [0, q-1], after conditionally_add_modulus *)
        ==>
        (* t1 (high): unsigned, [0, 2^(23-d) - 1] *)
        (forall i, 0 <= i < 256 =>
            W32.to_uint res.`1.[i] = asint (Power2Round (liftu_wpoly _a).[i]).`1 ) /\
        wpoly_urng (2^(23-d)) res.`1 /\
        (* t0 (low): signed, (-(2^(d-1)), 2^(d-1)] *)
        (forall i, 0 <= i < 256 =>
            W32.to_sint res.`2.[i] = crepr (Power2Round (liftu_wpoly _a).[i]).`2 ) /\
        wpoly_srng (2^(d-1) - 1) (2^(d-1)) res.`2
    ].
proof.
proc => /=.
proc change 2 : { temp <- W64.of_int 1; }; 1: by auto.
proc change 3 : { ones_vector <- zeroextu256 temp; }.
+ auto => &1 &2 ->; rewrite /VMOV_64 zeroextu256E zeroextu256E.
  rewrite wordP => i ib.
  rewrite pack2E pack2E pack4E initiE 1:/# /= initiE 1:/# /= initiE 1:/# /= initiE 1:/# /=.
  case (i %/ 64 = 0) => ?; 1: by rewrite ifT 1:/# initiE 1:/# /= get_of_list /#.
  case (i %/ 128 = 0) => ?; 2: by auto.
  rewrite initiE 1:/# /= get_of_list 1:/#.
  by have -> /= : (i %% 128 %/ 64) = 1 by smt().
proc change ^while.1 : { coefficients <- if (0 <= offset*8 <= 32*256-256) then BSWAS_256u32_256.sliceget polynomial (offset*8) else WArray1024.WArray1024.get256_direct (WArray1024.WArray1024.init32 (fun (i_0:int) => polynomial.[i_0])) offset; }; first (auto => /> &2; case (0 <= offset{2} * 8 <= 7936); [by move => *; rewrite -BSWAS_256u32_256_slicegetE 1:/# | by auto]).
proc change ^while.7 : { highbits <- if (0 <= offset*8 <= 32*256-256) then BSWAS_256u32_256.sliceset highbits (offset*8) high else Array256.init (WArray1024.WArray1024.get32 (WArray1024.WArray1024.set256_direct (WArray1024.WArray1024.init32 (fun (i_0:int) => highbits.[i_0])) offset high)); }; first (auto => /> &2; case (0 <= offset{2} * 8 <= 7936); [by move => *; rewrite BSWAS_256u32_256_slicesetE 1:/# | by auto]).
proc change ^while.8 : { lowbits <- if (0 <= offset*8 <= 32*256-256) then BSWAS_256u32_256.sliceset lowbits (offset*8) low else Array256.init (WArray1024.WArray1024.get32 (WArray1024.WArray1024.set256_direct (WArray1024.WArray1024.init32 (fun (i_0:int) => lowbits.[i_0])) offset low)); }; first (auto => /> &2; case (0 <= offset{2} * 8 <= 7936); [by move => *; rewrite BSWAS_256u32_256_slicesetE 1:/# | by auto]).
unroll for ^while.
wp 260.
conseq (: polynomial = _a /\ wpoly_urng q _a ==> highbits = BSWA_256u32.init (fun (i:int) => (_a.[i] + W32.of_int 4096 - W32.of_int 1) `|>>>` 13) /\ lowbits = BSWA_256u32.init (fun (i:int) => _a.[i] - ((_a.[i] + W32.of_int 4096 - W32.of_int 1) `|>>>` 13) * W32.of_int 8192)); last by circuit.
+ by move => &hr; smt().
move => &hr [# _ _ _ Hurng] hb lb [# -> ->].
move: Hurng; rewrite /wpoly_urng allP => Hurng.
have key : forall (i:int), 0 <= i < n => to_uint ((_a.[i] + of_int 4096 - one) `|>>>` d) = (to_uint _a.[i] + 4095) %/ 8192 /\ to_sint (_a.[i] - ((_a.[i] + of_int 4096 - one) `|>>>` d) * of_int 8192) = to_uint _a.[i] - (to_uint _a.[i] + 4095) %/ 8192 * 8192.
+ move => i Hi; have Hs := Hurng i Hi.
  have Hts : to_sint _a.[i] = to_uint _a.[i] by rewrite W32.to_sintE /smod /=; smt().
  have H4096 : to_sint (W32.of_int 4096) = 4096 by rewrite W32.to_sintE W32.of_uintK /smod /=.
  have Hone : to_sint W32.one = 1 by rewrite W32.to_sintE /smod /=.
  have Hadd : to_sint (_a.[i] + W32.of_int 4096) = to_uint _a.[i] + 4096.
  - rewrite W32.to_sintD_small; first (rewrite H4096 Hts; smt()).
    by rewrite H4096 Hts.
  have Hpre : to_sint (_a.[i] + W32.of_int 4096 - W32.one) = to_uint _a.[i] + 4095.
  - rewrite W32.to_sintB_small; first (rewrite Hadd Hone; smt()).
    by rewrite Hadd Hone.
  have Hsar : to_sint ((_a.[i] + W32.of_int 4096 - W32.one) `|>>>` d) = (to_uint _a.[i] + 4095) %/ 8192 by rewrite JWordExtra.WE32.to_sint_sar 1:/# Hpre /=.
  have Hhr : 0 <= (to_uint _a.[i] + 4095) %/ 8192 < 1024.
  - have Hde : to_uint _a.[i] + 4095 = (to_uint _a.[i] + 4095) %/ 8192 * 8192 + (to_uint _a.[i] + 4095) %% 8192 by smt(divz_eq).
    have Hmc : 0 <= (to_uint _a.[i] + 4095) %% 8192 < 8192 by smt(modz_cmp).
    smt().
  have Hcmp := W32.to_uint_cmp ((_a.[i] + W32.of_int 4096 - W32.one) `|>>>` d).
  have Huw : to_uint ((_a.[i] + W32.of_int 4096 - W32.one) `|>>>` d) = (to_uint _a.[i] + 4095) %/ 8192 by move: Hsar Hcmp; rewrite W32.to_sintE /smod /=; smt().
  split; first exact Huw.
  have Hprod : ((_a.[i] + W32.of_int 4096 - W32.one) `|>>>` d) * W32.of_int 8192 = W32.of_int ((to_uint _a.[i] + 4095) %/ 8192 * 8192) by rewrite W32.to_uint_eq W32.to_uintM !W32.of_uintK Huw /=; smt().
  have HK : to_sint (W32.of_int ((to_uint _a.[i] + 4095) %/ 8192 * 8192)) = (to_uint _a.[i] + 4095) %/ 8192 * 8192 by rewrite W32.to_sintK_small /=; smt().
  rewrite Hprod W32.to_sintB_small; first (rewrite HK Hts; smt()).
  by rewrite HK Hts.
have Hpr : forall (i:int), 0 <= i < n => asint (Power2Round (liftu_wpoly _a).[i]).`1 = (to_uint _a.[i] + 4095) %/ 8192 /\ crepr (Power2Round (liftu_wpoly _a).[i]).`2 = to_uint _a.[i] - (to_uint _a.[i] + 4095) %/ 8192 * 8192.
+ move => i Hi; have Hs := Hurng i Hi.
  rewrite /liftu_wpoly mapiE 1:/# /= /Power2Round /=.
  have Hrp : asint (incoeff (to_uint _a.[i])) = to_uint _a.[i] by rewrite incoeffK; smt().
  rewrite !Hrp.
  have Hsm : smodem (to_uint _a.[i]) 8192 = to_uint _a.[i] - (to_uint _a.[i] + 4095) %/ 8192 * 8192.
  - have E1 : to_uint _a.[i] = to_uint _a.[i] %/ 8192 * 8192 + to_uint _a.[i] %% 8192 by smt(divz_eq).
    have E2 : to_uint _a.[i] + 4095 = (to_uint _a.[i] + 4095) %/ 8192 * 8192 + (to_uint _a.[i] + 4095) %% 8192 by smt(divz_eq).
    have E3 : 0 <= to_uint _a.[i] %% 8192 < 8192 by smt(modz_cmp).
    have E4 : 0 <= (to_uint _a.[i] + 4095) %% 8192 < 8192 by smt(modz_cmp).
    rewrite /smodem /=; smt().
  have Hhi : (to_uint _a.[i] - smodem (to_uint _a.[i]) 8192) %/ 8192 = (to_uint _a.[i] + 4095) %/ 8192 by rewrite Hsm; smt(mulzK).
  split; first by rewrite Hhi incoeffK; smt(divz_eq modz_cmp).
  rewrite Hsm incoeffK_centered; smt(divz_eq modz_cmp).
split; first by move => i Hi; have [Hk1 _] := key i Hi; have [Hp1 _] := Hpr i Hi; rewrite /BSWA_256u32.init initiE 1:/# /= Hk1 Hp1.
split; first by rewrite /wpoly_urng allP => i Hi /=; rewrite /BSWA_256u32.init initiE 1:/# /=; have [Hk1 _] := key i Hi; have Hs := Hurng i Hi; rewrite Hk1; smt(divz_eq modz_cmp).
split; first by move => i Hi; have [_ Hk2] := key i Hi; have [_ Hp2] := Hpr i Hi; rewrite /BSWA_256u32.init initiE 1:/# /= Hk2 Hp2.
rewrite /wpoly_srng allP => i Hi /=; rewrite /BSWA_256u32.init initiE 1:/# /=; have [_ Hk2] := key i Hi; have Hs := Hurng i Hi; rewrite Hk2; smt(divz_eq modz_cmp).
qed.

lemma polynomial____power2round_ph
      (_high : W32.t Array256.t) (_low : W32.t Array256.t) (_a : W32.t Array256.t) :
    phoare [ M.polynomial____power2round :
        highbits = _high /\ lowbits = _low /\ polynomial = _a /\
        wpoly_urng q _a
        ==>
        (forall i, 0 <= i < 256 =>
            W32.to_uint res.`1.[i] = asint (Power2Round (liftu_wpoly _a).[i]).`1 ) /\
        wpoly_urng (2^(23-d)) res.`1 /\
        (forall i, 0 <= i < 256 =>
            W32.to_sint res.`2.[i] = crepr (Power2Round (liftu_wpoly _a).[i]).`2 ) /\
        wpoly_srng (2^(d-1) - 1) (2^(d-1)) res.`2
    ] = 1%r
  by conseq polynomial____power2round_ll
            (polynomial____power2round_correct _high _low _a).
