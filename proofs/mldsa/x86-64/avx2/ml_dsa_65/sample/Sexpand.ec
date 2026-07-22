(* -------------------------------------------------------------------- *)
require import AllCore CoreUtils List List_extra IntDiv BitEncoding.
import BS2Int.

(* -------------------------------------------------------------------- *)
from Jasmin require import JWord JModel_x86.
from JazzEC require import Ml_dsa_65_avx2.

require import Avx2red.
require import Errshuffle.
require import Prefixarray.
require import Sha3x4. import Shake256x4.
require import Array4 Array25 Array64 Array136 Array256 Array272 Array2048.
require import WArray272 WArray1024 WArray2048.

(* -------------------------------------------------------------------- *)
clone import Prefixarray.PrefixArray as PA_272_136 with
      op sizeB <- 136,
      op sizeS <- 272,
  theory AB    <- Array136,
  theory AS    <- Array272

  rename "'S" as "_272"
         "'B" as "_136"

  proof le_size by done.

(* -------------------------------------------------------------------- *)
type rho'  = W8.t Array64.t.
type wpoly = W32.t Array256.t.

(* -------------------------------------------------------------------- *)
(* the 2-block squeeze wrapper: each iteration squeezes one 136-byte    *)
(* block into every lane's next window of the 272-byte buffers          *)
lemma error_4x____shake256_squeeze_multiple_blocks_4xP (data : W8.t list Array4.t)
: hoare[
  M.error_4x____shake256_squeeze_multiple_blocks_4x :
      state \sha3for Array4.map (mk_absorbed) data
    ==>
         res.`1 \sha3for Array4.map (mk_read (136 * 2)) data
      /\ (forall i, 0 <= i < 4 =>
            let b = nth witness [res.`2; res.`3; res.`4; res.`5] i in
            Array272.sub b 0 272 = shake256_slice data.[i] 0 272)
  ].
proof.
proc.
sp.
while (0 <= i <= 2
    /\ state \sha3for Array4.map (mk_read (136 * i)) data
    /\ Array272.sub b0 0 (136 * i) = shake256_slice data.[0] 0 (136 * i)
    /\ Array272.sub b1 0 (136 * i) = shake256_slice data.[1] 0 (136 * i)
    /\ Array272.sub b2 0 (136 * i) = shake256_slice data.[2] 0 (136 * i)
    /\ Array272.sub b3 0 (136 * i) = shake256_slice data.[3] 0 (136 * i)).
- exlim i => i_.
  wp; ecall (shake256_squeezeblock4xP data i_).
  skip => &hr |> hi0 _ hst hs0 hs1 hs2 hs3 hlt r hres hblk /=.
  move: (hblk 0 _) (hblk 1 _) (hblk 2 _) (hblk 3 _) => //= hb0 hb1 hb2 hb3.
  do! split; 1,2: smt().
  - by rewrite sub_window_catE 1:/# hs0
       (shake256_slice_cat_block data.[0] i{hr} r.`2 hi0 hb0).
  - by rewrite sub_window_catE 1:/# hs1
       (shake256_slice_cat_block data.[1] i{hr} r.`3 hi0 hb1).
  - by rewrite sub_window_catE 1:/# hs2
       (shake256_slice_cat_block data.[2] i{hr} r.`4 hi0 hb2).
  by rewrite sub_window_catE 1:/# hs3
     (shake256_slice_cat_block data.[3] i{hr} r.`5 hi0 hb3).
(* entry: nothing is read yet; exit: the two windows cover 272 bytes *)
skip => &hr |> hst; split.
- by do! split; smt(size_shake256_slice size_eq0).
move=> b00 b10 b20 b30 i0 state0 hge2 hi0 hi2 hrel h0 h1 h2 h3.
have ->>: i0 = 2 by smt().
split; first by exact hrel.
move=> j hj0 hj4.
by have [->|[->|[->|->]]] /=: j = 0 \/ j = 1 \/ j = 2 \/ j = 3 by smt().
qed.

(* -------------------------------------------------------------------- *)
(* -------------------------------------------------------------------- *)
(* the abstract nibble-candidate stream: every byte yields TWO          *)
(* candidates, low nibble first; a candidate z is accepted when z < 9   *)
(* and then contributes the signed coefficient 4 - z                    *)

op saccept (z : W8.t) : bool = to_uint z < 9.

op scoeff (z : W8.t) : W32.t = W32.of_int 4 - zeroextu32 z.

op nibbles (b : W8.t) : W8.t list = [b `&` W8.of_int 15; b `>>>` 4].

op [opaque] scands (bs : W8.t list) : W8.t list = flatten (map nibbles bs).

(* -------------------------------------------------------------------- *)
lemma size_nibbles (b : W8.t) : size (nibbles b) = 2.
proof. by rewrite /nibbles. qed.

(* -------------------------------------------------------------------- *)
lemma scands_nil : scands [] = [].
proof. by rewrite /scands. qed.

hint simplify scands_nil.

lemma scands_cons (b : W8.t) (bs : W8.t list) :
  scands (b :: bs) = nibbles b ++ scands bs.
proof. by rewrite /scands /= flatten_cons. qed.

lemma scands_cat (xs ys : W8.t list) :
  scands (xs ++ ys) = scands xs ++ scands ys.
proof. by rewrite /scands map_cat flatten_cat. qed.

lemma size_scands (bs : W8.t list) : size (scands bs) = 2 * size bs.
proof.
elim: bs => [|b bs ih]; first by rewrite scands_nil.
by rewrite scands_cons size_cat size_nibbles ih /#.
qed.

(* -------------------------------------------------------------------- *)
op [opaque] sreject (bs : W8.t list) : W32.t list =
  map scoeff (filter saccept (scands bs)).

lemma srejectE (bs : W8.t list) :
  sreject bs = map scoeff (filter saccept (scands bs)).
proof. by rewrite /sreject. qed.

lemma sreject_nil : sreject [] = [].
proof. by rewrite srejectE /=. qed.

hint simplify sreject_nil.

(* no alignment premise: candidates never straddle a byte boundary *)
lemma sreject_cat (xs ys : W8.t list) :
  sreject (xs ++ ys) = sreject xs ++ sreject ys.
proof. by rewrite !srejectE scands_cat filter_cat map_cat. qed.

(* one byte = two candidates, low nibble first *)
lemma sreject1E (b : W8.t) :
  sreject [b]
  = (if saccept (b `&` W8.of_int 15)
     then [scoeff (b `&` W8.of_int 15)] else [])
    ++
    (if saccept (b `>>>` 4)
     then [scoeff (b `>>>` 4)] else []).
proof.
rewrite srejectE /scands /nibbles /= flatten_cons flatten_nil cats0 /=.
by case: (saccept (b `&` W8.of_int 15)); case: (saccept (b `>>>` 4)).
qed.

lemma sreject_cons (b : W8.t) (bs : W8.t list) :
  sreject (b :: bs) = sreject [b] ++ sreject bs.
proof. by rewrite -cat1s sreject_cat. qed.

lemma size_sreject_le (bs : W8.t list) :
  size (sreject bs) <= 2 * size bs.
proof.
rewrite srejectE size_map size_filter -size_scands.
by apply/count_size.
qed.

(* -------------------------------------------------------------------- *)
(* splitting the accepted stream at a byte offset of the buffer         *)
lemma sreject_block (a : W8.t Array272.t) (n m : int) :
  0 <= n => 0 <= m =>
  sreject (Array272.sub a 0 (n + m))
  = sreject (Array272.sub a 0 n) ++ sreject (Array272.sub a n m).
proof.
move=> hn hm; rewrite sub_cat_272 // (_ : 0 + n = n) 1:/#.
by rewrite sreject_cat.
qed.

(* -------------------------------------------------------------------- *)
(* the candidate stream of a 16-byte window, in decoded order           *)
lemma scands16E (b00 b01 b02 b03 b04 b05 b06 b07 b08 b09 b10 b11 b12 b13 b14 b15 : W8.t) :
  scands [b00; b01; b02; b03; b04; b05; b06; b07; b08; b09; b10; b11; b12; b13; b14; b15]
  = [b00 `&` W8.of_int 15; b00 `>>>` 4;
     b01 `&` W8.of_int 15; b01 `>>>` 4;
     b02 `&` W8.of_int 15; b02 `>>>` 4;
     b03 `&` W8.of_int 15; b03 `>>>` 4;
     b04 `&` W8.of_int 15; b04 `>>>` 4;
     b05 `&` W8.of_int 15; b05 `>>>` 4;
     b06 `&` W8.of_int 15; b06 `>>>` 4;
     b07 `&` W8.of_int 15; b07 `>>>` 4;
     b08 `&` W8.of_int 15; b08 `>>>` 4;
     b09 `&` W8.of_int 15; b09 `>>>` 4;
     b10 `&` W8.of_int 15; b10 `>>>` 4;
     b11 `&` W8.of_int 15; b11 `>>>` 4;
     b12 `&` W8.of_int 15; b12 `>>>` 4;
     b13 `&` W8.of_int 15; b13 `>>>` 4;
     b14 `&` W8.of_int 15; b14 `>>>` 4;
     b15 `&` W8.of_int 15; b15 `>>>` 4].
proof. by rewrite /scands /= /nibbles /=. qed.

(* -------------------------------------------------------------------- *)
(* SIMD decode: the 32 bytes of the result are the 32 nibble candidates *)
(* of the 16 input bytes, in stream order                               *)
lemma error_4x____bytestream_to_coefficientsP (bs_ : W128.t) :
  hoare[ M.error_4x____bytestream_to_coefficients :
    bytestream = bs_ ==> res = W32u8.pack32 (scands (W16u8.to_list bs_)) ].
proof.
proc; wp; skip => &hr |>.
by rewrite scands16E nibble_decodeE.
qed.

(* -------------------------------------------------------------------- *)
(* -------------------------------------------------------------------- *)
(* the coefficient byte of a candidate, as computed by VPSUB_32u8       *)
op cbyte (z : W8.t) : W8.t = W8.of_int 4 - z.

(* -------------------------------------------------------------------- *)
op [opaque] agree (p : wpoly) (base : int) (coeffs : W32.t list) =
  forall i,
       0 <= i < size coeffs
    => 0 <= i + base < 256
    => p.[base + i] = nth W32.zero coeffs i.

(* -------------------------------------------------------------------- *)
lemma agree_nil (p : wpoly) (base : int) : agree p base [].
proof. by rewrite /agree /= /#. qed.

hint simplify agree_nil.

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
(* writing eight dwords at the end of the agreed prefix extends the     *)
(* agreement by the first k of them                                     *)
lemma agree_fill8 (p : wpoly) (old : W32.t list) (w : W256.t) (k : int) :
  0 <= k <= 8 => size old <= 248 =>
  agree p 0 old =>
  agree (Array256.fill (fun i => w \bits32 (i - size old)) (size old) 8 p)
        0 (old ++ take k (W8u32.Pack.to_list (W8u32.unpack32 w))).
proof.
move=> rgk szold; rewrite /agree => hag i rgi rgibase.
rewrite Array256.filliE 1:/#.
move: rgi; rewrite size_cat size_take 1:/# W8u32.Pack.size_to_list => rgi.
rewrite nth_cat.
case: (i < size old) => hio; last first.
- rewrite ifT 1:/# nth_take 1,2:/#.
  rewrite W8u32.Pack.to_listE nth_mkseq 1:/# /=.
  by rewrite W8u32.get_unpack32 1:/#.
rewrite ifF 1:/#.
by have := hag i _ _ => //#.
qed.

(* -------------------------------------------------------------------- *)
(* the whole compact-sign-extend-store step for one 8-candidate group   *)
lemma sagree_store (p : wpoly) (old : W32.t list) (zs : W8.t list)
                   (x : W128.t) (h : W64.t) :
  take 8 (W16u8.to_list x) = map cbyte zs =>
  size zs = 8 =>
  (forall z, z \in zs => to_uint z < 16) =>
  to_uint h = bs2int (map saccept zs) =>
  size old <= 248 =>
  agree p 0 old =>
  agree (Array256.fill
           (fun i =>
              VPMOVSX_8u8_8u32 (truncateu64 (VPSHUFB_128 x
                (VMOV_64 (W8u8.pack8 (Array2048.sub eRROR_VECTOR_SHUFFLE_TABLE
                   (to_uint (h `<<` W8.of_int 3)) 8)))))
              \bits32 (i - size old))
           (size old) 8 p)
        0 (old ++ map scoeff (filter saccept zs)).
proof.
move=> hx szzs hnib hh szold hag.
have szbits : size (map saccept zs) = 8 by rewrite size_map.
have hm : 0 <= bs2int (map saccept zs) < 256.
- by rewrite bs2int_ge0 /=; have := bs2int_le2Xs (map saccept zs); rewrite szbits.
have hint2bs : int2bs 8 (bs2int (map saccept zs)) = map saccept zs.
- by have := bs2intK (map saccept zs); rewrite szbits.
have hcle : count idfun (map saccept zs) <= 8.
- by have := count_size idfun (map saccept zs); rewrite szbits.
have hVto : forall (w : W64.t),
  W8u32.Pack.to_list (W8u32.unpack32 (VPMOVSX_8u8_8u32 w))
  = map MOVSX_u32s8 (W8u8.to_list w).
- by move=> w; rewrite /VPMOVSX_8u8_8u32 /=.
pose Y := VPSHUFB_128 x
  (VMOV_64 (W8u8.pack8 (Array2048.sub eRROR_VECTOR_SHUFFLE_TABLE
     (to_uint (h `<<` W8.of_int 3)) 8))).
have heq : take (count idfun (map saccept zs))
             (map MOVSX_u32s8 (W8u8.to_list (truncateu64 Y)))
           = map scoeff (filter saccept zs).
- rewrite -map_take -{1}hint2bs /Y (shuffle_slot8 h (map saccept zs)) //.
  rewrite (shuffle_compact8 x (bs2int (map saccept zs))) //.
  rewrite hint2bs hx -map_mask filter_mask' -map_comp.
  apply eq_in_map => z hz /=.
  by rewrite /(\o) /scoeff /cbyte MOVSX_u32s8_subE 1:#smt:(mem_mask).
rewrite -heq -hVto.
by apply agree_fill8 => //; smt(count_ge0).
qed.

(* -------------------------------------------------------------------- *)
section.

hint simplify b2i0, b2i1.

(* --- acceptance bit of each nibble comparison byte --- *)
lemma msb_lo9E (b : W8.t) :
  W8.msb ((b `&` W8.of_int 15) - W8.of_int 9) = saccept (b `&` W8.of_int 15).
proof.
by rewrite msb_sub9E 1:to_uint_lonib_lt16 /saccept.
qed.

lemma msb_hi9E (b : W8.t) :
  W8.msb ((b `>>>` 4) - W8.of_int 9) = saccept (b `>>>` 4).
proof.
by rewrite msb_sub9E 1:to_uint_hinib_lt16 /saccept.
qed.

(* --- the 32-candidate acceptance mask of a 16-byte window --- *)
lemma movemask_scands16E (b00 b01 b02 b03 b04 b05 b06 b07 b08 b09 b10 b11 b12 b13 b14 b15 : W8.t) :
  to_uint (zeroextu64 (MOVEMASK_32u8 (VPSUB_32u8
    (W32u8.pack32 (scands [b00; b01; b02; b03; b04; b05; b06; b07; b08; b09; b10; b11; b12; b13; b14; b15]))
    (VPBROADCAST_32u8 (W8.of_int 9)))))
  = bs2int (map saccept (scands [b00; b01; b02; b03; b04; b05; b06; b07; b08; b09; b10; b11; b12; b13; b14; b15])).
proof.
rewrite scands16E.
rewrite VPBROADCAST_32u8_pack32E VPSUB_32u8E /=.
rewrite /MOVEMASK_32u8 /=.
rewrite ?W32u8.pack32bE // ?W32u8.Pack.get_of_list //=.
rewrite !msb_lo9E !msb_hi9E.
by rewrite to_uint_zeroextu64 W32.to_uintE bits2wK //=.
qed.

end section.

(* -------------------------------------------------------------------- *)
(* the write-out step as a proc spec: one 8-candidate group is          *)
(* compacted, sign-extended and stored; the mask window advances        *)

lemma WArray2048_get64E (a : W8.t Array2048.t) (base : int) :
  0 <= base <= 2040 =>
    WArray2048.get64_direct (WArray2048.init8 ("_.[_]" a)) base
  = W8u8.pack8 (Array2048.sub a base 8).
proof.
move=> rgb; rewrite get64E; congr; apply W8u8.Pack.ext_eq => j hj.
rewrite initiE //= get_of_list //.
rewrite /init8 WArray2048.initiE 1:/# /=.
by rewrite /sub nth_mkseq //=.
qed.

lemma error_4x____write_out_8_coefficientsP
  (p_ : wpoly) (old : W32.t list) (zs zs' : W8.t list)
  (bf_ go_ : W64.t) (cb_ : W128.t) :
hoare[ M.error_4x____write_out_8_coefficients :
     error = p_ /\ bytes_filled = bf_ /\ good_overall = go_
  /\ coefficient_block = cb_
  /\ take 8 (W16u8.to_list cb_) = map cbyte zs
  /\ size zs = 8
  /\ (forall z, z \in zs => to_uint z < 16)
  /\ to_uint go_ = bs2int (map saccept (zs ++ zs'))
  /\ size old <= 248
  /\ to_uint bf_ = 4 * size old
  /\ agree p_ 0 old
  ==>
     agree res.`1 0 (old ++ map scoeff (filter saccept zs))
  /\ to_uint res.`2 = 4 * size (old ++ map scoeff (filter saccept zs))
  /\ to_uint res.`3 = bs2int (map saccept zs') ].
proof.
proc.
wp; skip => &hr |> hcb szzs hnib hgo szold hbf hag.
have szmap : size (map saccept zs) = 8 by rewrite size_map szzs.
have hand : to_uint (good_overall{hr} `&` W64.of_int 255)
            = bs2int (map saccept zs).
- rewrite (and255_bs2int _ (map saccept (zs ++ zs'))) // map_cat.
  by rewrite (_ : 8 = size (map saccept zs)) 1:szmap // take_size_cat.
have hm : 0 <= bs2int (map saccept zs) < 256.
- by rewrite bs2int_ge0 /=; have := bs2int_le2Xs (map saccept zs); rewrite szmap.
have hidx : to_uint ((good_overall{hr} `&` W64.of_int 255) `<<` W8.of_int 3)
            = 8 * bs2int (map saccept zs).
- by apply (shuffle_slot8 _ (map saccept zs)).
do ! split.
- rewrite WArray2048_get64E 1:hidx 1:/#.
  rewrite wpoly_set256_alignedE 1,2:#smt:(size_ge0).
  rewrite (_ : to_uint bytes_filled{hr} %/ 4 = size old) 1:/#.
  rewrite -truncateu64_128E.
  by apply sagree_store.
- rewrite (popcnt_step8 _ _ (map saccept zs)) // 1:/#.
  rewrite size_cat size_map size_filter.
  rewrite (count_map saccept idfun) hbf /preim /idfun /=.
  by ring.
- rewrite (shr8_bs2int _ (map saccept (zs ++ zs'))) // map_cat.
  by rewrite (_ : 8 = size (map saccept zs)) 1:szmap // drop_size_cat.
qed.

(* ==================================================================== *)
(* The vectorized rejection loop with its integrated scalar tail        *)
(* ==================================================================== *)

lemma sub16E_272 (a : W8.t Array272.t) (k : int) :
  Array272.sub a k 16 = [a.[k]; a.[k + 1]; a.[k + 2]; a.[k + 3]; a.[k + 4]; a.[k + 5]; a.[k + 6]; a.[k + 7]; a.[k + 8]; a.[k + 9]; a.[k + 10]; a.[k + 11]; a.[k + 12]; a.[k + 13]; a.[k + 14]; a.[k + 15]].
proof. by rewrite /sub /mkseq -iotaredE /=. qed.

lemma sub4E_272 (a : W8.t Array272.t) (k : int) :
  Array272.sub a k 4 = [a.[k]; a.[k + 1]; a.[k + 2]; a.[k + 3]].
proof. by rewrite /sub /mkseq -iotaredE /=. qed.

lemma WArray272_get128E (a : W8.t Array272.t) (base : int) :
  0 <= base <= 256 =>
    WArray272.get128_direct (WArray272.init8 ("_.[_]" a)) base
  = W16u8.pack16 (Array272.sub a base 16).
proof.
move=> rgb; rewrite get128E; congr; apply W16u8.Pack.ext_eq => j hj.
rewrite initiE //= get_of_list //.
rewrite /init8 WArray272.initiE 1:/# /=.
by rewrite /sub nth_mkseq //=.
qed.

lemma scands_nib (bs : W8.t list) (z : W8.t) :
  z \in scands bs => to_uint z < 16.
proof.
rewrite /scands => /flattenP [l] [] /mapP [b] [_ ->].
rewrite /nibbles /= => -[->|->].
- exact to_uint_lonib_lt16.
- exact to_uint_hinib_lt16.
qed.

op svsampled (b : W8.t Array272.t) (p : wpoly) (bf off : int) =
     off <= 256
  /\ 4 %| off
  /\ bf <= 1020
  /\ bf = 4 * size (sreject (Array272.sub b 0 off))
  /\ agree p 0 (sreject (Array272.sub b 0 off)).

lemma sub1E_272 (a : W8.t Array272.t) (k : int) :
  Array272.sub a k 1 = [a.[k]].
proof. by rewrite /sub /mkseq -iotaredE /=. qed.

lemma sreject_step272 (a : W8.t Array272.t) (n : int) : 0 <= n =>
  sreject (Array272.sub a 0 (n + 1))
  = sreject (Array272.sub a 0 n)
    ++ ((if saccept (a.[n] `&` W8.of_int 15)
         then [scoeff (a.[n] `&` W8.of_int 15)] else [])
        ++
        (if saccept (a.[n] `>>>` 4)
         then [scoeff (a.[n] `>>>` 4)] else [])).
proof.
move=> hn; rewrite sreject_block // sub1E_272.
by rewrite sreject1E.
qed.

lemma zext_and15E (b : W8.t) :
  zeroextu32 b `&` W32.of_int 15 = zeroextu32 (b `&` W8.of_int 15).
proof.
rewrite !zext32_8E.
apply W32.wordP; apply/allP_range.
rewrite /range -iotaredE /=.
rewrite !W32.of_intwE /W32.int_bit /=.
by rewrite !W8.of_intwE /W8.int_bit /=.
qed.

lemma zext_shr4E (b : W8.t) :
  zeroextu32 b `>>` W8.of_int 4 = zeroextu32 (b `>>>` 4).
proof.
rewrite !zext32_8E /(`>>`) of_uintK /=.
apply W32.wordP; apply/allP_range.
rewrite /range -iotaredE /=.
by rewrite ?W32.get_out // ?W8.get_out //= ?orbF; rewrite !W8.get_to_uint /=.
qed.

op ssampled (b : W8.t Array272.t) (p : wpoly) (fl off : int) =
     off <= 272
  /\ fl <= 256
  /\ fl = min 256 (size (sreject (Array272.sub b 0 off)))
  /\ agree p 0 (sreject (Array272.sub b 0 off)).

lemma error_4x__rejection_sample_multiple_blocksP (buf : W8.t Array272.t)
: hoare[
  M.error_4x__rejection_sample_multiple_blocks :
      randombytes = buf
    ==>
         agree res.`1 0 (sreject (Array272.sub buf 0 272))
      /\ to_uint res.`2 = min 256 (size (sreject (Array272.sub buf 0 272)))
  ].
proof.
proc => /=.
seq 6 : (randombytes = buf
  /\ eta_0 = VPBROADCAST_32u8 (W8.of_int 4)
  /\ bound = VPBROADCAST_32u8 (W8.of_int 9)).
- by auto => &hr |>; rewrite !truncateu8_bcastE.
sp 3.
seq 1 : (
     randombytes = buf
  /\ to_uint bytes_filled <= 1020
  /\ to_uint xof_offset <= 256
  /\ 4 %| to_uint xof_offset
  /\ (to_uint bytes_filled < 992 => to_uint xof_offset = 256)
  /\ to_uint bytes_filled = 4 * size (sreject (Array272.sub buf 0 (to_uint xof_offset)))
  /\ agree error 0 (sreject (Array272.sub buf 0 (to_uint xof_offset)))
).
- while (
       randombytes = buf
    /\ eta_0 = VPBROADCAST_32u8 (W8.of_int 4)
    /\ bound = VPBROADCAST_32u8 (W8.of_int 9)
    /\ svsampled buf error (to_uint bytes_filled) (to_uint xof_offset)
    /\ (to_uint bytes_filled < 992 /\ to_uint xof_offset < 256 =>
          16 %| to_uint xof_offset)
    /\ stop_sampling = W64.of_int (b2i (!(
            to_uint bytes_filled < 992
         /\ to_uint xof_offset < 256)))
  ); last first.
  - by hoare split; auto=> &hr @/svsampled |> * /=; smt(of_int_b2i_eq1P).
  exlim xof_offset => off0.
  seq 2 : (
       randombytes = buf
    /\ eta_0 = VPBROADCAST_32u8 (W8.of_int 4)
    /\ bound = VPBROADCAST_32u8 (W8.of_int 9)
    /\ svsampled buf error (to_uint bytes_filled) (to_uint xof_offset)
    /\ to_uint bytes_filled < 992
    /\ to_uint off0 < 256
    /\ 16 %| to_uint off0
    /\ xof_offset = off0
    /\ stop_sampling = W64.of_int 0
    /\ coefficients
         = W32u8.pack32 (scands (Array272.sub buf (to_uint off0) 16))
  ).
  - ecall (error_4x____bytestream_to_coefficientsP
             (W16u8.pack16 (Array272.sub buf (to_uint off0) 16))).
    auto=> &hr |> hsv hlt hflag.
    have {hflag} [h992 h256] : to_uint bytes_filled{hr} < 992 /\ to_uint xof_offset{hr} < 256
      by smt(of_int_b2i_eq1P).
    by rewrite WArray272_get128E 1:#smt:(W64.to_uint_cmp) sub16E_272 /= /#.
  seq 5 : (
       randombytes = buf
    /\ eta_0 = VPBROADCAST_32u8 (W8.of_int 4)
    /\ bound = VPBROADCAST_32u8 (W8.of_int 9)
    /\ svsampled buf error (to_uint bytes_filled) (to_uint xof_offset)
    /\ to_uint bytes_filled < 992
    /\ to_uint off0 < 256
    /\ 16 %| to_uint off0
    /\ xof_offset = off0
    /\ stop_sampling = W64.of_int 0
    /\ to_uint good_overall
         = bs2int (map saccept (scands (Array272.sub buf (to_uint off0) 16)))
    /\ coefficients
         = W32u8.pack32 (map cbyte (scands (Array272.sub buf (to_uint off0) 16)))
    /\ coefficient_block = VEXTRACTI128 coefficients W8.zero
  ).
  - auto=> &hr |> hsv h992 h256 h16.
    by rewrite !sub16E_272 movemask_scands16E scands16E VPSUB_bcast4_pack32E /= /cbyte.
  exlim error => p0.
  exlim bytes_filled => bf0.
  exlim good_overall => go0.
  exlim coefficient_block => cb0.
  seq 2 : (
       randombytes = buf
    /\ eta_0 = VPBROADCAST_32u8 (W8.of_int 4)
    /\ bound = VPBROADCAST_32u8 (W8.of_int 9)
    /\ svsampled buf error (to_uint bytes_filled) (to_uint xof_offset)
    /\ xof_offset = off0 + W64.of_int 4
    /\ stop_sampling = W64.of_int 0
    /\ to_uint off0 < 256
    /\ 16 %| to_uint off0
    /\ to_uint good_overall
         = bs2int (map saccept (scands (Array272.sub buf (to_uint off0 + 4) 12)))
    /\ coefficients
         = W32u8.pack32 (map cbyte (scands (Array272.sub buf (to_uint off0) 16)))
    /\ coefficient_block = VEXTRACTI128 coefficients W8.zero
  ).
  - wp; ecall (error_4x____write_out_8_coefficientsP p0
        (sreject (Array272.sub buf 0 (to_uint off0)))
        (scands (Array272.sub buf (to_uint off0) 4))
        (scands (Array272.sub buf (to_uint off0 + 4) 12))
        bf0 go0 cb0).
    auto=> &hr |> hsv h992 h256 h16 hgo.
    move: hsv => @/svsampled [#] hoffle hdvd4 hbfle hsz hag.
    do ! split.
    - rewrite !sub4E_272 !sub16E_272 scands16E.
      by rewrite /scands /= /nibbles /= /cbyte /=.
    - by rewrite size_scands size_sub.
    - by move=> z /scands_nib.
    - move: hgo; rewrite (_ : 16 = 4 + 12) 1:// PA_272_136.sub_cat_272 // scands_cat => hgo.
      exact hgo.
    - by smt(size_ge0).
    - by smt().
    - exact hag.
    move=> _ _ _ _ _ _ _ result [# hragree hrsz hrgo].
    have hle8 : size (map scoeff (filter saccept
                  (scands (Array272.sub randombytes{hr} (to_uint xof_offset{hr}) 4)))) <= 8.
    - rewrite size_map size_filter.
      have := count_size saccept (scands (Array272.sub randombytes{hr} (to_uint xof_offset{hr}) 4)).
      by rewrite size_scands Array272.size_sub /#.
    have hoff4 : to_uint (xof_offset{hr} + W64.of_int 4) = to_uint xof_offset{hr} + 4.
    - rewrite to_uintD_small of_uintK /=.
      + by move: h256 => /#.
      by [].
    have hsplit : sreject (Array272.sub randombytes{hr} 0 (to_uint xof_offset{hr} + 4))
      = sreject (Array272.sub randombytes{hr} 0 (to_uint xof_offset{hr}))
        ++ map scoeff (filter saccept (scands (Array272.sub randombytes{hr} (to_uint xof_offset{hr}) 4))).
    - by rewrite sreject_block ~-1:#smt:(W64.to_uint_cmp) -srejectE.
    rewrite hoff4 hsplit.
    do ! split.
    - by smt().
    - by smt().
    - by smt(size_ge0 size_cat).
    - exact hrsz.
    - exact hragree.
  if; last first.
  - auto=> &hr |> hsv hlt h16 hgo hnl.
    rewrite !uleE ?ultE !of_uintK /= !to_uintD_small ?of_uintK /=.
    - by move: hlt => /#.
    move: hnl; rewrite ultE of_uintK /= => hnl.
    by smt().
  sp 1.
  exlim error => p1.
  exlim bytes_filled => bf1.
  exlim good_overall => go1.
  exlim coefficient_block => cb1.
  seq 2 : (
       randombytes = buf
    /\ eta_0 = VPBROADCAST_32u8 (W8.of_int 4)
    /\ bound = VPBROADCAST_32u8 (W8.of_int 9)
    /\ svsampled buf error (to_uint bytes_filled) (to_uint xof_offset)
    /\ xof_offset = off0 + W64.of_int 8
    /\ stop_sampling = W64.of_int 0
    /\ to_uint off0 < 256
    /\ 16 %| to_uint off0
    /\ to_uint good_overall
         = bs2int (map saccept (scands (Array272.sub buf (to_uint off0 + 8) 8)))
    /\ coefficients
         = W32u8.pack32 (map cbyte (scands (Array272.sub buf (to_uint off0) 16)))
  ).
  - wp; ecall (error_4x____write_out_8_coefficientsP p1
        (sreject (Array272.sub buf 0 (to_uint off0 + 4)))
        (scands (Array272.sub buf (to_uint off0 + 4) 4))
        (scands (Array272.sub buf (to_uint off0 + 8) 8))
        bf1 go1 cb1).
    auto=> &hr |> hsv h256o h16 hgo hlt992.
    have hoff4 : to_uint (off0 + W64.of_int 4) = to_uint off0 + 4.
    - rewrite to_uintD_small of_uintK /=.
      + by move: h256o => /#.
      by [].
    move: hsv; rewrite hoff4 => hsv.
    move: hlt992; rewrite ultE of_uintK /= => hlt992.
    move: hsv => @/svsampled [#] hoffle hdvd4 hbfle hsz hag.
    do ! split.
    - rewrite !sub4E_272 !sub16E_272 scands16E.
      rewrite /scands /= /nibbles /= /cbyte /=.
      by rewrite VEXTRACTI128_0_pack32E VPSRLDQ8_pack16E /=.
    - by rewrite size_scands size_sub.
    - by move=> z /scands_nib.
    - by move: hgo; rewrite (_ : 12 = 4 + 8) 1:// PA_272_136.sub_cat_272 //
                    scands_cat -!addzA /=.
    - by smt(size_ge0).
    - by smt().
    - exact hag.
    move=> _ _ _ _ _ _ _ result [# hragree hrsz hrgo].
    have hle8 : size (map scoeff (filter saccept
                  (scands (Array272.sub randombytes{hr} (to_uint off0 + 4) 4)))) <= 8.
    - rewrite size_map size_filter.
      have := count_size saccept (scands (Array272.sub randombytes{hr} (to_uint off0 + 4) 4)).
      by rewrite size_scands Array272.size_sub /#.
    have hoff8 : to_uint (off0 + W64.of_int 8) = to_uint off0 + 8.
    - rewrite to_uintD_small of_uintK /=.
      + by move: h256o => /#.
      by [].
    have hsplit : sreject (Array272.sub randombytes{hr} 0 (to_uint off0 + 8))
      = sreject (Array272.sub randombytes{hr} 0 (to_uint off0 + 4))
        ++ map scoeff (filter saccept (scands (Array272.sub randombytes{hr} (to_uint off0 + 4) 4))).
    - rewrite (_ : to_uint off0 + 8 = to_uint off0 + 4 + 4) 1:/#.
      by rewrite sreject_block ~-1:#smt:(W64.to_uint_cmp) -srejectE.
    rewrite hoff8 hsplit.
    do ! split.
    - by smt().
    - by smt().
    - by smt(size_ge0 size_cat).
    - exact hrsz.
    - exact hragree.
  if; last first.
  - auto=> &hr |> hsv h256o h16 hgo hnl.
    rewrite !uleE ?ultE !of_uintK /= !to_uintD_small ?of_uintK /=.
    - by move: h256o => /#.
    move: hnl; rewrite ultE of_uintK /= => hnl.
    by smt().
  sp 1.
  exlim error => p2.
  exlim bytes_filled => bf2.
  exlim good_overall => go2.
  exlim coefficient_block => cb2.
  seq 2 : (
       randombytes = buf
    /\ eta_0 = VPBROADCAST_32u8 (W8.of_int 4)
    /\ bound = VPBROADCAST_32u8 (W8.of_int 9)
    /\ svsampled buf error (to_uint bytes_filled) (to_uint xof_offset)
    /\ xof_offset = off0 + W64.of_int 12
    /\ stop_sampling = W64.of_int 0
    /\ to_uint off0 < 256
    /\ 16 %| to_uint off0
    /\ to_uint good_overall
         = bs2int (map saccept (scands (Array272.sub buf (to_uint off0 + 12) 4)))
    /\ coefficients
         = W32u8.pack32 (map cbyte (scands (Array272.sub buf (to_uint off0) 16)))
    /\ coefficient_block = VEXTRACTI128 coefficients W8.one
  ).
  - wp; ecall (error_4x____write_out_8_coefficientsP p2
        (sreject (Array272.sub buf 0 (to_uint off0 + 8)))
        (scands (Array272.sub buf (to_uint off0 + 8) 4))
        (scands (Array272.sub buf (to_uint off0 + 12) 4))
        bf2 go2 cb2).
    auto=> &hr |> hsv h256o h16 hgo hlt992.
    have hoff8 : to_uint (off0 + W64.of_int 8) = to_uint off0 + 8.
    - rewrite to_uintD_small of_uintK /=.
      + by move: h256o => /#.
      by [].
    move: hsv; rewrite hoff8 => hsv.
    move: hlt992; rewrite ultE of_uintK /= => hlt992.
    move: hsv => @/svsampled [#] hoffle hdvd4 hbfle hsz hag.
    do ! split.
    - rewrite !sub4E_272 !sub16E_272 scands16E.
      rewrite /scands /= /nibbles /= /cbyte /=.
      by rewrite VEXTRACTI128_1_pack32E /=.
    - by rewrite size_scands size_sub.
    - by move=> z /scands_nib.
    - by move: hgo; rewrite (_ : 8 = 4 + 4) 1:// PA_272_136.sub_cat_272 //
                    scands_cat -!addzA /=.
    - by smt(size_ge0).
    - by smt().
    - exact hag.
    move=> _ _ _ _ _ _ _ result [# hragree hrsz hrgo].
    have hle8 : size (map scoeff (filter saccept
                  (scands (Array272.sub randombytes{hr} (to_uint off0 + 8) 4)))) <= 8.
    - rewrite size_map size_filter.
      have := count_size saccept (scands (Array272.sub randombytes{hr} (to_uint off0 + 8) 4)).
      by rewrite size_scands Array272.size_sub /#.
    have hoff12 : to_uint (off0 + W64.of_int 12) = to_uint off0 + 12.
    - rewrite to_uintD_small of_uintK /=.
      + by move: h256o => /#.
      by [].
    have hsplit : sreject (Array272.sub randombytes{hr} 0 (to_uint off0 + 12))
      = sreject (Array272.sub randombytes{hr} 0 (to_uint off0 + 8))
        ++ map scoeff (filter saccept (scands (Array272.sub randombytes{hr} (to_uint off0 + 8) 4))).
    - rewrite (_ : to_uint off0 + 12 = to_uint off0 + 8 + 4) 1:/#.
      by rewrite sreject_block ~-1:#smt:(W64.to_uint_cmp) -srejectE.
    rewrite hoff12 hsplit.
    do ! split.
    - by smt().
    - by smt().
    - by smt(size_ge0 size_cat).
    - exact hrsz.
    - exact hragree.
  if; last first.
  - auto=> &hr |> hsv h256o h16 hgo hnl.
    rewrite !uleE ?ultE !of_uintK /= !to_uintD_small ?of_uintK /=.
    - by move: h256o => /#.
    move: hnl; rewrite ultE of_uintK /= => hnl.
    by smt().
  sp 1.
  exlim error => p3.
  exlim bytes_filled => bf3.
  exlim good_overall => go3.
  exlim coefficient_block => cb3.
  seq 2 : (
       randombytes = buf
    /\ eta_0 = VPBROADCAST_32u8 (W8.of_int 4)
    /\ bound = VPBROADCAST_32u8 (W8.of_int 9)
    /\ svsampled buf error (to_uint bytes_filled) (to_uint xof_offset)
    /\ xof_offset = off0 + W64.of_int 16
    /\ stop_sampling = W64.of_int 0
    /\ to_uint off0 < 256
    /\ 16 %| to_uint off0
  ).
  - wp; ecall (error_4x____write_out_8_coefficientsP p3
        (sreject (Array272.sub buf 0 (to_uint off0 + 12)))
        (scands (Array272.sub buf (to_uint off0 + 12) 4))
        (scands (Array272.sub buf (to_uint off0 + 16) 0))
        bf3 go3 cb3).
    auto=> &hr |> hsv h256o h16 hgo hlt992.
    have hoff12 : to_uint (off0 + W64.of_int 12) = to_uint off0 + 12.
    - rewrite to_uintD_small of_uintK /=.
      + by move: h256o => /#.
      by [].
    move: hsv; rewrite hoff12 => hsv.
    move: hlt992; rewrite ultE of_uintK /= => hlt992.
    move: hsv => @/svsampled [#] hoffle hdvd4 hbfle hsz hag.
    do ! split.
    - rewrite !sub4E_272 !sub16E_272 scands16E.
      rewrite /scands /= /nibbles /= /cbyte /=.
      by rewrite VEXTRACTI128_1_pack32E VPSRLDQ8_pack16E /=.
    - by rewrite size_scands size_sub.
    - by move=> z /scands_nib.
    - by move: hgo; rewrite /= ?cats0.
    - by smt(size_ge0).
    - by smt().
    - exact hag.
    move=> _ _ _ _ _ _ _ result [# hragree hrsz hrgo].
    have hle8 : size (map scoeff (filter saccept
                  (scands (Array272.sub randombytes{hr} (to_uint off0 + 12) 4)))) <= 8.
    - rewrite size_map size_filter.
      have := count_size saccept (scands (Array272.sub randombytes{hr} (to_uint off0 + 12) 4)).
      by rewrite size_scands Array272.size_sub /#.
    have hoff16 : to_uint (off0 + W64.of_int 16) = to_uint off0 + 16.
    - rewrite to_uintD_small of_uintK /=.
      + by move: h256o => /#.
      by [].
    have hsplit : sreject (Array272.sub randombytes{hr} 0 (to_uint off0 + 16))
      = sreject (Array272.sub randombytes{hr} 0 (to_uint off0 + 12))
        ++ map scoeff (filter saccept (scands (Array272.sub randombytes{hr} (to_uint off0 + 12) 4))).
    - rewrite (_ : to_uint off0 + 16 = to_uint off0 + 12 + 4) 1:/#.
      by rewrite sreject_block ~-1:#smt:(W64.to_uint_cmp) -srejectE.
    rewrite hoff16 hsplit.
    do ! split.
    - by smt().
    - by smt().
    - by smt(size_ge0 size_cat).
    - exact hrsz.
    - exact hragree.
  auto=> &hr |> hsv h256o h16.
  rewrite !uleE ?ultE !of_uintK /= !to_uintD_small ?of_uintK /=.
  - by move: h256o => /#.
  by smt(dvdzD dvdzz).
seq < ^while : (
     randombytes = buf
  /\ ssampled buf error (to_uint filled) (to_uint xof_offset)
  /\ stop_sampling = W64.of_int (b2i (!(
        to_uint xof_offset < 272 /\ to_uint filled < 256)))
).
- auto=> &hr |> hbfle hoffle hdvd himp hsz hag.
  rewrite /ssampled !ultE !to_uint_shr2 !of_uintK /=.
  by smt().
while (
     randombytes = buf
  /\ ssampled buf error (to_uint filled) (to_uint xof_offset)
  /\ stop_sampling = W64.of_int (b2i (!(
        to_uint xof_offset < 272 /\ to_uint filled < 256)))
); last first.
- skip=> &hr |> _ e0 f0 off0x hs hstop.
  have @/ssampled [#] hoffle hfle hsz hag := hs.
  have hb : !(to_uint off0x < 272 /\ to_uint f0 < 256).
  - by apply of_int_b2i_eq1P; rewrite -hstop.
  case: (272 <= to_uint off0x) => hoff.
  - move: hsz hag; have -> : to_uint off0x = 272 by smt().
    by move=> hsz hag; split; [exact hag | smt()].
  have hf : to_uint f0 = 256 by smt().
  have -> : 272 = to_uint off0x + (272 - to_uint off0x) by ring.
  rewrite sreject_block; 1,2: smt(W64.to_uint_cmp).
  rewrite size_cat; split; 1: by apply agree_full; [smt() | exact hag].
  by smt(size_ge0).
seq 2 : (
     randombytes = buf
  /\ ssampled randombytes error (to_uint filled) (to_uint xof_offset)
  /\ to_uint filled < 256
  /\ to_uint xof_offset < 272
  /\ stop_sampling = W64.of_int 0
  /\ coefficient = zeroextu32 (randombytes.[to_uint xof_offset] `&` W8.of_int 15)
).
- auto=> &hr |> hs hne.
  have [hf256 hoff272] : to_uint filled{hr} < 256 /\ to_uint xof_offset{hr} < 272
    by smt(of_int_b2i_eq1P).
  by rewrite zext_and15E /=; smt(of_int_b2i_eq1P).
seq > ^if : (
     randombytes = buf
  /\ to_uint xof_offset < 272
  /\ stop_sampling = W64.of_int 0
  /\ to_uint filled <= 256
  /\ to_uint filled
       = min 256 (size (sreject (Array272.sub randombytes 0 (to_uint xof_offset))
           ++ (if saccept (randombytes.[to_uint xof_offset] `&` W8.of_int 15)
               then [scoeff (randombytes.[to_uint xof_offset] `&` W8.of_int 15)] else [])))
  /\ agree error 0 (sreject (Array272.sub randombytes 0 (to_uint xof_offset))
           ++ (if saccept (randombytes.[to_uint xof_offset] `&` W8.of_int 15)
               then [scoeff (randombytes.[to_uint xof_offset] `&` W8.of_int 15)] else []))
).
- if.
  - auto=> &hr |> hs hf256 hoff272.
    move=> hacc; move: hacc; rewrite ultE of_uintK /= pmod_small.
    - by have /= := W8.to_uint_cmp (randombytes{hr}.[to_uint xof_offset{hr}] `&` W8.of_int 15); smt().
    move=> hacc.
    have @/ssampled [#] hoffle hfle hsz hag := hs.
    have hszeq : to_uint filled{hr}
      = size (sreject (Array272.sub randombytes{hr} 0 (to_uint xof_offset{hr}))) by smt().
    have -> : - (zeroextu32 (randombytes{hr}.[to_uint xof_offset{hr}] `&` W8.of_int 15) - W32.of_int 4) = scoeff (randombytes{hr}.[to_uint xof_offset{hr}] `&` W8.of_int 15).
    - by rewrite /scoeff; ring.
    have hsacc : saccept (randombytes{hr}.[to_uint xof_offset{hr}] `&` W8.of_int 15) by exact hacc.
    rewrite hsacc /=.
    rewrite !to_uintD_small ?of_uintK /=; 1: smt().
    do ! split; 1,2: smt(size_cat).
    rewrite hszeq; apply agree_set; 1: smt().
    exact hag.
  auto=> &hr |> hs hf256 hoff272.
  move=> hrej; move: hrej; rewrite ultE of_uintK /= pmod_small.
  - by have /= := W8.to_uint_cmp (randombytes{hr}.[to_uint xof_offset{hr}] `&` W8.of_int 15); smt().
  move=> hrej.
  have @/ssampled [#] hoffle hfle hsz hag := hs.
  rewrite ifF; 1: by rewrite /saccept /#.
  rewrite cats0.
  do ! split; 1,2: smt().
  exact hag.
seq > ^if : (
     randombytes = buf
  /\ to_uint xof_offset < 272
  /\ stop_sampling = W64.of_int 0
  /\ ssampled randombytes error (to_uint filled) (to_uint xof_offset + 1)
).
- if.
  - sp 2; if.
    - auto=> &hr |> hoff272 hfle hmin.
      move=> hag hfu hacc.
      move: hfu; rewrite ultE of_uintK /= => hf256.
      move: hacc; rewrite zext_shr4E ultE of_uintK /= pmod_small.
      + by have /= := W8.to_uint_cmp (randombytes{hr}.[to_uint xof_offset{hr}] `>>>` 4); smt().
      move=> hacc.
      have hsacc : saccept (randombytes{hr}.[to_uint xof_offset{hr}] `>>>` 4) by exact hacc.
      have -> : - (zeroextu32 (randombytes{hr}.[to_uint xof_offset{hr}] `>>>` 4) - W32.of_int 4)
                = scoeff (randombytes{hr}.[to_uint xof_offset{hr}] `>>>` 4).
      + by rewrite /scoeff; ring.
      rewrite /ssampled.
      rewrite sreject_step272; 1: smt(W64.to_uint_cmp).
      rewrite hsacc /= catA.
      have hszeq : to_uint filled{hr}
        = size (sreject (Array272.sub randombytes{hr} 0 (to_uint xof_offset{hr}))
                ++ (if saccept (randombytes{hr}.[to_uint xof_offset{hr}] `&` W8.of_int 15) then [scoeff (randombytes{hr}.[to_uint xof_offset{hr}] `&` W8.of_int 15)] else [])) by smt().
      rewrite !to_uintD_small ?of_uintK /=; 1: smt().
      do ! split; 1,2,3: smt(size_cat size_ge0).
      rewrite hszeq; apply agree_set; 1: smt(size_cat).
      exact hag.
    auto=> &hr |> hoff272 hfle hmin.
    move=> hag hfu hrej.
    move: hfu; rewrite ultE of_uintK /= => hf256.
    move: hrej; rewrite zext_shr4E ultE of_uintK /= pmod_small.
    + by have /= := W8.to_uint_cmp (randombytes{hr}.[to_uint xof_offset{hr}] `>>>` 4); smt().
    move=> hrej.
    have hsrej : saccept (randombytes{hr}.[to_uint xof_offset{hr}] `>>>` 4) = false by smt().
    rewrite /ssampled.
    rewrite sreject_step272; 1: smt(W64.to_uint_cmp).
    rewrite hsrej /= cats0.
    do ! split; 1,2,3: smt(size_cat size_ge0).
    exact hag.
  auto=> &hr |> hoff272 hfle hmin.
  move=> hag hnf.
  move: hnf; rewrite ultE of_uintK /= => hnf.
  have hf256 : to_uint filled{hr} = 256 by smt().
  rewrite /ssampled.
  rewrite sreject_step272; 1: smt(W64.to_uint_cmp).
  rewrite catA.
  do ! split; 1,2,3: smt(size_cat size_ge0).
  by apply agree_full; [smt(size_ge0) | exact hag].
auto=> &hr |> hoff272.
move=> hs.
have @/ssampled [#] hoffle hfle hsz hag := hs.
rewrite !uleE !of_uintK /= !to_uintD_small ?of_uintK /=; 1: smt().
by smt().
qed.
