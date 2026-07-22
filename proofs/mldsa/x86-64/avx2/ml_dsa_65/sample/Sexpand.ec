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
