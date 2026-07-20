(**
  AVX2 reduction machinery shared by the forward and inverse NTT
  correctness proofs:

    - simplification lemmas giving the lane-wise semantics of the AVX2
      instructions used by the implementation (registered as `hint
      simplify`, so that `/=` symbolically executes vector code);
    - the packed-lane helpers (pack8/unpack32) and the aligned
      get256/set256 bridge between the coefficient array and the
      vector view;
    - the correctness of the vectorized Montgomery multiply-and-reduce
      (`mmrP`).
*)

require import AllCore CoreUtils List Ring IntDiv BitEncoding.
require import StdRing StdOrder.

import BitChunking.

(* -------------------------------------------------------------------- *)
from Jasmin require import JWord JArray.

require import JArrayExtra.
require import CircuitBindings.

(* -------------------------------------------------------------------- *)
from Jasmin require import JModel_x86.
from JazzEC require import Ml_dsa_65_avx2.

(* -------------------------------------------------------------------- *)
require import WArray1024.
require import Array4 Array8 Array16 Array256.
require import XArray256.

(* -------------------------------------------------------------------- *)
type wpoly = W32.t Array256.t.

(* -------------------------------------------------------------------- *)
require import Nttzetas Nttspec Nttlogspec.
require import Listred.

(* ==================================================================== *)
lemma truncateu32_64E (w : W64.t) : truncateu32 w = w \bits32 0.
proof.
apply: W32.ext_eq=> i rgi; rewrite bits32iE //=.
rewrite /truncateu32 of_intwE rgi /= /W32.int_bit.
rewrite modz_pow2_div ~-1://# modz_dvd.
- by rewrite -{1}[2]expr1 dvdz_exp2l /#.
- by rewrite -b2i_get /#.
qed.

hint simplify truncateu32_64E.

(* -------------------------------------------------------------------- *)
lemma truncateu32_256E (w : W256.t) : truncateu32 w = w \bits32 0.
proof.
apply: W32.ext_eq=> i rgi; rewrite bits32iE //=.
rewrite /truncateu32 of_intwE rgi /= /W32.int_bit.
rewrite modz_pow2_div ~-1://# modz_dvd.
- by rewrite -{1}[2]expr1 dvdz_exp2l /#.
- by rewrite -b2i_get /#.
qed.

hint simplify truncateu32_256E.

(* -------------------------------------------------------------------- *)
lemma truncateu128_256E (w : W256.t) : truncateu128 w = w \bits128 0.
proof.
apply: W128.ext_eq=> i rgi; rewrite bits128iE //=.
rewrite /truncateu32 of_intwE rgi /= /W128.int_bit.
rewrite modz_pow2_div ~-1://# modz_dvd.
- by rewrite -{1}[2]expr1 dvdz_exp2l /#.
- by rewrite -b2i_get /#.
qed.

hint simplify truncateu128_256E.

(* ==================================================================== *)
lemma VMOV_32 (w : W32.t) : VMOV_32 w = pack4 [w; zero; zero; zero].
proof. done. qed.

hint simplify VMOV_32.

(* -------------------------------------------------------------------- *)
lemma zeroextu256E (w : W128.t) : zeroextu256 w = pack2 [w; zero].
proof.
rewrite zeroextu256E &(wordP) => i rgi /=.
by rewrite !pack2bE //= of_listE !initiE.
qed.

hint simplify zeroextu256E.

(* -------------------------------------------------------------------- *)
lemma VPBROADCAST_8u32E (w : W32.t) :
  VPBROADCAST_8u32 w = pack8 [w; w; w; w; w; w; w; w].
proof. by rewrite /VPBROADCAST_8u32 -iotaredE. qed.

hint simplify VPBROADCAST_8u32E.

(* -------------------------------------------------------------------- *)
lemma VPADD_8u32E (u w : W256.t) :
    VPADD_8u32 u w
  = W8u32.pack8 [
      (u \bits32 0) + (w \bits32 0); (u \bits32 1) + (w \bits32 1);
      (u \bits32 2) + (w \bits32 2); (u \bits32 3) + (w \bits32 3);
      (u \bits32 4) + (w \bits32 4); (u \bits32 5) + (w \bits32 5);
      (u \bits32 6) + (w \bits32 6); (u \bits32 7) + (w \bits32 7)
    ].
proof. by cbv delta. qed.

hint simplify VPADD_8u32E.

(* -------------------------------------------------------------------- *)
lemma VPSUB_4u64E (u w : W256.t) :
    VPSUB_4u64 u w
  = W4u64.pack4 [
      (u \bits64 0) - (w \bits64 0); (u \bits64 1) - (w \bits64 1);
      (u \bits64 2) - (w \bits64 2); (u \bits64 3) - (w \bits64 3)
    ].
proof. by cbv delta. qed.

hint simplify VPSUB_4u64E.

(* -------------------------------------------------------------------- *)
lemma VPSUB_8u32E (u w : W256.t) :
    VPSUB_8u32 u w
  = W8u32.pack8 [
      (u \bits32 0) - (w \bits32 0); (u \bits32 1) - (w \bits32 1);
      (u \bits32 2) - (w \bits32 2); (u \bits32 3) - (w \bits32 3);
      (u \bits32 4) - (w \bits32 4); (u \bits32 5) - (w \bits32 5);
      (u \bits32 6) - (w \bits32 6); (u \bits32 7) - (w \bits32 7)
    ].
proof. by cbv delta. qed.

hint simplify VPSUB_8u32E.

(* -------------------------------------------------------------------- *)
lemma VPMUL_256 (u v : W256.t) :
    VPMUL_256 u v
  = W4u64.pack4 [
      (u \bits32 0) \sx (v \bits32 0); (u \bits32 2) \sx (v \bits32 2);
      (u \bits32 4) \sx (v \bits32 4); (u \bits32 6) \sx (v \bits32 6)
    ].
proof. by cbv delta. qed.

hint simplify VPMUL_256.

(* -------------------------------------------------------------------- *)
lemma VMOVSHDUP_256E (w : W256.t) :
    VMOVSHDUP_256 w
  = W8u32.pack8 [
      w \bits32 1; w \bits32 1; w \bits32 3; w \bits32 3;
      w \bits32 5; w \bits32 5; w \bits32 7; w \bits32 7
    ].
proof. by cbv delta. qed.

hint simplify VMOVSHDUP_256E.

(* -------------------------------------------------------------------- *)
lemma VPSHUFD_256_216E (w : W256.t) :
    VPSHUFD_256 w (W8.of_int 216)
  = W8u32.pack8 [
      w \bits32 0; w \bits32 2; w \bits32 1; w \bits32 3;
      w \bits32 4; w \bits32 6; w \bits32 5; w \bits32 7
    ].
proof. by cbv delta. qed.

hint simplify VPSHUFD_256_216E.

(* -------------------------------------------------------------------- *)
lemma VPSHUFD_128_228E (w : W128.t) : VPSHUFD_128 w (W8.of_int 228) = w.
proof.
rewrite /VPSHUFD_128 -{2}(W4u32.unpack32K w) iotaredE -/(range 0 4).
rewrite -/(mkseq _ 4) -(eq_in_mkseq (fun i => w \bits32 i)) /=.
- move=> i rgi @/VPSHUFD_128_B /=; congr.
  by move/mem_range: rgi; rewrite /range -iotaredE /= => [#|] ->.
rewrite -{2}[w](unpack32K); congr; apply/W4u32.Pack.ext_eq.
by move=> i rgi; rewrite !(get_unpack32, get_of_list, nth_mkseq).
qed.

hint simplify VPSHUFD_128_228E.

(* -------------------------------------------------------------------- *)
lemma VPSHUFD_256_228E (w : W256.t) : VPSHUFD_256 w (W8.of_int 228) = w.
proof.
rewrite /VPSHUFD_256 mapE map_to_list.
rewrite (List.eq_map _ idfun) //=.
rewrite map_id.
rewrite -{2}[w](unpack128K); congr; apply/W2u128.Pack.ext_eq.
move=> i rgi; rewrite !(get_unpack128, nth_mkseq) //.
by rewrite to_listK /unpack128 initE /= ifT.
qed.

hint simplify VPSHUFD_256_228E.

(* -------------------------------------------------------------------- *)
lemma VPSHUFD_128_245E (w : W128.t) :
    VPSHUFD_128 w (W8.of_int 245)
  = W4u32.pack4 [w \bits32 1; w \bits32 1; w \bits32 3; w \bits32 3].
proof. by cbv delta. qed.

hint simplify VPSHUFD_128_245E.

(* -------------------------------------------------------------------- *)
lemma VPSHUFD_256_245E (w : W256.t) :
    VPSHUFD_256 w (W8.of_int 245)
  = W8u32.pack8 [
      w \bits32 1; w \bits32 1; w \bits32 3; w \bits32 3;
      w \bits32 5; w \bits32 5; w \bits32 7; w \bits32 7
    ].
proof. by cbv delta. qed.

hint simplify VPSHUFD_256_245E.

(* -------------------------------------------------------------------- *)
lemma VPUNPCKL_4u64E (u v : W256.t) :
    VPUNPCKL_4u64 u v
  = W4u64.pack4 [u \bits64 0; v \bits64 0; u \bits64 2; v \bits64 2].
proof. by cbv delta. qed.

hint simplify VPUNPCKL_4u64E.

(* -------------------------------------------------------------------- *)
lemma VPUNPCKH_4u64E (u v : W256.t) :
    VPUNPCKH_4u64 u v
  = W4u64.pack4 [u \bits64 1; v \bits64 1; u \bits64 3; v \bits64 3].
proof. by cbv delta. qed.

hint simplify VPUNPCKH_4u64E.

(* -------------------------------------------------------------------- *)
lemma VPBLENDD_256_170E (u v : W256.t) :
    VPBLENDD_256 u v (W8.of_int 170)
  = pack8 [
      u \bits32 0; v \bits32 1; u \bits32 2; v \bits32 3;
      u \bits32 4; v \bits32 5; u \bits32 6; v \bits32 7
    ].
proof. by cbv delta; rewrite !of_intwE; cbv delta. qed.

hint simplify VPBLENDD_256_170E.

(* -------------------------------------------------------------------- *)
lemma VPERM2I128_19E (u v : W256.t) :
    VPERM2I128 u v (W8.of_int 19)
  = pack2 [v \bits128 1; u \bits128 1].
proof. by cbv delta; rewrite !of_intwE /=; cbv delta. qed.

hint simplify VPERM2I128_19E.

(* -------------------------------------------------------------------- *)
lemma VINSERTI128_L (u : W256.t) (w : W128.t) :
  VINSERTI128 u w W8.zero = pack2 [w; u \bits128 1].
proof. done. qed.

hint simplify VINSERTI128_L.

(* -------------------------------------------------------------------- *)
lemma VINSERTI128_R (u : W256.t) (w : W128.t) :
  VINSERTI128 u w W8.one = pack2 [u \bits128 0; w].
proof. done. qed.

hint simplify VINSERTI128_R.

(* -------------------------------------------------------------------- *)
hint simplify W8u32.Pack.of_listK.
hint simplify W8u32.Pack.to_listK.

(* -------------------------------------------------------------------- *)
lemma to_list_unpack32E (w : W256.t) :
  to_list (unpack32 w) = [
    w \bits32 0; w \bits32 1; w \bits32 2; w \bits32 3;
    w \bits32 4; w \bits32 5; w \bits32 6; w \bits32 7
  ].
proof. by rewrite /to_list /mkseq -iotaredE. qed.

hint simplify to_list_unpack32E.

(* -------------------------------------------------------------------- *)

(* ==================================================================== *)
lemma pack8K (w : W256.t) : W8u32.pack8 (mkseq (W8u32.(\bits32) w) 8) = w.
proof. 
apply/W8u32.wordP=> i rgi; rewrite pack8bE //.
by rewrite of_listE initiE //= nth_mkseq .
qed.

hint simplify pack8K.

(* -------------------------------------------------------------------- *)
lemma pack8_bits32E (w : W32.t list) (i : int) : 0 <= i < 8 =>
  (W8u32.pack8 w) \bits32 i = nth W32.zero w i.
proof.
move=> rgi; apply/W32.ext_eq=> j rgj; rewrite pack8E bits32E /= initE rgj /=.
rewrite initE ifT 1:/# /= modzMDl divzMDl // !(pdiv_small, pmod_small) //=.
by rewrite get_of_list.
qed.

hint simplify pack8_bits32E.

(* -------------------------------------------------------------------- *)
lemma pack8_eq (F G : int -> W32.t) :
     (forall i, 0 <= i < 8 => F i = G i)
  =>   pack8 [F 0; F 1; F 2; F 3; F 4; F 5; F 6; F 7]
     = pack8 [G 0; G 1; G 2; G 3; G 4; G 5; G 6; G 7].
proof. by move=> eq; rewrite !eq. qed.

(* ==================================================================== *)
abbrev MODULUS = 8380417.

(* -------------------------------------------------------------------- *)
abbrev MODULUS_8u32 =
  225935595421087293402315996791205668696012104344015382954355885915737415681.

(* -------------------------------------------------------------------- *)
op MODULUS_VECTOR : W256.t =
 W8u32.pack8 (nseq 8 (W32.of_int MODULUS)).

(* -------------------------------------------------------------------- *)
lemma MODULUS_VECTOR_E : W256.of_int MODULUS_8u32 = MODULUS_VECTOR.
proof.
have eq: forall i, 0 <= i < 8 =>
  W256.of_int MODULUS_8u32 \bits32 i = W32.of_int MODULUS.
- by move=> i /mem_range @/range; rewrite -iotaredE /= => [#|] -> /=.
apply/W8u32.wordP=> i rgi; rewrite eq 1://.
by rewrite /MODULUS_VECTOR pack8_bits32E // nth_nseq.
qed.

(* -------------------------------------------------------------------- *)
abbrev INVERSE_OF_MODULUS_MOD_MONTGOMERY_R = 58728449.

(* -------------------------------------------------------------------- *)
abbrev INVERSE_OF_MODULUS_MOD_MONTGOMERY_R_8u32 = 
  1583315853253120773718772168429862829322770379248453373268938642773050925057.

(* -------------------------------------------------------------------- *)
op INVERSE_OF_MODULUS_MOD_MONTGOMERY_R_VECTOR : W256.t =
 W8u32.pack8 (nseq 8 (W32.of_int INVERSE_OF_MODULUS_MOD_MONTGOMERY_R)).

(* -------------------------------------------------------------------- *)
lemma INVERSE_OF_MODULUS_MOD_MONTGOMERY_R_VECTOR_E :
    W256.of_int INVERSE_OF_MODULUS_MOD_MONTGOMERY_R_8u32
  = INVERSE_OF_MODULUS_MOD_MONTGOMERY_R_VECTOR.
proof.
have eq: forall i, 0 <= i < 8 =>
    W256.of_int INVERSE_OF_MODULUS_MOD_MONTGOMERY_R_8u32 \bits32 i
  = W32.of_int INVERSE_OF_MODULUS_MOD_MONTGOMERY_R.
- by move=> i /mem_range @/range; rewrite -iotaredE /= => [#|] -> /=.
apply/W8u32.wordP=> i rgi; rewrite eq 1://.
rewrite /INVERSE_OF_MODULUS_MOD_MONTGOMERY_R_VECTOR.
by rewrite pack8_bits32E // nth_nseq.
qed.

(* ==================================================================== *)
section.
(* -------------------------------------------------------------------- *)

(* -------------------------------------------------------------------- *)
lemma wpoly_get256_aligned (p : wpoly) (s : int) :
     0 <= s < 256 - 7
  =>   WArray1024.get256_direct (WArray1024.init32 ("_.[_]" p)) (4 * s)
     = W8u32.pack8 (mkseq (fun i => p.[s + i]) 8).
proof.
hint +listred.
move=> *; apply/W8u32.wordP=> i rgi; rewrite get_pack8 1://.
rewrite nth_mkseq //= get256E &(W32.ext_eq) => j rgj.
rewrite bits32_W32u8 ifT // pack4wE //=.
rewrite of_listE 4!initE /= !ifT ~-1:/#.
rewrite 4!initE /= !ifT ~-1:/# !addrA -mulrDr.
rewrite [4*_]mulrC modzMl !modzMDl ![_%%4]pmod_small //.
rewrite !(mulzK, divzMDl) // ![_ %/ 4]pdiv_small //.
rewrite -(W4u8.Pack.init_ext ((\bits8) p.[s + i])) 1:/#.
by rewrite initE ifT 1:/# -get_bits8.
qed.

(* -------------------------------------------------------------------- *)
lemma wpoly_get256_alignedE (p : wpoly) (s : int) :
     0 <= s %/ 4 < 256 - 7
  => s %% 4 = 0
  =>   WArray1024.get256_direct (WArray1024.init32 ("_.[_]" p)) s
     = W8u32.pack8 (mkseq (fun i => p.[s %/ 4 + i]) 8).
proof. by move=> ?; have := wpoly_get256_aligned p (s %/ 4); smt(). qed.

(* -------------------------------------------------------------------- *)
lemma wpoly_set256_aligned (s : int) (p : wpoly) (w : W256.t) :
     0 <= s < 256 - 7
  =>   Array256.init
          (fun (i : int) =>
            get32
              (set256_direct (init32 ("_.[_]" p)) (4 * s) w) i)
     = Array256.fill (fun i =>  w \bits32 (i - s)) s 8 p.
proof.
hint +listred.
move=> ?; apply: Array256.ext_eq=> j rgj; rewrite fillE !initE rgj /=.
rewrite get32E /= &(W32.ext_eq) => k rgk; rewrite pack4wE //= initE /=.
rewrite ifT 1:/# /set256_direct WArray1024.initE /= ifT 1:/#.
have /= -> := fun_if (fun (w : W8.t) => w.[k %% 8]).
have /= -> := fun_if (fun (w : W32.t) => w.[k]).
rewrite &(if_congr) 1:/#; last first.
- rewrite initE ifT 1:/# /= [4*_]mulrC divzMDl // -divz_mul //=.
  by rewrite pdiv_small 1:// /= modzMDl modz_small 1:/# -get_bits8.
- by rewrite addrAC -mulrBr -W256_bits32_bits8 1:/# -get_bits8.
qed.

(* -------------------------------------------------------------------- *)
lemma wpoly_set256_alignedE (s : int) (p : wpoly) (w : W256.t) :
     0 <= s %/ 4 < 256 - 7
  => s %% 4 = 0
  =>   Array256.init                                                           
          (fun (i : int) =>                                                     
            get32
              (set256_direct (init32 ("_.[_]" p)) s w) i)
     = Array256.fill (fun i =>  w \bits32 (i - s %/ 4)) (s %/ 4) 8 p.
proof. by move=> ?; have := wpoly_set256_aligned (s %/ 4) p w; smt(). qed.

end section.

(* ==================================================================== *)
lemma mmrP (u v : W256.t) : hoare[M.montgomery_multiply_and_reduce :
      arg = (u, v)
    ==>
      res = W8u32.pack8_t (W8u32.Pack.map2 mmr (W8u32.unpack32 u) (W8u32.unpack32 v))
  ].
proof.
hint +listred.
proc.
auto=> &hr [#] 2!->>.
pose uw (i : int) := u \bits32 i; pose vw (i : int) := v \bits32 i.
rewrite -[u]pack8K /= -!/~(uw _) -[v]pack8K /= -!/~(vw _).
rewrite INVERSE_OF_MODULUS_MOD_MONTGOMERY_R_VECTOR_E MODULUS_VECTOR_E.
rewrite /INVERSE_OF_MODULUS_MOD_MONTGOMERY_R_VECTOR /=.
rewrite /MODULUS_VECTOR //=.

pose qinv := W32.of_int INVERSE_OF_MODULUS_MOD_MONTGOMERY_R.
pose q    := W32.of_int MODULUS.

pose F    := fun k =>
    (uw k \sx vw k)
  - (uw k \sx vw k \bits32 0 \sx qinv \bits32 0 \sx q) \bits32 1.

apply: (pack8_eq F (fun i => mmr (uw i) (vw i))).
move=> i rgi @/F @/mmr /=; move: (uw i) (vw i) => w1 w2.
by rewrite -shr_shrw 1:// => {F vw uw}; circuit.
qed.

(* -------------------------------------------------------------------- *)
lemma mmr_ll (u v : W256.t) : phoare[M.montgomery_multiply_and_reduce :
      arg = (u, v)
    ==>
      true
  ] = 1%r.
proof. by proc; islossless. qed.

(* -------------------------------------------------------------------- *)
lemma mmrP_ll (u v : W256.t) : phoare[M.montgomery_multiply_and_reduce :
      arg = (u, v)
    ==>
      res = W8u32.pack8_t (W8u32.Pack.map2 mmr (W8u32.unpack32 u) (W8u32.unpack32 v))
  ] = 1%r.
proof. by conseq (mmr_ll u v) (mmrP u v). qed.

(* -------------------------------------------------------------------- *)

(* -------------------------------------------------------------------- *)
hint simplify W64.of_uintK.

(* -------------------------------------------------------------------- *)
lemma VPERM2I128_32E (u v : W256.t) :
    VPERM2I128 u v (W8.of_int 32)
  = pack2 [u \bits128 0; v \bits128 0].
proof. by cbv delta; rewrite !of_intwE /=; cbv delta. qed.

hint simplify VPERM2I128_32E.

(* -------------------------------------------------------------------- *)
lemma VPERM2I128_49E (u v : W256.t) :
    VPERM2I128 u v (W8.of_int 49)
  = pack2 [u \bits128 1; v \bits128 1].
proof. by cbv delta; rewrite !of_intwE /=; cbv delta. qed.

hint simplify VPERM2I128_49E.

(* -------------------------------------------------------------------- *)

(* -------------------------------------------------------------------- *)
lemma to_list_unpack32_128E (x : W128.t) :
  W4u32.Pack.to_list (W4u32.unpack32 x)
  = [x \bits32 0; x \bits32 1; x \bits32 2; x \bits32 3].
proof.
by rewrite W4u32.unpack32E W4u32.Pack.to_listE /mkseq -iotaredE /= ?W4u32.Pack.initiE.
qed.

(* -------------------------------------------------------------------- *)
(* Symbolic execution of VPSHUFB_128 by simplification                  *)
lemma VPSHUFB_128_B_E (w : W128.t) (m : W8.t) :
  VPSHUFB_128_B w m
  = if 128 <= to_uint m then W8.zero else w \bits8 (to_uint m %% 16).
proof. by rewrite /VPSHUFB_128_B /=. qed.

hint simplify VPSHUFB_128_B_E.

lemma VPSHUFB_128_pack16E (w : W128.t) (b00 b01 b02 b03 b04 b05 b06 b07 b08 b09 b10 b11 b12 b13 b14 b15 : W8.t) :
  VPSHUFB_128 w (W16u8.pack16 [b00; b01; b02; b03; b04; b05; b06; b07; b08; b09; b10; b11; b12; b13; b14; b15])
  = W16u8.pack16
    [VPSHUFB_128_B w b00;
     VPSHUFB_128_B w b01;
     VPSHUFB_128_B w b02;
     VPSHUFB_128_B w b03;
     VPSHUFB_128_B w b04;
     VPSHUFB_128_B w b05;
     VPSHUFB_128_B w b06;
     VPSHUFB_128_B w b07;
     VPSHUFB_128_B w b08;
     VPSHUFB_128_B w b09;
     VPSHUFB_128_B w b10;
     VPSHUFB_128_B w b11;
     VPSHUFB_128_B w b12;
     VPSHUFB_128_B w b13;
     VPSHUFB_128_B w b14;
     VPSHUFB_128_B w b15].
proof. by apply W128.all_eq_eq; cbv W128.all_eq VPSHUFB_128 W16u8.unpack8. qed.

hint simplify VPSHUFB_128_pack16E.

(* recombining four consecutive bytes into the dword they came from *)
lemma pack4_bits8_0 (w : W128.t) :
  W4u8.pack4 [w \bits8 0; w \bits8 1; w \bits8 2; w \bits8 3] = w \bits32 0.
proof.
apply W4u8.wordP => j hj.
rewrite W4u8.pack4bE 1:// W128_bits32_bits8 1:// /=.
by have [|[|[|]]]-> : j = 0 \/ j = 1 \/ j = 2 \/ j = 3 by smt().
qed.
lemma pack4_bits8_1 (w : W128.t) :
  W4u8.pack4 [w \bits8 4; w \bits8 5; w \bits8 6; w \bits8 7] = w \bits32 1.
proof.
apply W4u8.wordP => j hj.
rewrite W4u8.pack4bE 1:// W128_bits32_bits8 1:// /=.
by have [|[|[|]]]-> : j = 0 \/ j = 1 \/ j = 2 \/ j = 3 by smt().
qed.
lemma pack4_bits8_2 (w : W128.t) :
  W4u8.pack4 [w \bits8 8; w \bits8 9; w \bits8 10; w \bits8 11] = w \bits32 2.
proof.
apply W4u8.wordP => j hj.
rewrite W4u8.pack4bE 1:// W128_bits32_bits8 1:// /=.
by have [|[|[|]]]-> : j = 0 \/ j = 1 \/ j = 2 \/ j = 3 by smt().
qed.
lemma pack4_bits8_3 (w : W128.t) :
  W4u8.pack4 [w \bits8 12; w \bits8 13; w \bits8 14; w \bits8 15] = w \bits32 3.
proof.
apply W4u8.wordP => j hj.
rewrite W4u8.pack4bE 1:// W128_bits32_bits8 1:// /=.
by have [|[|[|]]]-> : j = 0 \/ j = 1 \/ j = 2 \/ j = 3 by smt().
qed.

lemma pack4_zeroE :
  W4u8.pack4 [W8.zero; W8.zero; W8.zero; W8.zero] = W32.zero.
proof. by apply W32.all_eq_eq; cbv W32.all_eq W4u8.unpack8. qed.

hint simplify (pack4_bits8_0, pack4_bits8_1, pack4_bits8_2, pack4_bits8_3,
               pack4_zeroE).
hint simplify to_list_unpack32_128E.

