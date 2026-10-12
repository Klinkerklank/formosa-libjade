require import AllCore IntDiv List Distr DList DInterval PROM FMap BitEncoding.
from Jasmin require import JByte_array JWord.
require import Array256.

require import Parameters GFq Rq VecMat Conversion Serialization Symmetric Sampling.
import PolyLVec PolyKVec PolyMat.
import Round ZModQ Zq MLDSAParams.

require import MLDSA MLDSA_RO MLDSA_ROSep MLDSA_ROSep_Hop1 MLDSA_ROSep_Hop2 MLDSA_ROSep_Hop3.
require import MLDSA_ROSep_Hop4 MLDSA_ROSep_Hop5 MLDSA_ROSep_Hop6.
require DMap.

(*************** G7: the hidden samplers are replaced by distributions ****************)

(* Polynomials with coefficients uniform in [a, b], and vectors of them *)
op dpoly (a b : int) : poly distr = dmap (dlist (dmap (dinter a b) incoeff) n) (Array256.of_list witness).
op dpolyl (d : poly distr) : polylvec distr = dmap (dlist d lvec) (LArray.of_list witness).
op dpolyk (d : poly distr) : polykvec distr = dmap (dlist d kvec) (KArray.of_list witness).

(*************** Encoding round trips ****************)

lemma BitsToBytesK (y : bool list) : 8 %| size y => BytesToBits (BitsToBytes y) = y.
proof.
move=> h; rewrite /BytesToBits /BitsToBytes -map_comp; apply JWordList.map_chunkK => // l hl.
by rewrite /(\o) W8.bits2wK.
qed.

lemma BytesToBitsK (x : W8.t list) : BitsToBytes (BytesToBits x) = x.
proof.
rewrite /BitsToBytes /BytesToBits BitChunking.flattenK //.
+ by move=> b /mapP [w [_ ->]]; rewrite W8.size_w2bits.
rewrite -map_comp; apply (eq_from_nth witness); rewrite ?size_map // => i hi.
by rewrite (nth_map witness) // /(\o) W8.w2bitsK.
qed.

lemma BitPackK (p : poly) (a b : int) :
  0 < a + b => (forall i, 0 <= i < n => -a <= crepr p.[i] <= b) =>
  BitUnpack (BitPack p a b) a b = p.
proof.
move=> hab hp; rewrite /BitUnpack /BitPack /=.
have [_ hlt] := RealExp.ilogP 2 (a + b) _ _; 1,2: smt().
have hc : 0 < RealExp.ilog 2 (a + b) + 1 by smt(RealExp.ilog_ge0).
have hsz : forall x, x \in map (fun (wi : coeff) => IntegerToBits (b - crepr wi) (RealExp.ilog 2 (a + b) + 1))
                             (Array256.to_list p) =>
                     size x = RealExp.ilog 2 (a + b) + 1
  by move=> x /mapP [w [_ ->]]; rewrite /IntegerToBits BS2Int.size_int2bs /#.
rewrite BitsToBytesK.
+ by rewrite (size_flatten_ctt _ _ hsz) size_map Array256.size_to_list; apply dvdz_mull.
rewrite BitChunking.flattenK // -map_comp; apply Array256.ext_eq => i hi.
rewrite Array256.initiE //= (nth_map witness) ?Array256.size_to_list // /(\o) /= /BitsToInteger /IntegerToBits
        BS2Int.int2bsK; 1,2: smt(Array256.get_to_list).
by rewrite (_ : b - (b - crepr p.[i]) = crepr p.[i]) 1:/# creprK.
qed.

lemma BitUnpackK (v : W8.t list) (a b : int) :
  0 < a + b => 2 ^ (RealExp.ilog 2 (a + b) + 1) = a + b + 1 =>
  (q + 1) %/ 2 - q <= -a => b < (q + 1) %/ 2 =>
  8 * size v = n * (RealExp.ilog 2 (a + b) + 1) =>
  BitPack (BitUnpack v a b) a b = v.
proof.
move=> hab hpow hlo hhi hsz; rewrite /BitPack /BitUnpack /=.
have hc : 0 < RealExp.ilog 2 (a + b) + 1 by smt(RealExp.ilog_ge0).
pose cs := BitChunking.chunk (RealExp.ilog 2 (a + b) + 1) (BytesToBits v).
have hcs : size cs = n by rewrite /cs BitChunking.size_chunk // size_BytesToBits hsz mulzK 1:/#.
have -> : Array256.to_list (Array256.init (nth witness (map (fun (co : bool list) => incoeff (b - BitsToInteger co)) cs))) =
          map (fun (co : bool list) => incoeff (b - BitsToInteger co)) cs.
+ apply (eq_from_nth witness); 1: by rewrite Array256.size_to_list size_map hcs.
  by rewrite Array256.size_to_list => i hi; rewrite Array256.get_to_list Array256.initiE.
have hmap : forall co, co \in cs =>
              IntegerToBits (b - crepr (incoeff (b - BitsToInteger co))) (RealExp.ilog 2 (a + b) + 1) = co.
+ move=> co hco; have hs := BitChunking.in_chunk_size _ _ _ hc hco.
  rewrite /IntegerToBits /BitsToInteger incoeffK_centered; 1,2: smt(BS2Int.bs2int_ge0 BS2Int.bs2int_le2Xs).
  by rewrite (_ : b - (b - BS2Int.bs2int co) = BS2Int.bs2int co) 1:/# -hs BS2Int.bs2intK.
rewrite -map_comp (_ : map _ cs = cs).
+ apply (eq_from_nth witness); rewrite ?size_map // => i hi.
  have hi' : 0 <= i < size cs by rewrite /cs BitChunking.size_chunk //; smt(size_iota).
  by rewrite (nth_map witness) // /(\o) /=; apply hmap; exact mem_nth.
rewrite /cs BitChunking.chunkK ?BytesToBitsK //; rewrite size_BytesToBits hsz; apply dvdz_mull; apply dvdzz.
qed.

lemma size_BitPack (p : poly) (a b : int) :
  0 < a + b => size (BitPack p a b) = n * (RealExp.ilog 2 (a + b) + 1) %/ 8.
proof.
move=> hab; rewrite /BitPack /= size_BitsToBytes' (size_flatten_ctt (RealExp.ilog 2 (a + b) + 1)).
+ by move=> x /mapP [w [_ ->]]; rewrite /IntegerToBits BS2Int.size_int2bs; smt(RealExp.ilog_ge0).
by rewrite size_map Array256.size_to_list mulzC.
qed.

(*************** Uniform polynomials ****************)

lemma supp_dpoly (a b : int) (p : poly) :
  (q + 1) %/ 2 - q <= a => b < (q + 1) %/ 2 =>
  p \in dpoly a b <=> forall i, 0 <= i < n => a <= crepr p.[i] <= b.
proof.
move=> ha hb; rewrite /dpoly supp_dmap; split.
+ move=> [l [hl ->]] i hi; move: hl; rewrite supp_dlist // => -[hs /List.allP hall].
  rewrite Array256.get_of_list //.
  have /supp_dmap [x [/supp_dinter hx ->]] := hall (nth witness l i) (mem_nth witness l i _); 1: smt().
  by rewrite incoeffK_centered /#.
move=> h; exists (Array256.to_list p); split; last by rewrite Array256.to_listK.
rewrite supp_dlist // Array256.size_to_list /=; apply/List.allP => x /mkseqP [i [hi ->]].
by rewrite supp_dmap; exists (crepr p.[i]); rewrite supp_dinter creprK h.
qed.

lemma dpoly_uni (a b : int) : (q + 1) %/ 2 - q <= a => b < (q + 1) %/ 2 => is_uniform (dpoly a b).
proof.
move=> ha hb; rewrite /dpoly; apply dmap_uni_in_inj; last (apply dlist_uni; apply dmap_uni_in_inj; last by apply dinter_uni).
+ move=> x y hx hy hxy; move: hx hy; rewrite !supp_dlist // => -[hx _] [hy _].
  by rewrite -(Array256.of_listK witness x) // -(Array256.of_listK witness y) // hxy.
move=> x y /supp_dinter hx /supp_dinter hy hxy.
by rewrite -(incoeffK_centered x) 1,2:/# -(incoeffK_centered y) 1,2:/# hxy.
qed.

lemma dpoly_ll (a b : int) : a <= b => is_lossless (dpoly a b).
proof. move=> hab; rewrite /dpoly; apply dmap_ll; apply dlist_ll; apply dmap_ll; exact dinter_ll. qed.

lemma gamma1_E : gamma1 = 2 ^ 19 by have /= H := param_sets; smt().

lemma ilog_gamma1 : RealExp.ilog 2 (gamma1 - 1 + gamma1) + 1 = 20.
proof.
have -> // : RealExp.ilog 2 (gamma1 - 1 + gamma1) = 19.
by rewrite RealExp.ilog_eq // gamma1_E /=.
qed.

(* The ExpandMask encoding is a bijection onto [-gamma1 + 1, gamma1] *)
lemma dmap_BitUnpack_gamma1 :
  dmap (dlist W8.dword 640) (fun v => BitUnpack v (gamma1 - 1) gamma1) = dpoly (-gamma1 + 1) gamma1.
proof.
have hg := gamma1_E.
have hc := ilog_gamma1.
have hK : forall v, size v = 640 => BitPack (BitUnpack v (gamma1 - 1) gamma1) (gamma1 - 1) gamma1 = v
  by move=> v hv; apply BitUnpackK; rewrite ?hc ?hv ?hg //=.
have hu1 : is_uniform (dmap (dlist W8.dword 640) (fun v => BitUnpack v (gamma1 - 1) gamma1)).
+ apply dmap_uni_in_inj; last by apply dlist_uni; exact W8.dword_uni.
  move=> x y; rewrite !supp_dlist // => -[hx _] [hy _] /= hxy.
  by rewrite -(hK x hx) -(hK y hy) hxy.
have hs : support (dmap (dlist W8.dword 640) (fun v => BitUnpack v (gamma1 - 1) gamma1)) =
          support (dpoly (-gamma1 + 1) gamma1).
+ apply fun_ext => z; apply eq_iff.
  have hsupp := supp_dpoly (-gamma1 + 1) gamma1 z _ _; 1,2: by rewrite hg.
  rewrite hsupp; split.
  - rewrite supp_dmap => -[v [hv ->]] i hi /=; move: hv; rewrite supp_dlist // => -[hv _].
    have hn : 0 <= i < size (BytesToBits v) %/ 20 by rewrite size_BytesToBits hv.
    have hsz := BitChunking.size_nth_chunk witness (BytesToBits v) i 20 _ hn => //.
    rewrite /BitUnpack /= hc Array256.initiE //= (nth_map witness) /=; 1: by rewrite BitChunking.size_chunk.
    have hb0 := BS2Int.bs2int_ge0 (nth witness (BitChunking.chunk 20 (BytesToBits v)) i).
    have hb1 := BS2Int.bs2int_le2Xs (nth witness (BitChunking.chunk 20 (BytesToBits v)) i).
    rewrite hsz /= in hb1.
    have h19 : gamma1 = 524288 by rewrite hg.
    by rewrite /BitsToInteger incoeffK_centered; smt().
  move=> h; rewrite supp_dmap; exists (BitPack z (gamma1 - 1) gamma1); split.
  - rewrite supp_dlist // size_BitPack; 1: by rewrite hg.
    by rewrite hc /=; apply/List.allP => x _; exact W8.dword_fu.
  by rewrite /= BitPackK //; [by rewrite hg | smt()].
have hl1 : is_lossless (dmap (dlist W8.dword 640) (fun v => BitUnpack v (gamma1 - 1) gamma1))
  by apply dmap_ll; apply dlist_ll; exact W8.dword_ll.
have hu2 := dpoly_uni (-gamma1 + 1) gamma1 _ _; 1,2: by rewrite hg.
have hl2 := dpoly_ll (-gamma1 + 1) gamma1 _; 1: by rewrite hg.
by apply eq_distr => y; rewrite (mu1_uni_ll _ _ hu1 hl1) (mu1_uni_ll _ _ hu2 hl2) hs.
qed.

lemma dlist_flatten ['a] (d : 'a distr) (m k : int) :
  0 <= m => 0 <= k => dmap (dlist (dlist d m) k) flatten = dlist d (m * k).
proof.
move=> hm; elim: k => [| k hk ih]; 1: by rewrite !dlist0 // dmap_dunit flatten_nil.
rewrite dlistSr //= dmap_comp.
have -> : flatten \o (fun (xy : 'a list list * 'a list) => rcons xy.`1 xy.`2) =
          (fun (p : 'a list * 'a list) => p.`1 ++ p.`2) \o
          (fun (p : 'a list list * 'a list) => (flatten p.`1, p.`2)).
+ by apply fun_ext => p; rewrite /(\o) /= -cats1 flatten_cat flatten_seq1.
by rewrite -dmap_comp -dmap_dprodL ih mulzDr mulz1 -dlist_add //; smt().
qed.

(*************** y from fresh blocks ****************)

clone DList.Program as PB with
  type t <- W8.t list,
  op   d <- dblock.

clone DList.Program as PP with
  type t <- poly,
  op   d <- dpoly (-gamma1 + 1) gamma1.

(* ExpandMask on blocks sampled fresh *)
module FreshEM = {
  proc bytes() : W8.t list = {
    var j, b, bs;
    bs <- [];
    j <- 0;
    while (64 * j < n * (gamma1m1_bits + 1) %/ 8) {
      b <$ dblock;
      bs <- bs ++ b;
      j <- j + 1;
    }
    return take (n * (gamma1m1_bits + 1) %/ 8) bs;
  }

  proc poly() : poly = {
    var bs, v, si;
    bs <@ bytes();
    v <- BytesV.of_list bs;
    si <- BitUnpack (BytesV.to_list v) (gamma1 - 1) gamma1;
    return si;
  }

  proc sample() : polylvec = {
    var r, si;
    var s : polylvec;
    s <- witness;
    r <- 0;
    while (r < lvec) {
      si <@ poly();
      s <- s.[r <- si];
      r <- r + 1;
    }
    return s;
  }
}.

module SY = {
  proc bytes() : W8.t list = {
    var bs;
    bs <$ dlist W8.dword 640;
    return bs;
  }

  proc poly() : poly = {
    var si;
    si <$ dpoly (-gamma1 + 1) gamma1;
    return si;
  }

  proc sample() : polylvec = {
    var s;
    s <$ dpolyl (dpoly (-gamma1 + 1) gamma1);
    return s;
  }
}.

module EMB = {
  proc loop() : W8.t list = {
    var l;
    l <@ PB.LoopSnoc.sample(10);
    return flatten l;
  }

  proc vloop() : polylvec = {
    var l;
    l <@ PP.LoopSnoc.sample(lvec);
    return LArray.of_list witness l;
  }
}.

module EMV = {
  proc loop() : polylvec = {
    var r, si;
    var s : polylvec;
    s <- witness;
    r <- 0;
    while (r < lvec) {
      si <@ SY.poly();
      s <- s.[r <- si];
      r <- r + 1;
    }
    return s;
  }
}.

equiv bytes_loop : FreshEM.bytes ~ EMB.loop : true ==> ={res}.
proof.
proc; inline PB.LoopSnoc.sample; wp.
while (j{1} = i{2} /\ n{2} = 10 /\ bs{1} = flatten l0{2} /\ size bs{1} = 64 * j{1} /\ 0 <= j{1} <= 10).
+ auto => /> &2 hs h0 h10 _ hi b hb; rewrite flatten_cat flatten_seq1 size_cat hs.
  by move: hb; rewrite supp_dlist // => -[-> _] /#.
by auto => /> i l h1 h2 hs h3 h4; rewrite take_oversize // hs /#.
qed.

equiv loop_bytes : EMB.loop ~ SY.bytes : true ==> ={res}.
proof.
bypr (res{1}) (res{2}) => // &1 &2 a.
have -> : Pr[EMB.loop() @ &1 : res = a] = Pr[PB.Sample.sample(10) @ &1 : flatten res = a].
+ byequiv => //; proc*; inline EMB.loop; wp; call (: ={arg} ==> ={res}); 2: by auto.
  by symmetry; conseq PB.Sample_LoopSnoc_eq => /#.
have -> : Pr[PB.Sample.sample(10) @ &1 : flatten res = a] = mu (dlist dblock 10) (fun l => flatten l = a)
  by byphoare (: n = 10 ==> flatten res = a) => //; proc; rnd; auto.
have -> : Pr[SY.bytes() @ &2 : res = a] = mu1 (dlist W8.dword 640) a by byphoare => //; proc; rnd; auto.
by rewrite -(dlist_flatten W8.dword 64 10) // dmap1E /pred1 /(\o).
qed.

equiv bytes_dlist : FreshEM.bytes ~ SY.bytes : true ==> ={res}.
proof.
by transitivity EMB.loop (true ==> ={res}) (true ==> ={res}) => //; [exact bytes_loop | exact loop_bytes].
qed.

hoare sy_bytes_size : SY.bytes : true ==> size res = 640.
proof. by proc; auto => /> bs; rewrite supp_dlist. qed.

equiv poly_eq : FreshEM.poly ~ SY.poly : true ==> ={res}.
proof.
bypr (res{1}) (res{2}) => // &1 &2 a.
have -> : Pr[FreshEM.poly() @ &1 : res = a] = Pr[SY.bytes() @ &1 : BitUnpack res (gamma1 - 1) gamma1 = a].
+ byequiv => //; proc*; inline FreshEM.poly; wp.
  call (: true ==> ={res} /\ size res{2} = 640); 1: by conseq bytes_dlist _ sy_bytes_size.
  by auto => /> r hr; rewrite BytesV.of_listK ?hr.
have -> : Pr[SY.bytes() @ &1 : BitUnpack res (gamma1 - 1) gamma1 = a] =
          mu (dlist W8.dword 640) (fun bs => BitUnpack bs (gamma1 - 1) gamma1 = a)
  by byphoare => //; proc; rnd; auto.
have -> : Pr[SY.poly() @ &2 : res = a] = mu1 (dpoly (-gamma1 + 1) gamma1) a by byphoare => //; proc; rnd; auto.
by rewrite -dmap_BitUnpack_gamma1 dmap1E /pred1 /(\o).
qed.

equiv sample_emv : FreshEM.sample ~ EMV.loop : true ==> ={res}.
proof. proc; while (={r, s}); 2: by auto. by wp; call poly_eq; auto. qed.

equiv emv_snoc : EMV.loop ~ EMB.vloop : true ==> ={res}.
proof.
proc; inline PP.LoopSnoc.sample SY.poly; wp.
while (r{1} = i{2} /\ n{2} = lvec /\ size l0{2} = r{1} /\ 0 <= r{1} <= lvec /\
       forall k, 0 <= k < r{1} => s{1}.[k] = nth witness l0{2} k).
+ auto => /> &1 &2 h0 h1 hk hl x _; rewrite size_cat /=; split; 1: smt().
  by move=> k hk0 hk1; rewrite LArray.get_setE 1:/# nth_cat; smt().
auto => />; split; 1: smt(gt0_l).
by move=> s l h1 h2 h3 h4 hk; apply LArray.ext_eq => k hk'; rewrite LArray.get_of_list //; smt().
qed.

equiv vloop_sample : EMB.vloop ~ SY.sample : true ==> ={res}.
proof.
bypr (res{1}) (res{2}) => // &1 &2 a.
have -> : Pr[EMB.vloop() @ &1 : res = a] = Pr[PP.Sample.sample(lvec) @ &1 : LArray.of_list witness res = a].
+ byequiv => //; proc*; inline EMB.vloop; wp; call (: ={arg} ==> ={res}); 2: by auto.
  by symmetry; conseq PP.Sample_LoopSnoc_eq => /#.
have -> : Pr[PP.Sample.sample(lvec) @ &1 : LArray.of_list witness res = a] =
          mu (dlist (dpoly (-gamma1 + 1) gamma1) lvec) (fun l => LArray.of_list witness l = a)
  by byphoare (: n = lvec ==> LArray.of_list witness res = a) => //; proc; rnd; auto.
have -> : Pr[SY.sample() @ &2 : res = a] = mu1 (dpolyl (dpoly (-gamma1 + 1) gamma1)) a
  by byphoare => //; proc; rnd; auto.
by rewrite /dpolyl dmap1E /pred1 /(\o).
qed.

(* ExpandMask on fresh blocks is a uniform y *)
equiv freshem_sy : FreshEM.sample ~ SY.sample : true ==> ={res}.
proof.
transitivity EMV.loop (true ==> ={res}) (true ==> ={res}) => //; 1: exact sample_emv.
by transitivity EMB.vloop (true ==> ={res}) (true ==> ={res}) => //; [exact emv_snoc | exact vloop_sample].
qed.

(* y, keyed by rnd, mu and the iteration *)
clone FullRO as RO_y with
  type in_t  <- rnd_ * Bytes64.t * int,
  type out_t <- polylvec,
  op   dout  <- fun _ => dpolyl (dpoly (-gamma1 + 1) gamma1).

(* The signer of G6 with rho, s1, s2 and y sampled from their distributions *)
module MLDSA_RO_DS7(XA : DS5.POracle1, XC : DS5.POracle2, Htr : DS5.POracle3, Hmu : DS5.POracle4,
                    Hct : DS5.POracle5) = {
  proc keygen() : BytesPK.t * BytesSK.t = {
    var sk,rho,_A,s1,s2,t,t1,t0,pk,tr;
    RO_y.RO.init();
    rho <$ dxi;
    _A <@ ExpandA(XOFA_O(XA)).sample(rho);
    s1 <$ dpolyl (dpoly (-Eta) Eta);
    s2 <$ dpolyk (dpoly (-Eta) Eta);
    t <- invnttv (ntt_mulmxv _A (nttv s1)) + s2;
    (t1,t0) <- Power2Round t;
    pk <@ PkEncDec.pkEncode(rho,t1);
    tr <@ Htr.get(pk);
    sk <@ SkEncDec.skEncode(rho,cK,tr,s1,s2,t0);
    return (pk,sk);
  }

  proc sign(sk : BytesSK.t, m : W8.t list) : BytesSig.t option * Leakage list = {
     var coins,rho,_K,tr,s1,s2,t0,s1h,s2h,t0h,_A,mu,kappa,y,w,w1,ctl,ct,c,ch,cs1,
         cs2,z,r0,ct0,h,leakage,sigma,bz,bh,sl;
     var zh : (polylvec * polykvec) option;
     coins <$ drnd;
     ct <- witness;
     ctl <- witness;
     sigma <- witness;
     leakage <- [];
     (rho,_K,tr,s1,s2,t0) <@ SkEncDec.skDecode(sk);
     s1h <- nttv s1;
     s2h <- nttv s2;
     t0h <- nttv t0;
     _A <@ ExpandA(XOFA_O(XA)).sample(rho);
     mu <@ Hmu.get(tr, m);
     kappa <- 0;
     zh <- None;
     while (zh = None && ! (kappa_max <= kappa)) {
       y <@ RO_y.RO.get(coins, mu, kappa);
       w <- invnttv (ntt_mulmxv _A (nttv y));
       w1 <- polykvec_HighBits w;
       ct <@ Hct.get(mu, w1Encode w1);
       (c, sl) <@ SampleInBall_O(XC).sample(ct);
       ctl <- ((ct, c), sl);
       leakage <- leakage ++ [ RO ctl.`2] ;
       ch <- ntt c;
       cs1 <- invnttv (ntt_smul ch s1h);
       cs2 <- invnttv (ntt_smul ch s2h);
       z <- y + cs1;
       r0 <- polykvec_LowBits (w - cs2);
       bz <- infnorm_lt z (gamma1 - Beta) &&
                  infnorm_lt r0 (gamma2 - Beta);
       leakage <- leakage ++ [ CheckZ bz ];
       if (bz) {
          ct0 <- invnttv (ntt_smul ch t0h);
          h <- MakeHint (PolyKVec.zerov-ct0) (w - cs2 + ct0);
          bh <- infnorm_lt ct0 gamma2 && hammw h w_hint;
          leakage <- leakage ++ [ CheckH bh ];
          if (bh) { zh <- Some (z,h); }
       }
       kappa <- kappa + 1;
     }
     if (zh <> None) {
       sigma <@ SigEncDec.sigEncode(ct,(oget zh).`1,(oget zh).`2);
     }
     return (if zh = None then None else Some sigma, leakage);
  }

  proc verify = MLDSA_ROSep(XA, XC, Htr, Hmu, Hct).verify
}.

lemma dblock_take : dmap dblock (fun r => Bytes32.of_list (take 32 r)) = dxi.
proof.
rewrite /dblock (_ : 64 = 32 + 32) // dlist_add // dmap_comp /(\o) /=.
rewrite (eq_dmap_in _ _ (fun (p : W8.t list * W8.t list) => Bytes32.of_list p.`1)).
+ move=> [p1 p2] /supp_dprod /= [h1 _]; rewrite take_size_cat //; move: h1; rewrite supp_dlist //; case.
by rewrite dprod_marginalL (dlist_ll W8.dword 32 W8.dword_ll) dscalar1.
qed.

clone DMap.DMapSampling as DMS32 with
  type t1 <- W8.t list,
  type t2 <- Bytes32.t.

(*************** The y table ****************)

(* RO_y with fresh entries computed by ExpandMask on fresh blocks *)
module YT = {
  proc get(x : rnd_ * Bytes64.t * int) : polylvec = {
    var y;
    if (x \notin RO_y.RO.m) {
      y <@ FreshEM.sample();
      RO_y.RO.m.[x] <- y;
    }
    return oget RO_y.RO.m.[x];
  }
}.

equiv yt_ro : YT.get ~ RO_y.RO.get : ={x, RO_y.RO.m} ==> ={res, RO_y.RO.m}.
proof.
proc; if{1}.
+ rcondt{2} 2; 1: by auto.
  wp; outline{2} [1 .. 1] by { r <@ SY.sample(); }.
  by wp; call freshem_sy; auto.
rcondf{2} 2; 1: by auto.
auto => /> &2 _; rewrite /dpolyl; apply dmap_ll; apply dlist_ll; apply dpoly_ll.
by rewrite gamma1_E.
qed.

lemma IntegerToBytes2K (x : int) : 0 <= x < 65536 => BS2Int.bs2int (BytesToBits (IntegerToBytes x 2)) = x.
proof.
move=> hx; rewrite /IntegerToBytes /IntegerToBits take_oversize.
+ by rewrite size_BitsToBytes' BS2Int.size_int2bs.
by rewrite BitsToBytesK ?BS2Int.size_int2bs // BS2Int.int2bsK.
qed.

lemma size_IntegerToBytes2 (x : int) : size (IntegerToBytes x 2) = 2.
proof. by rewrite /IntegerToBytes /IntegerToBits take_oversize size_BitsToBytes' BS2Int.size_int2bs. qed.

(* The RO_v key of block j of polynomial r of y: K || rnd || mu || nonce *)
op ekey (k0 : Bytes32.t) (c : rnd_) (mu : Bytes64.t) (i : int) : W8.t list =
  (Bytes32.to_list k0 ++ rnd_to_list c ++ Bytes64.to_list mu) ++ IntegerToBytes i 2.

op yblocks (m : (W8.t list * int, W8.t list) fmap) (x : W8.t list) : W8.t list =
  take (n * (gamma1m1_bits + 1) %/ 8) (flatten (map (fun j => oget m.[(x, j)]) (iota_ 0 10))).

op yval (m : (W8.t list * int, W8.t list) fmap) (k0 : Bytes32.t) (c : rnd_) (mu : Bytes64.t) (k : int) : polylvec =
  LArray.init (fun r => BitUnpack (BytesV.to_list (BytesV.of_list (yblocks m (ekey k0 c mu (k * lvec + r)))))
                                  (gamma1 - 1) gamma1).

op gp (m : (W8.t list * int, W8.t list) fmap) (k0 : Bytes32.t) (c : rnd_) (mu : Bytes64.t) (k : int) : bool =
  forall r j, 0 <= r < lvec => 0 <= j < 10 => (ekey k0 c mu (k * lvec + r), j) \in m.

(* RO_v of G6 and RO_y of G7: RO_v holds complete groups of blocks, RO_y the y they give *)
op inv7 (k0 : Bytes32.t) (mv : (W8.t list * int, W8.t list) fmap) (my : (rnd_ * Bytes64.t * int, polylvec) fmap) =
     (forall c mu k, (c, mu, k) \in my <=> 0 <= k < kappa_max /\ gp mv k0 c mu k)
  /\ (forall c mu k, (c, mu, k) \in my => my.[(c, mu, k)] = Some (yval mv k0 c mu k))
  /\ (forall x, x \in mv =>
        exists c mu k r, 0 <= k < kappa_max /\ 0 <= r < lvec /\ 0 <= x.`2 < 10 /\
                         x.`1 = ekey k0 c mu (k * lvec + r) /\ gp mv k0 c mu k).

lemma ekey_inj k0 c1 mu1 i1 c2 mu2 i2 :
  0 <= i1 < 65536 => 0 <= i2 < 65536 =>
  ekey k0 c1 mu1 i1 = ekey k0 c2 mu2 i2 => c1 = c2 /\ mu1 = mu2 /\ i1 = i2.
proof.
rewrite /ekey /rnd_to_list => h1 h2.
rewrite eqseq_cat ?size_cat ?Bytes32.size_to_list ?Bytes64.size_to_list // => -[h12 hib].
move: h12; rewrite eqseq_cat ?Bytes32.size_to_list //=.
+ by rewrite !size_cat !Bytes32.size_to_list.
move=> [hkc hm]; move: hkc; rewrite eqseq_cat //= => hc.
split; 1: by apply Bytes32.to_list_inj.
split; 1: by apply Bytes64.to_list_inj.
by rewrite -(IntegerToBytes2K i1) // hib IntegerToBytes2K.
qed.

lemma nonce_rng (k r : int) : 0 <= k < kappa_max => 0 <= r < lvec => 0 <= k * lvec + r < 65536.
proof.
move=> hk hr; have hb := kappa_max_bnd; have hl := gt0_l.
have : (k + 1) * lvec <= kappa_max * lvec by apply StdOrder.IntOrder.ler_wpmul2r; smt().
smt().
qed.

lemma nonce_inj (k1 r1 k2 r2 : int) :
  0 <= r1 < lvec => 0 <= r2 < lvec => k1 * lvec + r1 = k2 * lvec + r2 => k1 = k2 /\ r1 = r2.
proof.
move=> hr1 hr2 he; have hl := gt0_l.
have hk : k1 = k2.
+ have h1 : (k1 * lvec + r1) %/ lvec = k1 by rewrite divzMDl 1:/# divz_small /#.
  have h2 : (k2 * lvec + r2) %/ lvec = k2 by rewrite divzMDl 1:/# divz_small /#.
  by rewrite -h1 -h2 he.
by rewrite hk; smt().
qed.

lemma yblocks_eq (m1 m2 : (W8.t list * int, W8.t list) fmap) (x : W8.t list) :
  (forall j, 0 <= j < 10 => m1.[(x, j)] = m2.[(x, j)]) => yblocks m1 x = yblocks m2 x.
proof.
move=> h; rewrite /yblocks; congr; congr; apply eq_in_map => j /mem_iota hj /=.
by rewrite h //; smt().
qed.

lemma ekey_r (k0 : Bytes32.t) c mu k r1 r2 :
  0 <= k < kappa_max => 0 <= r1 < lvec => 0 <= r2 < lvec =>
  ekey k0 c mu (k * lvec + r1) = ekey k0 c mu (k * lvec + r2) => r1 = r2.
proof. move=> hk h1 h2 /(ekey_inj _ _ _ _ _ _ _ (nonce_rng _ _ hk h1) (nonce_rng _ _ hk h2)) /#. qed.

equiv squeeze_fresh (x0 : W8.t list) (m0 : (W8.t list * int, W8.t list) fmap) :
  Squeeze(RO_v.RO).squeeze ~ FreshEM.bytes :
  x{1} = x0 /\ len{1} = n * (gamma1m1_bits + 1) %/ 8 /\ RO_v.RO.m{1} = m0 /\
  (forall j, 0 <= j < 10 => (x0, j) \notin m0)
  ==> ={res} /\ res{1} = yblocks RO_v.RO.m{1} x0 /\ (forall j, 0 <= j < 10 => (x0, j) \in RO_v.RO.m{1}) /\
      (forall (y : W8.t list * int), !(y.`1 = x0 /\ 0 <= y.`2 < 10) => RO_v.RO.m{1}.[y] = m0.[y]).
proof.
proc; inline RO_v.RO.get; wp.
while (={j} /\ r{1} = bs{2} /\ x{1} = x0 /\ len{1} = 640 /\ 0 <= j{1} <= 10 /\
       r{1} = flatten (map (fun j' => oget RO_v.RO.m{1}.[(x0, j')]) (iota_ 0 j{1})) /\
       (forall j', 0 <= j' < j{1} => (x0, j') \in RO_v.RO.m{1}) /\
       (forall j', j{1} <= j' < 10 => (x0, j') \notin RO_v.RO.m{1}) /\
       (forall (y : W8.t list * int), !(y.`1 = x0 /\ 0 <= y.`2 < j{1}) => RO_v.RO.m{1}.[y] = m0.[y])).
+ rcondt{1} 3; 1: by auto => /> /#.
  auto => /> &1 &2 h0 h10 hin hout hm hj b hb; rewrite get_set_sameE /=; do! split; 1,2: smt().
  + rewrite iotaSr // map_rcons -cats1 flatten_cat flatten_seq1 /= get_set_sameE /=; congr; congr.
    by apply eq_in_map => j' /mem_iota hj' /=; rewrite get_set_neqE /#.
  + by move=> j' h1 h2; rewrite mem_set /#.
  + by move=> j' h1 h2; rewrite mem_set /#.
  by move=> y hy; rewrite get_setE /#.
auto => /> _; split; 1: (split; [by rewrite iota0 // flatten_nil | smt()]).
move=> m j h1 _ h2 h3 hin hout hm; have ->> : j = 10 by smt().
split; 1: by rewrite /yblocks.
by split; smt().
qed.

phoare squeeze_present (x0 : W8.t list) (m0 : (W8.t list * int, W8.t list) fmap) :
  [Squeeze(RO_v.RO).squeeze :
   x = x0 /\ len = n * (gamma1m1_bits + 1) %/ 8 /\ RO_v.RO.m = m0 /\ (forall j, 0 <= j < 10 => (x0, j) \in m0)
   ==> res = yblocks m0 x0 /\ RO_v.RO.m = m0] = 1%r.
proof.
proc; inline RO_v.RO.get; wp.
while (x = x0 /\ len = 640 /\ RO_v.RO.m = m0 /\ 0 <= j <= 10 /\
       r = flatten (map (fun j' => oget m0.[(x0, j')]) (iota_ 0 j)) /\
       (forall j, 0 <= j < 10 => (x0, j) \in m0)) (10 - j).
+ move=> z; rcondf 3; 1: by auto => /> /#.
  auto => /> &hr h0 h10 hin hj; split; 1: by have := dlist_ll W8.dword 64 W8.dword_ll.
  by move=> _ b _ _; rewrite iotaSr // map_rcons -cats1 flatten_cat flatten_seq1 /=; smt().
auto => /> hin; split; 1: by rewrite iota0.
move=> j; split; 1: smt().
move=> h1 h2 h3; have ->> : j = 10 by smt().
by rewrite /yblocks.
qed.

equiv emask_fresh (k0 : Bytes32.t) (c0 : rnd_) (mu0 : Bytes64.t) (k : int)
                  (m0 : (W8.t list * int, W8.t list) fmap) :
  ExpandMask_L(RO_v.RO).sample ~ FreshEM.sample :
  kp{1} = Bytes32.to_list k0 ++ rnd_to_list c0 ++ Bytes64.to_list mu0 /\ mu{1} = k * lvec /\
  0 <= k < kappa_max /\ RO_v.RO.m{1} = m0 /\
  (forall r j, 0 <= r < lvec => 0 <= j < 10 => (ekey k0 c0 mu0 (k * lvec + r), j) \notin m0)
  ==> ={res} /\ res{1} = yval RO_v.RO.m{1} k0 c0 mu0 k /\ gp RO_v.RO.m{1} k0 c0 mu0 k /\
      (forall (y : W8.t list * int),
         !(exists r, 0 <= r < lvec /\ y.`1 = ekey k0 c0 mu0 (k * lvec + r) /\ 0 <= y.`2 < 10) =>
         RO_v.RO.m{1}.[y] = m0.[y]).
proof.
proc.
while (={r, s} /\ 0 <= r{1} <= lvec /\ kp{1} = Bytes32.to_list k0 ++ rnd_to_list c0 ++ Bytes64.to_list mu0 /\
       mu{1} = k * lvec /\ 0 <= k < kappa_max /\
       (forall r', 0 <= r' < r{1} =>
          s{1}.[r'] = BitUnpack (BytesV.to_list (BytesV.of_list (yblocks RO_v.RO.m{1} (ekey k0 c0 mu0 (k * lvec + r')))))
                                (gamma1 - 1) gamma1) /\
       (forall r' j, 0 <= r' < r{1} => 0 <= j < 10 => (ekey k0 c0 mu0 (k * lvec + r'), j) \in RO_v.RO.m{1}) /\
       (forall r' j, r{1} <= r' < lvec => 0 <= j < 10 =>
          (ekey k0 c0 mu0 (k * lvec + r'), j) \notin RO_v.RO.m{1}) /\
       (forall (y : W8.t list * int),
          !(exists r', 0 <= r' < r{1} /\ y.`1 = ekey k0 c0 mu0 (k * lvec + r') /\ 0 <= y.`2 < 10) =>
          RO_v.RO.m{1}.[y] = m0.[y])).
+ inline FreshEM.poly; wp.
  exlim RO_v.RO.m{1}, r{1} => mc rc.
  call (squeeze_fresh (ekey k0 c0 mu0 (k * lvec + rc)) mc).
  auto => /> &2 h0 h1 hk0 hk1 hs hin hout hm hr; split; 1: by move=> j hj0 hj1; apply hout => /#.
  move=> _ _ m hmin hmeq.
  have hne : forall r' j, 0 <= r' < lvec => r' <> rc =>
               m.[(ekey k0 c0 mu0 (k * lvec + r'), j)] = mc.[(ekey k0 c0 mu0 (k * lvec + r'), j)].
  + move=> r' j hr' hner; apply hmeq; apply/negP => -[he _]; apply hner.
    by apply (ekey_r k0 c0 mu0 k) => //#.
  do! split; 1,2: smt().
  + move=> r' h0' h1'; rewrite LArray.get_setE 1:/#; case: (r' = rc) => [->> // | hner].
    by rewrite hs 1:/#; congr; congr; congr; apply yblocks_eq => j hj; rewrite hne /#.
  + move=> r' j h0' h1' hj0 hj1; case: (r' = rc) => [->> | hner]; 1: by apply hmin.
    by rewrite domE hne 1,2:/# -domE; apply hin => /#.
  + by move=> r' j h0' h1' hj0 hj1; rewrite domE hne 1,2:/# -domE; apply hout => /#.
  move=> y hy; rewrite hmeq.
  + by apply/negP => -[hy1 hy2]; apply hy; exists rc => /#.
  by apply hm; apply/negP => -[r' [hr' [hy1 hy2]]]; apply hy; exists r' => /#.
auto => /> hk0 hk1 hf; split; 1: smt(gt0_l).
move=> m r s h1 _ h2 h3 hs hin hout hm; have ->> : r = lvec by smt().
split; 1: by apply LArray.ext_eq => r' hr'; rewrite /yval LArray.initiE //= hs.
split; 1: by move=> r' j hr' hj; apply hin.
by move=> y hy; apply hm.
qed.

phoare emask_present (k0 : Bytes32.t) (c0 : rnd_) (mu0 : Bytes64.t) (k : int)
                     (m0 : (W8.t list * int, W8.t list) fmap) :
  [ExpandMask_L(RO_v.RO).sample :
   kp = Bytes32.to_list k0 ++ rnd_to_list c0 ++ Bytes64.to_list mu0 /\ mu = k * lvec /\ RO_v.RO.m = m0 /\
   gp m0 k0 c0 mu0 k
   ==> res = yval m0 k0 c0 mu0 k /\ RO_v.RO.m = m0] = 1%r.
proof.
proc; while (0 <= r <= lvec /\ kp = Bytes32.to_list k0 ++ rnd_to_list c0 ++ Bytes64.to_list mu0 /\
             mu = k * lvec /\ RO_v.RO.m = m0 /\ gp m0 k0 c0 mu0 k /\
             forall r', 0 <= r' < r =>
               s.[r'] = BitUnpack (BytesV.to_list (BytesV.of_list (yblocks m0 (ekey k0 c0 mu0 (k * lvec + r')))))
                                  (gamma1 - 1) gamma1) (lvec - r).
+ move=> z; wp; exlim r => rc; call (squeeze_present (ekey k0 c0 mu0 (k * lvec + rc)) m0).
  auto => /> &hr h0 h1 hgp hs hr; split; 1: by move=> j hj0 hj1; apply hgp => /#.
  move=> _ _; do! split; 1,2,4: smt().
  by move=> r' h0' h1'; rewrite LArray.get_setE 1:/#; case: (r' = rc) => [->> // | hner]; rewrite hs /#.
auto => /> hgp; split; 1: smt(gt0_l).
move=> r s; split; 1: smt().
move=> h1 h2 h3 hs; have ->> : r = lvec by smt().
by apply LArray.ext_eq => r' hr'; rewrite /yval LArray.initiE //= hs.
qed.

lemma inv7_present k0 mv my c mu k :
  inv7 k0 mv my => (c, mu, k) \in my => gp mv k0 c mu k /\ my.[(c, mu, k)] = Some (yval mv k0 c mu k).
proof. move=> [ha [hb _]] h; have := ha c mu k; rewrite h /= => -[_ hgp]; by rewrite hgp hb. qed.

lemma inv7_fresh k0 mv my c mu k :
  inv7 k0 mv my => 0 <= k < kappa_max => (c, mu, k) \notin my =>
  forall r j, 0 <= r < lvec => 0 <= j < 10 => (ekey k0 c mu (k * lvec + r), j) \notin mv.
proof.
move=> [ha [hb hc]] hk hn r j hr hj; apply/negP => hin.
have [c' mu' k' r' [hk' [hr' [hj' [he hgp]]]]] := hc _ hin.
have he' : ekey k0 c mu (k * lvec + r) = ekey k0 c' mu' (k' * lvec + r') by exact he.
have [<<- [<<- hn']] := ekey_inj _ _ _ _ _ _ _ (nonce_rng _ _ hk hr) (nonce_rng _ _ hk' hr') he'.
have [<<- _] := nonce_inj k r k' r' hr hr' hn'.
by move: hn; rewrite ha hk hgp.
qed.

lemma inv7_add k0 mv mv' my c mu k :
  inv7 k0 mv my => 0 <= k < kappa_max => (c, mu, k) \notin my => gp mv' k0 c mu k =>
  (forall (z : W8.t list * int),
     !(exists r, 0 <= r < lvec /\ z.`1 = ekey k0 c mu (k * lvec + r) /\ 0 <= z.`2 < 10) => mv'.[z] = mv.[z]) =>
  inv7 k0 mv' my.[(c, mu, k) <- yval mv' k0 c mu k].
proof.
move=> [ha [hb hc]] hk hn hgp' hmv.
have hgrp : forall c' mu' k', 0 <= k' < kappa_max => (c', mu', k') <> (c, mu, k) =>
              forall r j, 0 <= r < lvec =>
                mv'.[(ekey k0 c' mu' (k' * lvec + r), j)] = mv.[(ekey k0 c' mu' (k' * lvec + r), j)].
+ move=> c' mu' k' hk' hne r j hr; apply hmv; apply/negP => -[r'' [hr'' [he _]]]; apply hne.
  have he' : ekey k0 c' mu' (k' * lvec + r) = ekey k0 c mu (k * lvec + r'') by exact he.
  have [<<- [<<- hn']] := ekey_inj _ _ _ _ _ _ _ (nonce_rng _ _ hk' hr) (nonce_rng _ _ hk hr'') he'.
  by have [<<- _] := nonce_inj k' r k r'' hr hr'' hn'.
have hgpeq : forall c' mu' k', 0 <= k' < kappa_max => (c', mu', k') <> (c, mu, k) =>
               gp mv' k0 c' mu' k' <=> gp mv k0 c' mu' k'.
+ move=> c' mu' k' hk' hne; rewrite /gp; split => h r j hr hj.
  + by rewrite domE -hgrp // -domE; apply h.
  by rewrite domE hgrp // -domE; apply h.
have hyeq : forall c' mu' k', 0 <= k' < kappa_max => (c', mu', k') <> (c, mu, k) =>
              yval mv' k0 c' mu' k' = yval mv k0 c' mu' k'.
+ move=> c' mu' k' hk' hne; rewrite /yval; apply LArray.ext_eq => r hr; rewrite !LArray.initiE //=.
  by congr; congr; congr; apply yblocks_eq => j hj; exact hgrp.
split.
+ move=> c' mu' k'; rewrite mem_set; case: (c' = c /\ mu' = mu /\ k' = k) => [[->> [->> ->>]] | hne] /=.
  + by rewrite hk hgp'.
  rewrite (_ : (c' = c /\ mu' = mu /\ k' = k) = false) 1:/# /= ha.
  by split => -[hk' h]; (split; 1: done); [rewrite hgpeq | rewrite -hgpeq].
split.
+ move=> c' mu' k'; rewrite mem_set get_setE; case: (c' = c /\ mu' = mu /\ k' = k) => [[->> [->> ->>]] // | hne].
  rewrite (_ : ((c', mu', k') = (c, mu, k)) = false) 1:/# /= => h.
  have hk' : 0 <= k' < kappa_max by move: (ha c' mu' k'); rewrite h /#.
  have hne' : (c', mu', k') <> (c, mu, k) by smt().
  by rewrite hb // hyeq.
move=> x; case: (exists r, 0 <= r < lvec /\ x.`1 = ekey k0 c mu (k * lvec + r) /\ 0 <= x.`2 < 10).
+ by move=> [r [hr [hx1 hx2]]] _; exists c mu k r.
move=> hnx; rewrite domE hmv // -domE => hx.
have [c' mu' k' r' [hk' [hr' [hx2 [hx1 hgp]]]]] := hc _ hx.
exists c' mu' k' r'; rewrite hk' hr' hx2 hx1 /=.
case: (c' = c /\ mu' = mu /\ k' = k) => [[->> [->> ->>]] | hne]; 1: by move: hn; rewrite ha hk hgp.
by rewrite hgpeq //; smt().
qed.

equiv emask7 (k0 : Bytes32.t) : ExpandMask_L(RO_v.RO).sample ~ YT.get :
  kp{1} = Bytes32.to_list k0 ++ rnd_to_list x{2}.`1 ++ Bytes64.to_list x{2}.`2 /\ mu{1} = x{2}.`3 * lvec /\
  0 <= x{2}.`3 < kappa_max /\ inv7 k0 RO_v.RO.m{1} RO_y.RO.m{2}
  ==> ={res} /\ inv7 k0 RO_v.RO.m{1} RO_y.RO.m{2}.
proof.
proc*; inline{2} YT.get.
exlim x{2}.`1, x{2}.`2, x{2}.`3, RO_v.RO.m{1}, RO_y.RO.m{2} => c0 mu0 kk mv my.
case: ((c0, mu0, kk) \in my).
+ rcondf{2} 2; 1: by auto => /> &2; smt().
  wp; call{1} (emask_present k0 c0 mu0 kk mv); auto => /> &2 hk0 hk1 ha hb hc hin; split; 1: smt().
  move=> _; have := hb _ _ _ hin; have -> : (x{2}.`1, x{2}.`2, x{2}.`3) = x{2} by smt().
  by move=> ->.
rcondt{2} 2; 1: by auto => /> &2; smt().
wp; call (emask_fresh k0 c0 mu0 kk mv); auto => /> &2 hk0 hk1 hinv hn hc hnin.
have hI : inv7 k0 mv my by rewrite /inv7; split; [exact hinv | split; [exact hn | exact hc]].
have hx : (x{2}.`1, x{2}.`2, x{2}.`3) = x{2} by smt().
split; 1: by move=> r0 j h0 h1 h2 h3; apply (inv7_fresh k0 mv my x{2}.`1 x{2}.`2 x{2}.`3) => //#.
move=> _ m hgp hm; rewrite get_set_sameE /=.
have := inv7_add k0 mv m my x{2}.`1 x{2}.`2 x{2}.`3 hI _ hnin hgp hm; 1: done.
by rewrite hx /inv7 => -[h1 [h2 h3]]; smt().
qed.

equiv emask_ro (k0 : Bytes32.t) : ExpandMask_L(RO_v.RO).sample ~ RO_y.RO.get :
  kp{1} = Bytes32.to_list k0 ++ rnd_to_list x{2}.`1 ++ Bytes64.to_list x{2}.`2 /\ mu{1} = x{2}.`3 * lvec /\
  0 <= x{2}.`3 < kappa_max /\ inv7 k0 RO_v.RO.m{1} RO_y.RO.m{2}
  ==> ={res} /\ inv7 k0 RO_v.RO.m{1} RO_y.RO.m{2}.
proof.
transitivity YT.get
  (kp{1} = Bytes32.to_list k0 ++ rnd_to_list x{2}.`1 ++ Bytes64.to_list x{2}.`2 /\ mu{1} = x{2}.`3 * lvec /\
   0 <= x{2}.`3 < kappa_max /\ inv7 k0 RO_v.RO.m{1} RO_y.RO.m{2}
   ==> ={res} /\ inv7 k0 RO_v.RO.m{1} RO_y.RO.m{2})
  (={x, RO_y.RO.m} ==> ={res, RO_y.RO.m}).
+ by move=> &1 &2 h; exists RO_y.RO.m{2} x{2}.
+ by move=> &1 &m &2 [-> h] [<- <-].
+ exact (emask7 k0).
exact yt_ro.
qed.

(*************** G6 and G7 ****************)

op k_of (s : BytesSK.t) : Bytes32.t = Bytes32.of_list (take 32 (drop 32 (BytesSK.to_list s))).

equiv skdec_k (s0 : BytesSK.t) : SkEncDec.skDecode ~ SkEncDec.skDecode :
  ={sk} /\ sk{1} = s0 ==> ={res} /\ res{1}.`2 = k_of s0.
proof.
proc*.
call{2} (skDecode_corr s0); call{1} (skDecode_corr s0).
skip => /> r2 h21 h22 h23 h24 h25 h26 r1 h11 h12 h13 h14 h15 h16.
have e1 : r1 = (r1.`1, r1.`2, r1.`3, r1.`4, r1.`5, r1.`6) by smt().
have e2 : r2 = (r2.`1, r2.`2, r2.`3, r2.`4, r2.`5, r2.`6) by smt().
by rewrite e1 e2 h11 h12 h13 h14 h15 h16 h21 h22 h23 h24 h25 h26 /k_of.
qed.

equiv sign67 (s0 : BytesSK.t) :
  MLDSA_RO_DS6(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO).sign ~
  MLDSA_RO_DS7(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO).sign :
  ={sk, m, glob DS5.RO1.RO, DS5.RO2.RO.m, DS5.RO4.RO.m, DS5.RO5.RO.m, glob XOFA_O} /\ sk{1} = s0 /\
  inv7 (k_of s0) RO_v.RO.m{1} RO_y.RO.m{2}
  ==> ={res, glob DS5.RO1.RO, DS5.RO2.RO.m, DS5.RO4.RO.m, DS5.RO5.RO.m, glob XOFA_O} /\
      inv7 (k_of s0) RO_v.RO.m{1} RO_y.RO.m{2}.
proof.
proc.
seq 12 11 : (={sk, m, coins, ct, ctl, sigma, leakage, s1h, s2h, t0h, _A, mu, glob DS5.RO1.RO, DS5.RO2.RO.m,
               DS5.RO4.RO.m, DS5.RO5.RO.m, glob XOFA_O} /\
             kp{1} = Bytes32.to_list (k_of s0) ++ rnd_to_list coins{1} ++ Bytes64.to_list mu{1} /\
             inv7 (k_of s0) RO_v.RO.m{1} RO_y.RO.m{2}).
+ wp; call (: ={DS5.RO4.RO.m}); 1: by sim.
  call (: ={glob DS5.RO1.RO, glob XOFA_O}); 1: by sim.
  wp; call (skdec_k s0); auto => />.
  by move=> &1 &2 _ _ _ c _ r -> mu.
seq 3 3 : (={zh, ct, sigma, leakage, glob DS5.RO1.RO, DS5.RO2.RO.m, DS5.RO4.RO.m, DS5.RO5.RO.m, glob XOFA_O} /\
           inv7 (k_of s0) RO_v.RO.m{1} RO_y.RO.m{2}).
+ while (={kappa, zh, ct, ctl, sigma, leakage, s1h, s2h, t0h, _A, mu, coins, glob DS5.RO1.RO, DS5.RO2.RO.m,
           DS5.RO4.RO.m, DS5.RO5.RO.m, glob XOFA_O} /\
         kp{1} = Bytes32.to_list (k_of s0) ++ rnd_to_list coins{1} ++ Bytes64.to_list mu{1} /\
         0 <= kappa{1} /\ inv7 (k_of s0) RO_v.RO.m{1} RO_y.RO.m{2}).
  - wp; call (: ={DS5.RO2.RO.m}); 1: by sim.
    call (: ={DS5.RO5.RO.m}); 1: by sim.
    by wp; call (emask_ro (k_of s0)); auto => /> /#.
  by auto => />.
by if => //; wp; call (: true); [by sim | auto].
qed.

equiv verify67 :
  MLDSA_RO_DS6(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO).verify ~
  MLDSA_RO_DS7(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO).verify :
  ={pk, m, sigma, glob DS5.RO1.RO, DS5.RO2.RO.m, DS5.RO3.RO.m, DS5.RO4.RO.m, DS5.RO5.RO.m, glob XOFA_O}
  ==> ={res}.
proof. by sim. qed.

module SS7 = {
  proc sample() : polylvec * polykvec = {
    var s1, s2;
    s1 <$ dpolyl (dpoly (-Eta) Eta);
    s2 <$ dpolyk (dpoly (-Eta) Eta);
    return (s1, s2);
  }
}.

(* ExpandS on a fresh oracle: s1 and s2 have coefficients uniform in [-Eta, Eta] *)
axiom expandS_fresh : equiv[ExpandS(XOFS_O(RO_S.RO)).sample ~ SS7.sample : RO_S.RO.m{1} = empty ==> ={res}].

module SR7 = {
  proc a() : Bytes32.t = {
    var r0, rho;
    r0 <$ dblock;
    rho <- Bytes32.of_list (take 32 r0);
    return rho;
  }

  proc b() : Bytes32.t = {
    var rho;
    rho <$ dxi;
    return rho;
  }
}.

equiv sr7 : SR7.a ~ SR7.b : true ==> ={res}.
proof.
proc; outline{1} [1 .. 2] by { rho <@ DMS32.S.map(dblock, fun r => Bytes32.of_list (take 32 r)); }.
transitivity{1} { rho <@ DMS32.S.sample(dblock, fun r => Bytes32.of_list (take 32 r)); }
  (true ==> ={rho}) (true ==> ={rho}) => //.
+ by symmetry; call DMS32.sample; auto.
inline *; auto => />.
by rewrite dblock_take.
qed.

lemma inv7_empty k0 : inv7 k0 empty empty.
proof.
rewrite /inv7 /gp; do! split; 2,3: smt(mem_empty).
move=> c mu k; rewrite mem_empty /=; apply/negP => -[_ h].
have := h 0 0 _ _; [smt(gt0_l) | done | by rewrite mem_empty].
qed.

equiv keygen67 :
  MLDSA_RO_DS6(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO).keygen ~
  MLDSA_RO_DS7(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO).keygen :
  ={glob DS5.RO1.RO, DS5.RO3.RO.m, glob XOFA_O}
  ==> ={res, glob DS5.RO1.RO, DS5.RO3.RO.m, glob XOFA_O} /\ inv7 (k_of res{1}.`2) RO_v.RO.m{1} RO_y.RO.m{2}.
proof.
proc.
outline{1} [3 .. 4] by { rho <@ SR7.a(); }.
outline{2} [2 .. 2] by { rho <@ SR7.b(); }.
outline{2} [4 .. 5] by { (s1, s2) <@ SS7.sample(); }.
call (: true); 1: by sim.
call (: ={DS5.RO3.RO.m}); 1: by sim.
wp; call (: true); 1: by sim.
wp; call expandS_fresh.
call (: ={glob DS5.RO1.RO, glob XOFA_O}); 1: by sim.
call sr7.
inline *; auto => /> s.
have [h1 [h2 h3]] := inv7_empty (k_of s).
by split; [smt() | split; [exact h2 | exact h3]].
qed.

section.

declare module A <: DS2.Adversary {
  -DS2.RO1.RO, -DS2.RO2.RO, -DS2.EUF_CMA, -XOFA_O, -XOFS_O, -MLDSA_RO_DS1, -RoutedH,
  -DS5.RO1.RO, -DS5.RO2.RO, -DS5.RO3.RO, -DS5.RO4.RO, -DS5.RO5.RO, -DS5.EUF_CMA, -RO_rest.RO,
  -RO_pad.RO, -RO_pad.FRO, -RO_seed.RO, -RO_S.RO, -RO_rhopp.RO, -RO_v.RO, -CountH, -CountS, -St5,
  -RO_lp.RO, -RO_lp.FRO, -St6, -St7, -Router, -RO_y.RO }.

lemma G6_G7 &m :
  Pr[DS5.EUF_CMA(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO, MLDSA_RO_DS6, Router(A)).main()
       @ &m : res] =
  Pr[DS5.EUF_CMA(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO, MLDSA_RO_DS7, Router(A)).main()
       @ &m : res].
proof.
byequiv (: ={glob A, glob XOFA_O} ==> ={res}) => //.
proc.
inline{1} DS5.EUF_CMA(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO, MLDSA_RO_DS6, Router(A)).A.forge.
inline{2} DS5.EUF_CMA(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO, MLDSA_RO_DS7, Router(A)).A.forge.
wp; call verify67.
wp; call (: ={RO_pad.RO.m, RO_rest.RO.m, DS5.RO1.RO.m, DS5.RO2.RO.m, DS5.RO3.RO.m, DS5.RO4.RO.m,
              DS5.RO5.RO.m, glob XOFA_O, Router.tr, DS5.EUF_CMA.qs, DS5.EUF_CMA.sk} /\
            inv7 (k_of DS5.EUF_CMA.sk{1}) RO_v.RO.m{1} RO_y.RO.m{2}).
+ by proc; exlim DS5.EUF_CMA.sk{1} => s0; call (sign67 s0); auto.
+ by proc; auto.
+ proc*; call (: ={RO_pad.RO.m, RO_rest.RO.m, DS5.RO2.RO.m, DS5.RO3.RO.m, DS5.RO4.RO.m, DS5.RO5.RO.m,
                   Router.tr}); 2: by auto.
  by inline *; sim.
call (: ={DS5.RO3.RO.m}); 1: by sim.
inline RO_rest.RO.init RO_pad.RO.init; wp.
call keygen67.
by inline *; auto => />.
qed.

(* Hop 7: rho, s1, s2 and y are sampled from their distributions *)
lemma hop7 (qH qS : int) &m : 0 <= qH => 0 <= qS =>
  (forall (H1 <: DS2.POracle1 {-A}) (H2 <: DS2.POracle2 {-A}) (O <: DS2.SOracle {-A}),
     islossless H1.get => islossless H2.get => islossless O.sign =>
     islossless A(H1, H2, O).forge) =>
  (forall (H <: DS2.POracle1 {-A, -CountH, -CountS}) (G <: DS2.POracle2 {-A, -CountH, -CountS})
          (O <: DS2.SOracle {-A, -CountH, -CountS}),
     hoare [A(CountH(H), G, CountS(O)).forge :
              CountH.c = 0 /\ CountS.c = 0 ==> CountH.c <= qH /\ CountS.c <= qS]) =>
  Pr[DS2.EUF_CMA(DS2.RO1.RO, DS2.RO2.RO, MLDSA_RO_DS1, A).main() @ &m : res] <=
  Pr[DS5.EUF_CMA(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO, MLDSA_RO_DS7, Router(A)).main()
       @ &m : res] +
  2%r * p512 + (qH + qS * (1 + kappa_max) + 2)%r * p512 +
  ((qS * (qS + qH + 1))%r * p512 + (3 * qH + qS + 4)%r * p256).
proof.
move=> hqH hqS A_ll A_count.
by rewrite -(G6_G7 &m); apply (hop6 A qH qS &m hqH hqS A_ll A_count).
qed.

end section.
