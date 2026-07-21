(* -------------------------------------------------------------------- *)
require import AllCore CoreUtils List IntDiv BitEncoding.

import BitChunking.

(* -------------------------------------------------------------------- *)
from Jasmin require import JWord JModel_x86.
from JazzEC require import Ml_dsa_65_avx2.

require import Avx2red.
require import Array4 Array25 Array32 Array168 Array256 Array848 Array7680.
require import WArray256 WArray848 WArray1024.
require import XArray256 XArray7680.

(* -------------------------------------------------------------------- *)
hint simplify dvdz0.

(* -------------------------------------------------------------------- *)
op modulus : int = 8380417.

(* -------------------------------------------------------------------- *)
hint simplify b2i0, b2i1.

(* -------------------------------------------------------------------- *)
lemma allP_range (k : int) (p : int -> bool) :
  all p (range 0 k) <=> (forall i, 0 <= i < k => p i).
proof. admitted.

(* -------------------------------------------------------------------- *)
lemma allP_range' (k : int) (p : int -> bool) :
  all p (range 0 k) <=> (forall i, 0 <= i => i < k => p i).
proof. admitted.

(* -------------------------------------------------------------------- *)
lemma sub0 (a : 'a Array848.t) (base : int) :
  Array848.sub a base 0 = [].
proof. by rewrite /sub mkseq0. qed.

hint simplify sub0.

(* -------------------------------------------------------------------- *)
theory PrefixArray.
  op sizeB : int.
  op sizeS : int.

  axiom le_size : sizeB <= sizeS.

  clone import PolyArray as AB with op size <- sizeB.
  clone import PolyArray as AS with op size <- sizeS.

  op truncatea'B (a : 'a AS.t) : 'a AB.t =
    AB.init (fun i => a.[i]).

  op injecta'S (a : 'a AS.t) (b : 'a AB.t) : 'a AS.t =
    AS.init (fun i => if 0 <= i < sizeB then b.[i] else a.[i]).

  lemma truncatea'BE (a : 'a AS.t) :
    AB.init (fun i => a.[i]) = truncatea'B a.
  proof. by done. qed.

  lemma injecta'SE (a : 'a AS.t) (b : 'a AB.t) :
    AS.init (fun i => if 0 <= i < sizeB then b.[i] else a.[i])
    = injecta'S a b.
  proof. by done. qed.
end PrefixArray.

clone import PrefixArray as PA_848_168 with
      op sizeB <- 168,
      op sizeS <- 848,
  theory AB    <- Array168,
  theory AS    <- Array848

  rename "'S" as "_848"
         "'B" as "_168"

  proof le_size by done.

(* -------------------------------------------------------------------- *)
op ntho ['a] = nth<:'a>.

lemma ntho0 ['a] (x0 : 'a) (x : 'a) (s : 'a list) :
  nth x0 (x :: s) 0 = x.
proof. done. qed.

lemma nthoS ['a] (x0 : 'a) (x : 'a) (s : 'a list) (n : int):
  0 < n => nth x0 (x :: s) n = nth x0 s (n - 1).
proof. by move=> ? /=; rewrite ifF 1:/#. qed.

hint simplify ntho0, nthoS.

(* -------------------------------------------------------------------- *)
type rho   = W8.t Array32.t.
type wpoly = W32.t Array256.t.
type A     = W32.t Array7680.t.

(* -------------------------------------------------------------------- *)
op [opaque] reject (data : W8.t list) : W32.t list =
  filter (fun w => to_uint w < modulus)
    (map (fun ws => W4u8.pack4 ws `&` W32.of_int (2^23 - 1)) (chunk 3 data)).

(* -------------------------------------------------------------------- *)
lemma reject_nil : reject [] = [].
proof. admitted.

hint simplify reject_nil.

(* -------------------------------------------------------------------- *)
op [opaque] agree (p : wpoly) (base : int) (coeffs : W32.t list) =
  forall i,
       0 <= i < size coeffs
    => 0 <= i + base < 256
    => p.[base + i] = nth W32.zero coeffs i.

(* -------------------------------------------------------------------- *)
lemma agree_nil (p : wpoly) (base : int) : agree p base [].
proof. admitted.

hint simplify agree_nil.

(* -------------------------------------------------------------------- *)
require Xof.

op shake128_slice : W8.t list -> int -> int -> W8.t list.

(* -------------------------------------------------------------------- *)
type sha3_state = { absorbed : W8.t list; read : int option }.

op is_valid_sha3_state (state : sha3_state) =
  match state.`read with None => true | Some i => 0 <= i end.

(* -------------------------------------------------------------------- *)
op mk_absorbing (data : W8.t list) =
  {| absorbed = data; read = None |}.

(* -------------------------------------------------------------------- *)
op mk_absorbed (data : W8.t list) =
  {| absorbed = data; read = Some 0 |}.

(* -------------------------------------------------------------------- *)
op mk_read (read : int) (data : W8.t list) =
  {| absorbed = data; read = Some read |}.

(* -------------------------------------------------------------------- *)
type sha3x4_state = sha3_state Array4.t.

op is_valid_sha3x4_state (state : sha3x4_state) =
  Array4.all is_valid_sha3_state state.

(* -------------------------------------------------------------------- *)
type sha3x4 = W256.t Array25.t.

op (\sha3for) : sha3x4 -> sha3x4_state -> bool.

lemma is_sha3x4_is_valid (rstate : sha3x4) (state : sha3x4_state) :
  rstate \sha3for state => is_valid_sha3x4_state state.
admitted.

(* -------------------------------------------------------------------- *)
lemma sha3for_eqR rstate s1 s2 :
  s1 = s2 => rstate \sha3for s1 => rstate \sha3for s2.
proof. by move=> ->. qed.

(* -------------------------------------------------------------------- *)
lemma truncateu16_256E (w : W256.t) :
  truncateu16 w = w \bits16 0.
proof. admitted.

(* -------------------------------------------------------------------- *)
lemma bits8_256_shiftE (w : W256.t) (i : int) : 0 <= i < 16 =>
  (w `<<<` 8 * i) \bits8 i = w \bits8 0.
proof. admitted.

(* -------------------------------------------------------------------- *)
lemma bits8_256_le_shiftE (w : W256.t) (i j : int) :
  0 <= i < 16 => 0 <= j < i =>
    (w `<<<` 8 * i) \bits8 j = W8.zero.
proof. admitted.

(* -------------------------------------------------------------------- *)
lemma w256_shift_wintE (w i : int) :
  0 <= i < 256 => W256.of_int (w `<<` i) = W256.of_int w `<<<` i.
proof. admitted.

(* -------------------------------------------------------------------- *)
lemma w256_ofint_bits8E (w i : int) :
  (W256.of_int w) \bits8 i = W8.of_int (w %/ 2^(8*i)).
proof. admitted.

(* -------------------------------------------------------------------- *)
lemma matrix_A__shake128_absorb_34_4xP
  (rho_ : rho) (ds_ : W16.t Array4.t)
: hoare[
  M.shake128_absorb_34_4x :
      rho = rho_ /\ domain_separators = ds_
    ==>
      let state =
        Array4.map (fun w => mk_absorbed (to_list rho_ ++ W2u8.to_list w)) ds_
      in res \sha3for state
  ].
proof.
proc.
admitted.

(* -------------------------------------------------------------------- *)
lemma matrix_A____shake128_squeeze_multiple_blocks_4xP (data : W8.t list Array4.t)
: hoare[
  M.matrix_A____shake128_squeeze_multiple_blocks_4x :
      state \sha3for Array4.map (mk_absorbed) data
    ==>
         res.`1 \sha3for Array4.map (mk_read (168 * 5)) data
      /\ (forall i, 0 <= i < 4 =>
            let b = ntho witness [res.`2; res.`3; res.`4; res.`5] i in
            Array848.sub b 0 840 = shake128_slice data.[i] 0 840)
  ].
proof.
proc.
admitted.

(* -------------------------------------------------------------------- *)
op MODULUS8u32 =
  W8u32.pack8 (nseq 8 (W32.of_int modulus)).

(* -------------------------------------------------------------------- *)
section.
hint simplify nseq0, nseqS.
hint simplify range_geq, range_ltn.

lemma MODULUS8u32E :
  W256.of_int
    0x007fe001007fe001007fe001007fe001007fe001007fe001007fe001007fe001
  = MODULUS8u32.
proof.
apply/W8u32.wordP=> i rgi; rewrite pack8bE //= get_of_list //.
rewrite nth_nseq //= of_int_bits32_div //=.
by move: i rgi; apply/allP_range.
qed.
end section.

(* -------------------------------------------------------------------- *)
lemma WArray848_get256E (a : W8.t Array848.t) (base : int)  :
    WArray848.get256_direct
      (WArray848.init8 (fun (i : int) => a.[i]))
      base
  = W32u8.pack32 (Array848.sub a base 32).
proof. admitted.

(* -------------------------------------------------------------------- *)
lemma WArray256_get128E (a : W8.t Array256.t) (base : int) :
    WArray256.get128_direct
      (WArray256.init8 (fun (i : int) => a.[i]))
      base
  = W16u8.pack16 (Array256.sub a base 16).
proof. admitted.

(* -------------------------------------------------------------------- *)
lemma W32Array256_set128E (a : W32.t Array256.t) (base : int) (w : W128.t) :
   Array256.init                                                               
      (fun (i : int) =>                                                         
         WArray1024.get32                                            
           (WArray1024.set128_direct                                 
              (WArray1024.init32 (fun (i0 : int) => a.[i0]))
              base w) i)
 = XArray256.PAE.replace_ a (base %/ 4) (to_list (W4u32.unpack32 w)).
proof. admitted. (* NB: valid at 4-aligned base only; all uses are aligned *)

(* -------------------------------------------------------------------- *)
hint exact : W64.WRingA.oner_neq0.

(* -------------------------------------------------------------------- *)
lemma of_int_b2i_eq1P (b : bool) : W64.of_int (b2i b) = W64.one => b.
proof. by case: b => //; rewrite b2i0 /= eq_sym. qed.

(* ==================================================================== *)
(* Leaf lemmas for the vectorized rejection-sampling loop body          *)
(* ==================================================================== *)
(* filtering is masking by the acceptance bits *)
lemma filter_mask' ['a] (p : 'a -> bool) (s : 'a list) :
  filter p s = mask (map p s) s.
proof. by elim: s => //= x s <-; case: (p x). qed.

(* -------------------------------------------------------------------- *)
lemma sub_cat (a : W8.t Array848.t) (off len1 len2 : int) :
  0 <= len1 => 0 <= len2 =>
     Array848.sub a off (len1 + len2)
   = Array848.sub a off len1 ++ Array848.sub a (off + len1) len2.
proof.
move=> ge0_1 ge0_2; rewrite /sub mkseq_add //=; congr.
by apply eq_in_mkseq => i rgi /=; congr; ring.
qed.

(* -------------------------------------------------------------------- *)
lemma reject_cat (xs ys : W8.t list) : 3 %| size xs =>
  reject (xs ++ ys) = reject xs ++ reject ys.
proof. by move=> h; rewrite /reject chunk_cat // map_cat filter_cat. qed.

(* -------------------------------------------------------------------- *)
import BS2Int.

abbrev mask23 = W32.of_int (2 ^ 23 - 1).

op accept (w : W32.t) : bool = to_uint w < modulus.

op cands (bs : W8.t list) : W32.t list =
  map (fun ws => W4u8.pack4 ws `&` mask23) (chunk 3 bs).

lemma rejectE (bs : W8.t list) : reject bs = filter accept (cands bs).
proof. by rewrite /reject /cands /accept. qed.

lemma size_cands (bs : W8.t list) : size (cands bs) = size bs %/ 3.
proof. by rewrite /cands size_map size_chunk. qed.

lemma cands_uint_lt (bs : W8.t list) (w : W32.t) :
  w \in cands bs => 0 <= to_uint w < 2 ^ 23.
proof.
by move=> /mapP [ws [_ ->]]; rewrite W32.to_uint_and_mod // modz_cmp.
qed.

(* -------------------------------------------------------------------- *)
lemma tosint_small (c : W32.t) : 0 <= to_uint c < 2 ^ 23 =>
  to_sint c = to_uint c.
proof.
move=> bnd; rewrite /to_sint /smod ifF //.
by move: bnd => /=; smt().
qed.

lemma tosint_q : to_sint (W32.of_int modulus) = modulus.
proof. by rewrite /to_sint /smod of_uintK /modulus. qed.

lemma msb_lane (c : W32.t) : 0 <= to_uint c < 2 ^ 23 =>
  W32.msb (W8u32.wcmp Int.(<) c (W32.of_int modulus)) = accept c.
proof.
move=> bnd; rewrite /wcmp tosint_small // tosint_q /accept.
by case: (to_uint c < modulus) => _ /=.
qed.

(* acceptance bits: the movemask of the comparison lists the accepted   *)
(* candidates, least significant bit first                              *)
lemma map_msb_cmpE (cs : W32.t list) :
  size cs = 8 => (forall w, w \in cs => 0 <= to_uint w < 2 ^ 23) =>
    map W32.msb (W8u32.to_list (VPCMPGT_8u32 MODULUS8u32 (W8u32.pack8 cs)))
  = map accept cs.
proof.
move=> sz8 bnd.
apply (eq_from_nth witness); 1: by rewrite size_map W8u32.size_to_list size_map sz8.
move=> i; rewrite size_map W8u32.size_to_list => rgi.
rewrite (nth_map witness witness); 1: by rewrite W8u32.size_to_list.
rewrite (nth_map W32.zero witness); 1: by rewrite sz8.
rewrite (nth_change_dfl W32.zero witness); 1: by rewrite W8u32.size_to_list.
rewrite W8u32.nth_to_list /VPCMPGT_8u32 W8u32.map2bE 1://.
have -> : W8u32.pack8 (nseq 8 (W32.of_int modulus)) \bits32 i = W32.of_int modulus.
- by rewrite W8u32.pack8bE 1:// W8u32.Pack.get_of_list 1:// nth_nseq 1:/#.
have -> : W8u32.pack8 cs \bits32 i = nth W32.zero cs i.
- by rewrite W8u32.pack8bE 1:// W8u32.Pack.get_of_list 1://.
rewrite msb_lane; 1: by apply bnd; apply mem_nth; rewrite sz8.
done.
qed.

lemma to_uint_good (cs : W32.t list) :
  size cs = 8 => (forall w, w \in cs => 0 <= to_uint w < 2 ^ 23) =>
    to_uint (zeroextu64 (MOVEMASK_8u32 (VPCMPGT_8u32 MODULUS8u32 (W8u32.pack8 cs))))
  = bs2int (map accept cs).
proof.
move=> sz8 bnd; rewrite to_uint_zeroextu64 /MOVEMASK_8u32 /=.
have /= -> := map_msb_cmpE cs sz8 bnd.
rewrite W32.to_uintE.
have -> : w2bits (W32.bits2w (map accept cs)) = map accept cs ++ nseq 24 false.
- apply (eq_from_nth false).
  - by rewrite W32.size_w2bits size_cat size_map sz8 size_nseq.
  move=> i; rewrite W32.size_w2bits => rgi.
  rewrite w2bitsE nth_mkseq //= W32.get_bits2w // nth_cat size_map sz8.
  case: (i < 8) => hc; 1: by done.
  by rewrite nth_default ?size_map ?sz8 1:/# nth_nseq /#.
by rewrite bs2int_cat bs2int_nseq_false.
qed.

(* -------------------------------------------------------------------- *)
(* -------------------------------------------------------------------- *)
(* the two 128-bit halves of the packed candidates                      *)
lemma extract_lo (cs : W32.t list) : size cs = 8 =>
    W4u32.Pack.to_list (W4u32.unpack32 (VEXTRACTI128 (W8u32.pack8 cs) W8.zero))
  = take 4 cs.
proof.
by case: cs => [|c0 [|c1 [|c2 [|c3 [|c4 [|c5 [|c6 [|c7 [|]]]]]]]]] //=.
qed.

lemma extract_hi (cs : W32.t list) : size cs = 8 =>
    W4u32.Pack.to_list (W4u32.unpack32 (VEXTRACTI128 (W8u32.pack8 cs) W8.one))
  = drop 4 cs.
proof.
case: cs => [|c0 [|c1 [|c2 [|c3 [|c4 [|c5 [|c6 [|c7 [|]]]]]]]]] //=.
rewrite /VEXTRACTI128.
- by have -> : b2i W8.one.[0] = 1 by rewrite W8.get_to_uint.
by smt(size_ge0).
qed.


(* -------------------------------------------------------------------- *)
lemma to_uint_and15 (g : W64.t) :
  to_uint (g `&` W64.of_int 15) = to_uint g %% 16.
proof.
have := W64.to_uint_and_mod 4 g _ => //=.
qed.

lemma to_uint_shr4 (g : W64.t) :
  to_uint (g `>>` W8.of_int 4) = to_uint g %/ 16.
proof. by rewrite W64.shr_div of_uintK /=. qed.

lemma popcnt6E (g : W64.t) :
  (POPCNT_64 g).`6 = W64.of_int (count idfun (W64.w2bits g)).
proof. by rewrite /POPCNT_64 /flags_w. qed.

lemma popcnt_count (g : W64.t) (bs : bool list) :
  size bs = 4 => to_uint g = bs2int bs =>
  count idfun (W64.w2bits g) = count idfun bs.
proof.
move=> szb hg.
have e1 : bs2int (W64.w2bits g) = bs2int (bs ++ nseq 60 false).
- by rewrite -W64.to_uintE hg bs2int_cat bs2int_nseq_false szb /=.
have h1 := bs2intK (W64.w2bits g).
have h2 := bs2intK (bs ++ nseq 60 false).
move: h1 h2; rewrite W64.size_w2bits size_cat szb size_nseq /= e1 => h1 h2.
rewrite -h1 h2.
by rewrite count_cat count_nseq /idfun /=.
qed.

lemma int2bs_take4 (bs : bool list) : size bs = 8 =>
  int2bs 4 (bs2int (take 4 bs)) = take 4 bs.
proof.
by move=> szb; have := bs2intK (take 4 bs); rewrite size_take // szb.
qed.

lemma int2bs_drop4 (bs : bool list) : size bs = 8 =>
  int2bs 4 (bs2int (drop 4 bs)) = drop 4 bs.
proof.
by move=> szb; have := bs2intK (drop 4 bs); rewrite size_drop // szb.
qed.

(* -------------------------------------------------------------------- *)
(* writing four dwords at the end of the agreed prefix extends the      *)
(* agreement by the first k of them                                     *)
lemma agree_replace (p : wpoly) (old l : W32.t list) (k : int) :
  0 <= k <= 4 => size l = 4 =>
  agree p 0 old =>
  agree (XArray256.PAE.replace_ p (size old) l) 0 (old ++ take k l).
proof.
move=> rgk szl; rewrite /agree => hag i rgi rgibase.
rewrite /XArray256.PAE.replace_ Array256.filliE 1:/# szl /=.
move: rgi rgibase; rewrite size_cat size_take 1:/# szl => rgi rgibase.
rewrite nth_cat.
case: (i < size old) => hio; last first.
- rewrite ifT 1:/# nth_take 1,2:/#.
  by rewrite (nth_change_dfl witness W32.zero) 1:/#.
rewrite ifF 1:/#.
by have := hag i _ _ => //#.
qed.

(* -------------------------------------------------------------------- *)
(* the shuffle table compacts the dwords selected by the 4-bit mask to  *)
(* the front, in order                                                  *)
lemma shuffle_compact (x : W128.t) (m : int) : 0 <= m < 16 =>
    take (count idfun (int2bs 4 m))
      (W4u32.Pack.to_list (W4u32.unpack32 (VPSHUFB_128 x
        (W16u8.pack16 (Array256.sub matrix_A__SHUFFLE_TABLE (16 * m) 16)))))
  = mask (int2bs 4 m) (W4u32.Pack.to_list (W4u32.unpack32 x)).
proof.
move: m; apply/allP_range.
by rewrite /range /sub /int2bs /mkseq -iotaredE /=.
qed.

(* -------------------------------------------------------------------- *)
lemma take_sub (a : W8.t Array848.t) (k n m : int) :
  0 <= n <= m =>
  take n (Array848.sub a k m) = Array848.sub a k n.
proof. by move=> h; rewrite /sub take_mkseq. qed.

(* ==================================================================== *)
(* Leaf lemmas for the scalar rejection-sampling tail                   *)
(* ==================================================================== *)
lemma to_uint_shr2 (g : W64.t) :
  to_uint (g `>>` W8.of_int 2) = to_uint g %/ 4.
proof. by rewrite W64.shr_div of_uintK /=. qed.

(* -------------------------------------------------------------------- *)
lemma sub3E (a : W8.t Array848.t) (k : int) :
  Array848.sub a k 3 = [a.[k]; a.[k + 1]; a.[k + 2]].
proof. by rewrite /sub /mkseq -iotaredE /=. qed.

(* -------------------------------------------------------------------- *)
lemma acceptE (w : W32.t) : accept w = (to_uint w < 8380417).
proof. by rewrite /accept /modulus. qed.

(* -------------------------------------------------------------------- *)
lemma reject3E (x y z : W8.t) :
  reject [x; y; z]
  = if accept (W4u8.pack4 [x; y; z] `&` mask23)
    then [W4u8.pack4 [x; y; z] `&` mask23] else [].
proof. by rewrite rejectE /cands /chunk /mkseq -iotaredE /=. qed.

(* -------------------------------------------------------------------- *)
lemma zext32_8E (x : W8.t) :
  zeroextu32 x = W4u8.pack4 [x; W8.zero; W8.zero; W8.zero].
proof.
rewrite W4u8.zeroextu32E &(W4u8.wordP) => i rgi.
rewrite !W4u8.pack4bE 1,2:// initiE 1:// get_of_list 1://.
by move: rgi; rewrite -(mema_iota 0 4).
qed.

(* -------------------------------------------------------------------- *)
lemma shl8E (w : W32.t) :
  w `<<` W8.of_int 8 = W4u8.pack4 [W8.zero; w \bits8 0; w \bits8 1; w \bits8 2].
proof.
apply W32.wordP; apply/allP_range.
by rewrite /range -iotaredE /= /(`<<`) of_uintK /=.
qed.

(* -------------------------------------------------------------------- *)
lemma shl16E (w : W32.t) :
  w `<<` W8.of_int 16 = W4u8.pack4 [W8.zero; W8.zero; w \bits8 0; w \bits8 1].
proof.
apply W32.wordP; apply/allP_range.
by rewrite /range -iotaredE /= /(`<<`) of_uintK /=.
qed.

(* -------------------------------------------------------------------- *)
(* the scalar candidate assembly is the packed 3-byte group             *)
lemma or3E (x y z : W8.t) :
  (zeroextu32 x `|` (zeroextu32 y `<<` W8.of_int 8)) `|`
  (zeroextu32 z `<<` W8.of_int 16)
  = W4u8.pack4 [x; y; z].
proof.
by rewrite !zext32_8E shl8E shl16E; apply W4u8.allP => /=.
qed.

hint simplify or3E.

(* -------------------------------------------------------------------- *)
lemma agree_set (p : wpoly) (l : W32.t list) (c : W32.t) :
  size l < 256 => agree p 0 l =>
  agree p.[size l <- c] 0 (l ++ [c]).
proof.
move=> hsz; rewrite /agree => hag i /=; rewrite size_cat /= => rgi rgb.
rewrite Array256.get_setE 1:/# nth_cat.
case: (i = size l) => [-> /=|ne] //.
by rewrite ifT 1:/#; smt().
qed.

(* -------------------------------------------------------------------- *)
lemma agree_full (p : wpoly) (l1 l2 : W32.t list) :
  256 <= size l1 => agree p 0 l1 =>
  agree p 0 (l1 ++ l2).
proof.
move=> hsz; rewrite /agree => hag i /=; rewrite size_cat => rgi rgb.
by rewrite nth_cat ifT 1:/#; smt().
qed.

(* -------------------------------------------------------------------- *)
(* the 3-byte candidate read at offset n of the byte stream             *)
op cand (a : W8.t Array848.t) (n : int) : W32.t =
  W4u8.pack4 [a.[n]; a.[n + 1]; a.[n + 2]] `&` mask23.

(* -------------------------------------------------------------------- *)
(* splitting the accepted stream at a 3-aligned offset                  *)
lemma reject_block (a : W8.t Array848.t) (n m : int) :
  0 <= n => 0 <= m => 3 %| n =>
  reject (Array848.sub a 0 (n + m))
  = reject (Array848.sub a 0 n) ++ reject (Array848.sub a n m).
proof.
move=> hn hm hdvd; rewrite sub_cat // (_ : 0 + n = n) 1:/#.
by rewrite reject_cat // size_sub /#.
qed.

(* -------------------------------------------------------------------- *)
(* consuming one candidate extends the accepted prefix by its filter    *)
lemma reject_step (a : W8.t Array848.t) (n : int) :
  0 <= n => 3 %| n =>
  reject (Array848.sub a 0 (n + 3))
  = reject (Array848.sub a 0 n)
    ++ if accept (cand a n) then [cand a n] else [].
proof.
by move=> hn hdvd; rewrite reject_block // sub3E reject3E -/(cand a n).
qed.

(* -------------------------------------------------------------------- *)
(* scalar-loop data invariant: p holds the accepted prefix of the       *)
(* first off bytes of the stream, fl counts it (capped at 256)          *)
op sampled (b : W8.t Array848.t) (p : wpoly) (fl off : int) =
     off <= 840
  /\ 3 %| off
  /\ fl <= 256
  /\ fl = size (reject (Array848.sub b 0 off))
  /\ agree p 0 (reject (Array848.sub b 0 off)).

(* -------------------------------------------------------------------- *)
(* local reduction hints for the bytestream decoder                     *)
lemma and255E (x : W8.t) : x `&` W8.of_int 255 = x.
proof.
have -> : W8.of_int 255 = W8.onew.
- by rewrite /onew /=.
by done.
qed.

hint simplify and255E.

lemma pack4_3_and_maskE (a b c : W8.t) :
  W4u8.pack4 [a; b; c] `&` W32.of_int 8388607
  = W4u8.pack4 [a; b; c `&` W8.of_int 127; W8.zero].
proof.
apply W4u8.allP => /=.
by rewrite !W4u8.of_int_bits8_div //=.
qed.

hint simplify pack4_3_and_maskE.

(* DECODING_TABLE.[0]: the dword permutation [0 1 2 0 3 4 5 0]          *)
lemma DECODING_PERM_E :
  W256.of_int 31385508682779410369523405889615886801803926611390921441280
  = W8u32.pack8
    [W32.zero; W32.of_int 1; W32.of_int 2; W32.zero;
     W32.of_int 3; W32.of_int 4; W32.of_int 5; W32.zero].
proof.
apply W8u32.allP => /=.
by rewrite !W8u32.of_int_bits32_div //=.
qed.

hint simplify DECODING_PERM_E.

(* DECODING_TABLE.[1]: the in-lane 3-of-4 byte spread                   *)
lemma DECODING_SHUFFLE_E :
  W256.of_int 115359280993406415849895417079880437751483271933338715711596891385178068484352
  = W32u8.pack32
    [W8.zero; W8.of_int   1; W8.of_int   2; W8.of_int 255;
     W8.of_int   3; W8.of_int   4; W8.of_int   5; W8.of_int 255;
     W8.of_int   6; W8.of_int   7; W8.of_int   8; W8.of_int 255;
     W8.of_int   9; W8.of_int  10; W8.of_int  11; W8.of_int 255;
     W8.zero; W8.of_int   1; W8.of_int   2; W8.of_int 255;
     W8.of_int   3; W8.of_int   4; W8.of_int   5; W8.of_int 255;
     W8.of_int   6; W8.of_int   7; W8.of_int   8; W8.of_int 255;
     W8.of_int   9; W8.of_int  10; W8.of_int  11; W8.of_int 255].
proof. by apply W32u8.allP => /=. qed.

hint simplify DECODING_SHUFFLE_E.

(* DECODING_TABLE.[2]: the 8u32 23-bit mask, fused with the AND         *)
lemma mask23_and_pack32E (x00 x01 x02 x03 x04 x05 x06 x07 x08 x09 x10 x11 x12 x13 x14 x15 x16 x17 x18 x19 x20 x21 x22 x23 x24 x25 x26 x27 x28 x29 x30 x31 : W8.t) :
  W32u8.pack32
    [x00; x01; x02; x03; x04; x05; x06; x07;
     x08; x09; x10; x11; x12; x13; x14; x15;
     x16; x17; x18; x19; x20; x21; x22; x23;
     x24; x25; x26; x27; x28; x29; x30; x31] `&`
  W256.of_int 226156397384342666605459106258636701594091082888230722833791023177481060351
  = W32u8.pack32
    [x00; x01; x02 `&` W8.of_int 127; W8.zero;
     x04; x05; x06 `&` W8.of_int 127; W8.zero;
     x08; x09; x10 `&` W8.of_int 127; W8.zero;
     x12; x13; x14 `&` W8.of_int 127; W8.zero;
     x16; x17; x18 `&` W8.of_int 127; W8.zero;
     x20; x21; x22 `&` W8.of_int 127; W8.zero;
     x24; x25; x26 `&` W8.of_int 127; W8.zero;
     x28; x29; x30 `&` W8.of_int 127; W8.zero].
proof.
apply W32u8.allP => /=.
by rewrite !W32u8.of_int_bits8_div //=.
qed.

hint simplify mask23_and_pack32E.

(* -------------------------------------------------------------------- *)
(* the bytestream decoder: the first 24 bytes of the loaded word, as    *)
(* eight 3-byte candidates, zero-extended and masked to 23 bits         *)
lemma matrix_A____bytestream_to_potential_coefficientsP (bs : W8.t list) :
  hoare[ M.matrix_A____bytestream_to_potential_coefficients :
      size bs = 32 /\ bytestream = W32u8.pack32 bs
    ==>
      res = W8u32.pack8
              (map (fun ws => W4u8.pack4 ws `&` W32.of_int (2 ^ 23 - 1))
                 (chunk 3 (take 24 bs))) ].
proof.
proc; wp; skip => &hr [szbs ->].
have -> : take 24 bs = mkseq (nth W8.zero bs) 24.
- by rewrite -{1}(mkseq_nth W8.zero bs) szbs take_mkseq.
by rewrite /chunk /mkseq -!iotaredE /=.
qed.

(* -------------------------------------------------------------------- *)
lemma matrix_A__rejection_sample_multiple_blocksP (buf : W8.t Array848.t)
: hoare[
  M.matrix_A__rejection_sample_multiple_blocks :
      randombytes = buf
    ==>
         agree res.`1 0 (reject (Array848.sub buf 0 840))
      /\ to_uint res.`2 = min 256 (size (reject (Array848.sub buf 0 840)))
  ].
proof.
proc=> /=.
seq 2 : (#pre /\ shuffle_table_pointer = matrix_A__SHUFFLE_TABLE).
- by auto.
sp 4; seq 0 : (#{/~{modulus}}pre /\ modulus = MODULUS8u32).
- by auto=> &hr |>; rewrite MODULUS8u32E.
proc rewrite 1.1  WArray848_get256E.
proc rewrite 1.11 WArray256_get128E.
proc rewrite 1.13 W32Array256_set128E.
proc rewrite 1.22 WArray256_get128E.
proc rewrite 1.24 W32Array256_set128E.
seq 1: (                        (* FIXME: code position *)
     randombytes = buf
  /\ to_uint bytes_filled <= 1024
  /\ to_uint input_offset <= 5 * 168
  /\ (to_uint bytes_filled < (256 - 8) * 4 => to_uint input_offset = 5 * 168)
  /\ 3 %| to_uint input_offset
  /\ to_uint bytes_filled
       = 4 * size (reject (Array848.sub randombytes 0 (to_uint input_offset)))
  /\ agree polynomial 0 (reject (Array848.sub randombytes 0 (to_uint input_offset)))
).
- while (
       randombytes = buf
    /\ to_uint bytes_filled <= 1024
    /\ to_uint input_offset <= 5 * 168
    /\ 24 %| to_uint input_offset
    /\ modulus = MODULUS8u32
    /\ shuffle_table_pointer = matrix_A__SHUFFLE_TABLE
    /\ (stop_sampling = W64.of_int (b2i (!(
            to_uint bytes_filled < (256 - 8) * 4
         /\ to_uint input_offset < 5 * 168))))
    /\ to_uint bytes_filled
         = 4 * size (reject (Array848.sub randombytes 0 (to_uint input_offset)))
    /\ agree polynomial 0 (reject (Array848.sub randombytes 0 (to_uint input_offset)))
  ); last first.
  - by hoare split; auto=> &hr |> * /=; smt(of_int_b2i_eq1P).
  exlim randombytes => rb.
  proc change <1 : { randombytes <- rb; }; [by auto | cfold 1; wp -1].
  seq 2 : (#pre /\ potential_coefficients =
    W8u32.pack8 (map (fun ws => W4u8.pack4 ws `&` W32.of_int (2^23 - 1))
      (chunk 3 (sub randombytes (to_uint input_offset) 24)))).
  - ecall (matrix_A____bytestream_to_potential_coefficientsP
      (Array848.sub randombytes (to_uint input_offset) 32)).
    auto=> &hr |> *.
    by rewrite size_sub //= take_sub //.
wp; skip => &hr />.
move=> hbf hio hdvd hsz hag hne.
pose cs := map (fun (ws : W8.t list) => W4u8.pack4 ws `&` W32.of_int 8388607)
  (chunk 3 (Array848.sub randombytes{hr} (to_uint input_offset{hr}) 24)).
pose g := zeroextu64 (MOVEMASK_8u32 (VPCMPGT_8u32 MODULUS8u32 (W8u32.pack8 cs))).
have szcs : size cs = 8 by rewrite size_map size_chunk // size_sub.
have bnd : forall w, w \in cs => 0 <= to_uint w < 2 ^ 23 by apply cands_uint_lt.
pose bits := map accept cs.
have szbits : size bits = 8 by rewrite size_map szcs.
have hg : to_uint g = bs2int bits by apply to_uint_good.
have hlo : to_uint (g `&` W64.of_int 15) = bs2int (take 4 bits).
- by rewrite to_uint_and15 hg -(bs2int_mod bits 4).
have hhi : to_uint (g `>>` W8.of_int 4) = bs2int (drop 4 bits).
- by rewrite to_uint_shr4 hg -(bs2int_div 4 bits).
have rlo : 0 <= bs2int (take 4 bits) < 16.
- by rewrite bs2int_ge0 /=; have := bs2int_le2Xs (take 4 bits); rewrite size_take // szbits.
have rhi : 0 <= bs2int (drop 4 bits) < 16.
- by rewrite bs2int_ge0 /=; have := bs2int_le2Xs (drop 4 bits); rewrite size_drop // szbits.
have hclo : count idfun (W64.w2bits (g `&` W64.of_int 15)) = count idfun (take 4 bits).
- by apply popcnt_count; [rewrite size_take // szbits | exact hlo].
have hchi : count idfun (W64.w2bits (g `>>` W8.of_int 4)) = count idfun (drop 4 bits).
- by apply popcnt_count; [rewrite size_drop // szbits | exact hhi].
have [hlt992 hlt840] : to_uint bytes_filled{hr} < 992 /\ to_uint input_offset{hr} < 840.
- by case: (to_uint bytes_filled{hr} < 992 /\ to_uint input_offset{hr} < 840) hne => //=.
have clo_le : count idfun (take 4 bits) <= 4.
- by have := count_size idfun (take 4 bits); rewrite size_take // szbits.
have chi_le : count idfun (drop 4 bits) <= 4.
- by have := count_size idfun (drop 4 bits); rewrite size_drop // szbits.
have hsl : to_uint ((g `&` W64.of_int 15) `<<` W8.of_int 4) = 16 * bs2int (take 4 bits).
- by rewrite /(`<<`) of_uintK /= W64.to_uint_shl // hlo pmod_small /#.
have hsh : to_uint ((g `>>` W8.of_int 4) `<<` W8.of_int 4) = 16 * bs2int (drop 4 bits).
- by rewrite /(`<<`) of_uintK /= W64.to_uint_shl // hhi pmod_small /#.
have hplo : to_uint ((POPCNT_64 (g `&` W64.of_int 15)).`6 `<<` W8.of_int 2)
          = 4 * count idfun (take 4 bits).
rewrite popcnt6E hclo /(`<<`) of_uintK /= W64.to_uint_shl //.
rewrite of_uintK /ptr_modulus.
rewrite pmod_small; 1: by move: clo_le => /=; smt(count_ge0).
rewrite pmod_small; 1: by move: clo_le => /=; smt(count_ge0).
by ring.
have hphi : to_uint ((POPCNT_64 (g `>>` W8.of_int 4)).`6 `<<` W8.of_int 2)
          = 4 * count idfun (drop 4 bits).
rewrite popcnt6E hchi /(`<<`) of_uintK /= W64.to_uint_shl //.
rewrite of_uintK /ptr_modulus.
rewrite pmod_small; 1: by move: chi_le => /=; smt(count_ge0).
rewrite pmod_small; 1: by move: chi_le => /=; smt(count_ge0).
by ring.
have S_le : to_uint bytes_filled{hr} + 4 * count idfun (take 4 bits)
              + 4 * count idfun (drop 4 bits) <= 1024.
- by smt(count_ge0).
have off_le : to_uint input_offset{hr} + 24 <= 840.
- by move: hdvd hlt840 => /dvdzP [q ->] h; smt().
have off_dvd : 24 %| (to_uint input_offset{hr} + 24).
- by move: hdvd => /dvdzP [q ->]; apply/dvdzP; exists (q + 1); ring.
have b2i_hi : forall (s o : int), 992 <= s => b2i (!(s < 992 /\ o < 840)) = 1.
- by move=> s o hs; smt().
have b2i_off : forall (s o : int), 840 <= o => b2i (!(s < 992 /\ o < 840)) = 1.
- by move=> s o ho; smt().
have b2i_lo : forall (s o : int), !992 <= s => !840 <= o =>
  b2i (!(s < 992 /\ o < 840)) = 0.
- by move=> s o hs ho; smt().
pose old := reject (Array848.sub randombytes{hr} 0 (to_uint input_offset{hr})).
pose xlo := VEXTRACTI128 (W8u32.pack8 cs) W8.zero.
pose xhi := VEXTRACTI128 (W8u32.pack8 cs) W8.one.
pose l_lo := W4u32.Pack.to_list (W4u32.unpack32 (VPSHUFB_128 xlo
  (W16u8.pack16 (Array256.sub matrix_A__SHUFFLE_TABLE
     (to_uint ((g `&` W64.of_int 15) `<<` W8.of_int 4)) 16)))).
pose l_hi := W4u32.Pack.to_list (W4u32.unpack32 (VPSHUFB_128 xhi
  (W16u8.pack16 (Array256.sub matrix_A__SHUFFLE_TABLE
     (to_uint ((g `>>` W8.of_int 4) `<<` W8.of_int 4)) 16)))).
have hlo_take : take (count idfun (take 4 bits)) l_lo = filter accept (take 4 cs).
rewrite /l_lo hsl -{1}(int2bs_take4 bits szbits).
rewrite shuffle_compact //.
rewrite int2bs_take4 // /xlo extract_lo //.
by rewrite filter_mask' map_take -/bits.
have hhi_take : take (count idfun (drop 4 bits)) l_hi = filter accept (drop 4 cs).
rewrite /l_hi hsh -{1}(int2bs_drop4 bits szbits).
rewrite shuffle_compact //.
rewrite int2bs_drop4 // /xhi extract_hi //.
by rewrite filter_mask' map_drop -/bits.
have szl_lo : size l_lo = 4 by rewrite /l_lo W4u32.Pack.size_to_list.
have szl_hi : size l_hi = 4 by rewrite /l_hi W4u32.Pack.size_to_list.
have cnt_take_map : forall (f : W32.t -> bool) n (s : W32.t list),
  count idfun (take n (map f s)) = count f (take n s).
- move=> f n s; rewrite -map_take count_map.
  by apply eq_count => x @/preim @/idfun.
have cnt_drop_map : forall (f : W32.t -> bool) n (s : W32.t list),
  count idfun (drop n (map f s)) = count f (drop n s).
- move=> f n s; rewrite -map_drop count_map.
  by apply eq_count => x @/preim @/idfun.
have szflo : size (filter accept (take 4 cs)) = count idfun (take 4 bits).
- by rewrite size_filter /bits cnt_take_map.
have szfhi : size (filter accept (drop 4 cs)) = count idfun (drop 4 bits).
- by rewrite size_filter /bits cnt_drop_map.
have hag1 : agree (XArray256.PAE.replace_ polynomial{hr} (size old) l_lo) 0
  (old ++ filter accept (take 4 cs)).
rewrite -hlo_take; apply agree_replace => //.
by smt(count_ge0).
have hag2 : agree (XArray256.PAE.replace_ (XArray256.PAE.replace_ polynomial{hr} (size old) l_lo)
    (size (old ++ filter accept (take 4 cs))) l_hi) 0
  ((old ++ filter accept (take 4 cs)) ++ filter accept (drop 4 cs)).
rewrite -hhi_take; apply agree_replace => //.
by smt(count_ge0).
have hrej : reject (Array848.sub randombytes{hr} 0 (to_uint input_offset{hr} + 24))
          = (old ++ filter accept (take 4 cs)) ++ filter accept (drop 4 cs).
rewrite (sub_cat _ 0 (to_uint input_offset{hr}) 24); 1,2: smt(W64.to_uint_cmp).
rewrite reject_cat.
- rewrite size_sub; 1: smt(W64.to_uint_cmp).
  by move: hdvd => /dvdzP [q ->]; apply/dvdzP; exists (8 * q); ring.
rewrite -catA /old /=; congr.
rewrite rejectE.
have -> : cands (Array848.sub randombytes{hr} (to_uint input_offset{hr}) 24) = cs by done.
by rewrite -{1}(cat_take_drop 4 cs) filter_cat.
have hoff24 : to_uint (input_offset{hr} + W64.of_int 24) = to_uint input_offset{hr} + 24.
- by rewrite W64.to_uintD_small of_uintK /= /#.
have hbf1 : to_uint (bytes_filled{hr} + ((POPCNT_64 (g `&` W64.of_int 15)).`6 `<<` W8.of_int 2))
          = to_uint bytes_filled{hr} + 4 * count idfun (take 4 bits).
- rewrite W64.to_uintD_small; 1: by rewrite hplo /=; smt(count_ge0).
  by rewrite hplo.
have hbf2 : to_uint (bytes_filled{hr} + ((POPCNT_64 (g `&` W64.of_int 15)).`6 `<<` W8.of_int 2)
              + ((POPCNT_64 (g `>>` W8.of_int 4)).`6 `<<` W8.of_int 2))
          = to_uint bytes_filled{hr} + 4 * count idfun (take 4 bits)
              + 4 * count idfun (drop 4 bits).
- rewrite W64.to_uintD_small; 1: by rewrite hbf1 hphi /=; smt(count_ge0).
  by rewrite hbf1 hphi.
have hb1 : to_uint bytes_filled{hr} %/ 4 = size old by rewrite hsz /#.
have hb2 : to_uint (bytes_filled{hr} + ((POPCNT_64 (g `&` W64.of_int 15)).`6 `<<` W8.of_int 2)) %/ 4
         = size (old ++ filter accept (take 4 cs)).
- by rewrite hbf1 hsz size_cat szflo -mulrDr mulKz.
rewrite !uleE !of_uintK !hoff24 !hbf2 !hb2 !hb1 !hrej /=.
split.
- move=> hge.
  split; 1: exact S_le.
  split; 1: exact off_le.
  split; 1: exact off_dvd.
  split; 1: by congr; rewrite (b2i_hi _ _ hge).
  split; 1: by rewrite hsz !size_cat szflo szfhi -/old; ring.
  exact hag2.
move=> hlt.
split.
- move=> hge2.
  split; 1: exact S_le.
  split; 1: exact off_le.
  split; 1: exact off_dvd.
  split; 1: by congr; rewrite (b2i_off _ _ hge2).
  split; 1: by rewrite hsz !size_cat szflo szfhi -/old; ring.
  exact hag2.
move=> hlt2.
split; 1: exact S_le.
split; 1: exact off_le.
split; 1: exact off_dvd.
split; 1: by congr; rewrite (b2i_lo _ _ hlt hlt2).
split; 1: by rewrite hsz !size_cat szflo szfhi -/old; ring.
exact hag2.

(* ==================================================================== *)
(* The scalar tail: candidate-per-candidate rejection sampling         *)
(* entry: filled switches from byte count to coefficient count       *)
(* (bytes_filled / 4) and the stop flag encodes the loop guard        *)
seq 4 : (
     randombytes = buf
  /\ sampled buf polynomial (to_uint filled) (to_uint input_offset)
  /\ stop_sampling = W64.of_int (b2i (!(to_uint filled < 256 /\ to_uint input_offset < 838)))
).
- by auto=> &hr |> hbf hio h992 hdvd hsz hag; rewrite /sampled !ultE !to_uint_shr2 !of_uintK /=; smt().

(* each iteration consumes one 3-byte candidate, preserving sampled  *)
while (
     randombytes = buf
  /\ sampled buf polynomial (to_uint filled) (to_uint input_offset)
  /\ stop_sampling = W64.of_int (b2i (!(to_uint filled < 256 /\ to_uint input_offset < 838)))
); last first.

(* loop exit: either the stream is consumed (offset = 840), or the   *)
(* polynomial is full (filled = 256) and the accepted prefix embeds   *)
(* into the full stream's reject                                      *)
- skip=> &hr |> hs0 f off p hs hstop.
  move: hs => @/sampled [#] hio hdvd hfle hsz hag.
  have hb : !(to_uint f < 256 /\ to_uint off < 838).
  - by apply of_int_b2i_eq1P; rewrite -hstop.
  case: (838 <= to_uint off) => hoff.
  - move: hsz hag; have -> : to_uint off = 840 by smt().
    by move=> hsz hag; split; [exact hag | smt()].
  have hf : to_uint f = 256 by smt().
  have -> : 840 = to_uint off + (840 - to_uint off) by ring.
  rewrite reject_block; 1,2: smt(W64.to_uint_cmp); 1: exact hdvd.
  rewrite size_cat; split; 1: by apply agree_full; [smt() | exact hag].
  smt(size_ge0).

(* one iteration; off0 names the current candidate's offset          *)
exlim input_offset => off0.

(* 1. load the 3-byte window at off0 into the masked candidate,      *)
(*    advancing the offset past it                                    *)
seq ^if : (
     randombytes = buf
  /\ sampled buf polynomial (to_uint filled) (to_uint off0)
  /\ to_uint filled < 256
  /\ to_uint off0 < 838
  /\ input_offset = off0 + W64.of_int 3
  /\ coeff = cand buf (to_uint off0)
).
- auto=> &hr |> hs hne; have {hne} [hf256 hoffb] :
    to_uint filled{hr} < 256 /\ to_uint input_offset{hr} < 838 by smt().
  by rewrite /cand !to_uintD_small ?of_uintK /= ~-1:/#.

(* 2. filter: the candidate joins the accepted prefix iff it is      *)
(*    below the field modulus, and filled counts the store            *)
seq > (^if) : (
     randombytes = buf
  /\ sampled buf polynomial (to_uint filled) (to_uint input_offset)
).
- if.
  (* accepted: stored at index filled, filled incremented *)
  - auto=> &hr |> hs hf256 hoffb; rewrite ultE of_uintK /= -acceptE => hacc.
    move: hs => @/sampled [#] hio hdvd hfle hsz hag.
    rewrite /sampled !to_uintD_small ?of_uintK /=; 1,2: smt(W64.to_uint_cmp).
    rewrite !reject_step ~-1:#smt:(W64.to_uint_cmp) hacc /= size_cat /=.
    do 4? (split; 1: smt()).
    by rewrite hsz; apply agree_set; [by move: hf256; rewrite hsz | exact hag].
  (* rejected: the filter drops the candidate, state unchanged *)
  auto=> &hr |> hs hf256 hoffb; rewrite ultE of_uintK /= => hacc.
  have {hacc} hacc : accept (cand randombytes{hr} (to_uint off0)) = false.
  - by rewrite acceptE; smt().
  move: hs => @/sampled [#] hio hdvd hfle hsz hag.
  rewrite /sampled !to_uintD_small ?of_uintK /=; 1: smt(W64.to_uint_cmp).
  rewrite !reject_step; 1,2: smt(W64.to_uint_cmp).
  rewrite hacc /= cats0.
  do 3? (split; 1: smt()); split; [exact hsz | exact hag].

(* 3. re-encode the stop flag from the new counters                  *)
by auto=> &hr |> hs; rewrite !uleE !of_uintK /= /#.
qed.

(* -------------------------------------------------------------------- *)
op Apoly (rho : rho) (rc : int * int) : wpoly.

(* -------------------------------------------------------------------- *)
op A_rc_of_index (i : int) =
  (i %/ 5, i %% 5).

(* -------------------------------------------------------------------- *)
op poly_index_in_A (rc : int * int) : int =
  (5 * rc.`1 + rc.`2) * 256.

(* -------------------------------------------------------------------- *)
op poly_of_A (A : A) (rc : int * int) =
  Array256.of_list W32.zero (Array7680.sub A (poly_index_in_A rc) 256).

(* -------------------------------------------------------------------- *)
op A_valid_up_to (rho : rho) (A : A) (i : int) =
  forall k, 0 <= k < i =>
    poly_of_A A (A_rc_of_index k) = Apoly rho (A_rc_of_index k).

(* -------------------------------------------------------------------- *)
op A_ds (rc : int * int) : W16.t =
  W2u8.pack2 [W8.of_int rc.`2; W8.of_int rc.`1].

(* -------------------------------------------------------------------- *)
hint simplify mkseqSr_minus, mkseq0.
hint simplify range_geq, range_ltn.

(* -------------------------------------------------------------------- *)
op update_poly (a : A) (base : int) (p : W32.t Array256.t) =
  replace_ a (256 * base) (to_list p).

(* -------------------------------------------------------------------- *)
op update_polys (a : A) (base : int) (ps : W32.t Array256.t list) =
  foldl (fun a (ip : _ * _) =>
    update_poly a (base + ip.`1) ip.`2
  ) a (zip (range 0 (size ps)) ps).

(* -------------------------------------------------------------------- *)
lemma update_polys_A_valid_up_to (rho : rho) (a : A) (base : int) (tp : wpoly list) :
     A_valid_up_to rho a base
  => (forall i, 0 <= i < size tp =>
        nth witness tp i = Apoly rho (A_rc_of_index (base + i)))
  => A_valid_up_to rho (update_polys a base tp) (base + size tp).
proof.

admitted.

(* -------------------------------------------------------------------- *)
lemma replace_256_7680E (a : W32.t Array7680.t) (base : int) (b : W32.t Array256.t) :
  Array7680.init                                               
    (fun (i : int) =>                                          
       if base * 256 <= i < base * 256 + 256 then
         b.[i - base * 256]
       else a.[i])
  = update_poly a base b.
proof. admitted.

(* -------------------------------------------------------------------- *)
op reject_ok (nonce : W8.t list) (sz : int) (p : wpoly) (filled : int) =
     agree p 0 (reject (shake128_slice nonce 0 sz))
  /\ filled = min 256 (size (reject (shake128_slice nonce 0 sz))).

(* -------------------------------------------------------------------- *)
lemma matrix_A____sample_4_polynomialsP
  (rho_ : rho) (rcs : (int * int) option list)
: hoare[
  M.matrix_A____sample_4_polynomials :
         rho = rho_
      /\ (forall i, 0 <= i < 4 =>
           domain_separators.[i] =
             odflt domain_separators.[i] (omap A_ds (ntho None rcs i)))
    ==>
         forall i, 0 <= i < 4 =>
           let resi = ntho witness [res.`1; res.`2; res.`3; res.`4] i in
           odflt true (omap (fun rc => resi = Apoly rho_ rc) (ntho None rcs i))
].
proof.
proc=> /=.
seq ^xof_state<- : #pre; first by auto.
pose stop fs := W32.of_int (b2i (!has (fun w => w \ult W64.of_int 256) fs)).
proc change [^stop_sampling<- .. ^stop_sampling<- & +1] : {
  stop_sampling <- stop [filled0; filled1; filled2; filled3];
}; first by auto=> &hr @/stop |> *.

exlim domain_separators => ds_.
proc change <1 : { rho<- rho_; domain_separators <- ds_; }; first by auto.
do 2! (cfold 1); wp -2; seq 0 : #{/~{rho}}pre; first by auto.
pose Ads i := odflt ds_.[i] (omap A_ds (nth None rcs i)).
pose nonce i := to_list rho_ ++ W2u8.to_list ds_.[i].
seq 0: (forall i, 0 <= i < 4 => ds_.[i] = Ads i).
- by auto=> &hr [#] ->> /#.
case@[ambient]: (forall i, 0 <= i < 4 => ds_.[i] = Ads i) => ?; last by exfalso.

(* Initial absorption *)
sp; seq 1 : (xof_state \sha3for Array4.init (mk_absorbed \o nonce)).
- ecall (matrix_A__shake128_absorb_34_4xP rho_ ds_) => /=.
  auto=> &hr |> rst; apply/sha3for_eqR/Array4.ext_eq=> i ?.
  by rewrite mapiE -1:initiE.

(* Squeeze first blocks *)
pose data := Array4.init nonce.
seq 1: (
     xof_state \sha3for Array4.init (mk_read (168 * 5) \o nonce)
  /\ (forall i, 0 <= i < 4 =>
        let b = ntho witness [buf0; buf1; buf2; buf3] i in
        Array848.sub b 0 840 = shake128_slice data.[i] 0 840)).
- ecall ->> (matrix_A____shake128_squeeze_multiple_blocks_4xP data) => /=.
  - move=> &hr |>; apply: sha3for_eqR.
    by apply: Array4.ext_eq; smt(Array4.mapiE Array4.initiE).
  auto=> |> &hr + ?; apply/sha3for_eqR/Array4.ext_eq.
  by move=> i rgi; rewrite mapiE // !initiE.

seq ^stop_sampling<- : (#{/~{buf0, buf1, buf2, buf3}}pre /\
  (forall i, 0 <= i < 4 =>
     let p = ntho witness [polynomial0; polynomial1; polynomial2; polynomial3] i in
     let f = ntho witness [filled0; filled1; filled2; filled3] i in
        reject_ok data.[i] 840 p (to_uint f))).
- hoare split; last by conseq |>.
  exlim buf0, buf1, buf2, buf3 => buf0_ buf1_ buf2_ buf3_. (* FIXME *)
  ecall ->> (matrix_A__rejection_sample_multiple_blocksP buf0_) => /= [|>|]; sp.
  seq 0 : (#{/~{filled}}pre /\ to_uint filled0 = min 256 (size (reject (sub buf0_ 0 840)))). (* FIXME *)
  - by auto.
  ecall ->> (matrix_A__rejection_sample_multiple_blocksP buf1_) => /= [|>|]; sp.
  seq 0 : (#{/~{filled}}pre /\ to_uint filled1 = min 256 (size (reject (sub buf1_ 0 840)))). (* FIXME *)
  - by auto.
  ecall ->> (matrix_A__rejection_sample_multiple_blocksP buf2_) => /= [|>|]; sp.
  seq 0 : (#{/~{filled}}pre /\ to_uint filled2 = min 256 (size (reject (sub buf2_ 0 840)))). (* FIXME *)
  - by auto.
  ecall ->> (matrix_A__rejection_sample_multiple_blocksP buf3_) => /= [|>|]; sp.
  seq 0 : (#{/~{filled}}pre /\ to_uint filled3 = min 256 (size (reject (sub buf3_ 0 840)))). (* FIXME *)
  - by auto.
  auto=> &hr |> 5? h 4? i ile ilt; have: 0 <= i < 4 by smt().
  move=> {ile ilt}; apply: allP_range i => /=.
  by rewrite /ntho /reject_ok /= -!h.

  while (exists (k : int), (
       xof_state \sha3for Array4.init (mk_read (168 * k) \o nonce)
    /\ (forall i, 0 <= i < 4 =>
          let p = ntho witness [polynomial0; polynomial1; polynomial2; polynomial3] i in
          let f = ntho witness [filled0; filled1; filled2; filled3] i in
          reject_ok data.[i] (168 * k) p (to_uint f))
    /\ (stop_sampling = stop [filled0; filled1; filled2; filled3])
  )); last first.
  - auto=> &hr |> *; split.
    - by exists 5 => /=.
    - move=> f0 f1 f2 f3 p0 p1 p2 p3 xf k ? h + i *.
      move=> @/stop /eq_sym {stop}; case _: (has _ _) => /=.
      - by move=> _ /(congr1 W32.to_uint); rewrite !of_uintK.
      rewrite !negb_or !ultE /= -!lezNgt => [#] 4?.
      case _: (ntho None rcs i) => //= rc Erc.
      have [] := h i //. admit.

  elim* => k.

  proc rewrite 3 injecta_848E.
  proc rewrite 4 injecta_848E.
  proc rewrite 5 injecta_848E.
  proc rewrite 6 injecta_848E.

  proc change [^stop_sampling<- .. ^stop_sampling<- & +1] : {
    stop_sampling <- stop [filled0; filled1; filled2; filled3];
  }; first by auto=> &hr @/stop |>.

admitted.

(* -------------------------------------------------------------------- *)
lemma sample____matrix_A_P (rho_ : rho) : hoare[M.sample____matrix_A :
  rho = rho_ ==> A_valid_up_to rho_ res 30
].
proof.
proc.
seq  4 : #pre  ; first by auto.
seq -2 : # post; last  by auto.
cfold 1; kill -1; [by auto | sp].

seq 1 : (rho = rho_ /\ A_valid_up_to rho matrix_A 28).
- while (#{/~{matrix_A, chunk}}pre
    /\ 0 <= chunk <= 7
    /\ A_valid_up_to rho matrix_A (4 * chunk)
  ); last by auto=> &hr |> /#.

  wp -1 => /=; cfold 1; kill -1; first by auto.
  seq 3 : (#pre
    /\ aux   = Apoly rho (A_rc_of_index (4 * chunk    ))
    /\ aux_0 = Apoly rho (A_rc_of_index (4 * chunk + 1))
    /\ aux_1 = Apoly rho (A_rc_of_index (4 * chunk + 2))
    /\ aux_2 = Apoly rho (A_rc_of_index (4 * chunk + 3))
  ); last first.
  - proc rewrite 1 replace_256_7680E.
    proc rewrite 2 replace_256_7680E.
    proc rewrite 3 replace_256_7680E.
    proc rewrite 4 replace_256_7680E.
    do 2! (hoare split; last by auto=> /#); auto=> &hr |> 4?.
    pose tp i := Apoly rho{hr} (A_rc_of_index (4 * chunk{hr} + i)).
    pose pa := update_polys matrix_A{hr} (4 * chunk{hr}) (mkseq tp 4).
    rewrite (_ : update_poly _ _ _ = pa); first done.
    rewrite mulrDr /= {2}(_ : 4 = size (mkseq tp 4)) //.
    by rewrite update_polys_A_valid_up_to //#.

  seq > ^while : (#pre /\
    (forall i, 0 <= i < 4 =>
       domain_separators.[i] = A_ds (A_rc_of_index (4 * chunk + i)))
  ).
  - hoare split; last by conseq=> |>.
    while (
         0 <= chunk <= 7
      /\ 0 <= lane <= 4
      /\ (forall i, 0 <= i < lane =>
            domain_separators.[i] = A_ds (A_rc_of_index (4 * chunk + i)))
    ); last by auto=> &hr |> /#.
    hoare split; last by auto=> |> /#.
    hoare split; last by auto=> |> /#.
    auto=> &hr |> 4? ih ? i * /=; pose ds := W16u16.truncateu16 _.
    have -> {ds}: ds = A_ds (A_rc_of_index (4 * chunk{hr} + lane{hr})).
    - rewrite /A_ds /A_rc_of_index /=; apply: W2u8.wordP.
      move=> k ?; have [#|] ->> /=: k = 0 \/ k = 1 by smt().
      - rewrite /ds truncateu16_256E /= w256_shift_wintE //.
        rewrite (bits8_256_le_shiftE _ 1 0) //=.
        by rewrite w256_ofint_bits8E.
      - rewrite /ds truncateu16_256E /= w256_shift_wintE //.
        rewrite (bits8_256_shiftE _ 1) //=.
        by rewrite !w256_ofint_bits8E /= [_ %/ 256]pdiv_small 1:/#.
    by case: (i < lane{hr}) => ?; rewrite get_set_if //#.

  exlim chunk => chunk_.
  call (matrix_A____sample_4_polynomialsP rho_
    (mkseq (fun i => Some (A_rc_of_index (4 * chunk_ + i))) 4)
  ).
  - auto=> &hr |> 4? dsE; split.
    - by apply/allP_range' => @/ntho /= /#.
    - by move=> _ r /allP_range @/ntho /=.

cfold 1; kill -1; first by auto.
seq > ^while : (#pre /\
  (forall i, 0 <= i < 2 =>
     domain_separators.[i] = A_ds (A_rc_of_index (28 + i)))
).
- hoare split; last by conseq |>.
  while (
       0 <= lane <= 2
    /\ (forall i, 0 <= i < lane =>
            domain_separators.[i] = A_ds (A_rc_of_index (28 + i)))
  ); last by auto=> &hr |> /#.
  - hoare split; last by auto=> |> /#.  
    auto=> &hr |> 2? ih ? i *; pose ds := W16u16.truncateu16 _.
    have -> {ds}: ds = A_ds (A_rc_of_index (28 + lane{hr})).
    - rewrite /A_ds /A_rc_of_index /=; apply: W2u8.wordP.
      move=> k ?; have [#|] ->> /=: k = 0 \/ k = 1 by smt().
      - rewrite /ds truncateu16_256E /= w256_shift_wintE //.
        rewrite (bits8_256_le_shiftE _ 1 0) //=.
        by rewrite w256_ofint_bits8E.
      - rewrite /ds truncateu16_256E /= w256_shift_wintE //.
        rewrite (bits8_256_shiftE _ 1) //=.
        by rewrite !w256_ofint_bits8E /= [_ %/ 256]pdiv_small 1:/#.
    by case: (i < lane{hr}) => ?; rewrite get_set_if //#.

seq 1: (#pre
  /\ aux   = Apoly rho (A_rc_of_index 28)
  /\ aux_0 = Apoly rho (A_rc_of_index 29)); last first.
- proc rewrite 1 (replace_256_7680E _ 28).
  proc rewrite 2 (replace_256_7680E _ 29).
  auto=> &hr |> 2?.
  pose tp i := Apoly rho{hr} (A_rc_of_index (28 + i)).
  pose pa := update_polys matrix_A{hr} 28 (mkseq tp 2).
  rewrite (_ : update_poly _ _ _ = pa); first by done.
  by rewrite (update_polys_A_valid_up_to _ _ 28) //#.

call (matrix_A____sample_4_polynomialsP rho_
  [Some (A_rc_of_index 28); Some (A_rc_of_index 29)]
).
auto=> &hr |> ? h; split.
- by apply/allP_range' => @/ntho /= /#.
- by move=> _ r /allP_range @/ntho.
qed.
