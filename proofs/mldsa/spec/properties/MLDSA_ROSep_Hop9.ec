require import AllCore IntDiv List Distr DList DInterval PROM FMap BitEncoding.
from Jasmin require import JByte_array JWord.
require import Array256.

require import Parameters GFq Rq VecMat Conversion Serialization Symmetric Sampling.
import PolyLVec PolyKVec PolyMat.
import Round ZModQ Zq MLDSAParams.

require import MLDSA MLDSA_RO MLDSA_ROSep MLDSA_ROSep_Hop1 MLDSA_ROSep_Hop2 MLDSA_ROSep_Hop3.
require import MLDSA_ROSep_Hop4 MLDSA_ROSep_Hop5 MLDSA_ROSep_Hop6 MLDSA_ROSep_Hop7 MLDSA_ROSep_Hop8.

(*************** G9: the scheme computes without the NTT ****************)

(* NTT facts, pending the NTT formalization *)
axiom ntt_invntt (p : poly) : ntt (invntt p) = p.
axiom invntt_basemul (a b : poly) : invntt (basemul (ntt a) (ntt b)) = a &* b.
axiom invntt_add (a b : poly) : invntt (a &+ b) = invntt a &+ invntt b.

lemma invntt_zero : invntt poly_zero = poly_zero.
proof.
have hz : poly_zero &+ poly_zero = poly_zero
  by apply Array256.ext_eq => i hi; rewrite poly_addE // poly_zeroE //; smt(@Zq).
have h := invntt_add poly_zero poly_zero; rewrite hz in h.
apply Array256.ext_eq => i hi; rewrite poly_zeroE //.
have := congr1 (fun p : poly => p.[i]) _ _ h; rewrite /= poly_addE //.
smt(@Zq).
qed.

lemma invntt_neg (a : poly) : invntt ((&-) a) = (&-) (invntt a).
proof.
have hz : a &+ (&-) a = poly_zero
  by apply Array256.ext_eq => i hi; rewrite poly_addE // poly_negE // poly_zeroE //; smt(@Zq).
have h := invntt_add a ((&-) a); rewrite hz invntt_zero in h.
apply Array256.ext_eq => i hi; rewrite poly_negE //.
have := congr1 (fun p : poly => p.[i]) _ _ h; rewrite /= poly_addE // poly_zeroE //.
smt(@Zq).
qed.

op dotp (v1 v2 : polylvec) : poly = foldr (fun i a => v1.[i] &* v2.[i] &+ a) poly_zero (iota_ 0 lvec).
op mulmxv (m : polymat) (v : polylvec) : polykvec = KArray.init (fun i => dotp (row m i) v).
op smulvl (c : poly) (v : polylvec) : polylvec = LArray.map (fun p => p &* c) v.
op smulvk (c : poly) (v : polykvec) : polykvec = KArray.map (fun p => p &* c) v.

lemma invntt_foldr (v1 v2 : polylvec) (l : int list) :
  (forall i, i \in l => 0 <= i < lvec) =>
  invntt (foldr (fun i a => basemul v1.[i] (PolyLVec.nttv v2).[i] &+ a) poly_zero l) =
  foldr (fun i a => (PolyLVec.invnttv v1).[i] &* v2.[i] &+ a) poly_zero l.
proof.
elim: l => [_ | x l ih hl] /=; 1: exact invntt_zero.
rewrite invntt_add ih; 1: by move=> i hi; apply hl; rewrite in_cons hi.
have hx : 0 <= x < lvec by apply hl; rewrite in_cons.
congr; rewrite /PolyLVec.invnttv /PolyLVec.nttv !LArray.mapiE //.
by rewrite -{1}(ntt_invntt v1.[x]) invntt_basemul.
qed.

lemma invntt_dotp (v1 v2 : polylvec) :
  invntt (ntt_dotp v1 (PolyLVec.nttv v2)) = dotp (PolyLVec.invnttv v1) v2.
proof. by rewrite /ntt_dotp /dotp invntt_foldr //; smt(mem_iota). qed.

lemma invnttv_mulmxv (m : polymat) (v : polylvec) :
  PolyKVec.invnttv (ntt_mulmxv m (PolyLVec.nttv v)) = mulmxv (invnttm m) v.
proof.
apply KArray.ext_eq => i hi; rewrite /PolyKVec.invnttv /ntt_mulmxv /mulmxv KArray.mapiE // !KArray.initiE //=.
rewrite invntt_dotp; congr; apply LArray.ext_eq => j hj.
rewrite /row /PolyLVec.invnttv LArray.mapiE // !LArray.initiE //= /invnttm KLMatrix.mapiE //.
have : i * lvec + lvec <= kvec * lvec
  by rewrite -(mulzDl i 1); apply StdOrder.IntOrder.ler_wpmul2r; smt(gt0_l).
smt(gt0_l).
qed.

lemma invnttv_smull (c : poly) (v : polylvec) :
  PolyLVec.invnttv (PolyLVec.ntt_smul (ntt c) (PolyLVec.nttv v)) = smulvl c v.
proof.
apply LArray.ext_eq => i hi.
by rewrite /PolyLVec.invnttv /PolyLVec.ntt_smul /PolyLVec.nttv /smulvl !LArray.mapiE //= invntt_basemul.
qed.

lemma invnttv_smulk (c : poly) (v : polykvec) :
  PolyKVec.invnttv (PolyKVec.ntt_smul (ntt c) (PolyKVec.nttv v)) = smulvk c v.
proof.
apply KArray.ext_eq => i hi.
by rewrite /PolyKVec.invnttv /PolyKVec.ntt_smul /PolyKVec.nttv /smulvk !KArray.mapiE //= invntt_basemul.
qed.

lemma invnttv_sub (x y : polykvec) : PolyKVec.invnttv (x - y) = PolyKVec.invnttv x - PolyKVec.invnttv y.
proof.
apply KArray.ext_eq => i hi; rewrite (polykvec_sub_iE (PolyKVec.invnttv x)) // /PolyKVec.invnttv.
by rewrite !KArray.mapiE // polykvec_sub_iE // invntt_add invntt_neg.
qed.

module MLDSA_RO_DS9(XA : DS5.POracle1, XC : DS5.POracle2, Htr : DS5.POracle3, Hmu : DS5.POracle4,
                    Hct : DS5.POracle5) = {
  proc keygen() : BytesPK.t * (Bytes32.t * Bytes64.t * polylvec * polykvec * polykvec) = {
    var rho,_A,s1,s2,t,t1,t0,pk,tr;
    RO_y.RO.init();
    rho <$ dxi;
    _A <@ ExpandA(XOFA_O(XA)).sample(rho);
    s1 <$ dpolyl (dpoly (-Eta) Eta);
    s2 <$ dpolyk (dpoly (-Eta) Eta);
    t <- mulmxv (invnttm _A) s1 + s2;
    (t1,t0) <- Power2Round t;
    pk <@ PkEncDec.pkEncode(rho,t1);
    tr <@ Htr.get(pk);
    return (pk, (rho, tr, s1, s2, t0));
  }

  proc sign(sk : Bytes32.t * Bytes64.t * polylvec * polykvec * polykvec, m : W8.t list) :
    BytesSig.t option * Leakage list = {
     var coins,rho,tr,s1,s2,t0,_A,mu,kappa,y,w,w1,ctl,ct,c,cs1,cs2,z,r0,ct0,h,leakage,sigma,bz,bh,sl;
     var zh : (polylvec * polykvec) option;
     coins <$ drnd;
     ct <- witness;
     ctl <- witness;
     sigma <- witness;
     leakage <- [];
     (rho,tr,s1,s2,t0) <- sk;
     _A <@ ExpandA(XOFA_O(XA)).sample(rho);
     mu <@ Hmu.get(tr, m);
     kappa <- 0;
     zh <- None;
     while (zh = None && ! (kappa_max <= kappa)) {
       y <@ RO_y.RO.get(coins, mu, kappa);
       w <- mulmxv (invnttm _A) y;
       w1 <- polykvec_HighBits w;
       ct <@ Hct.get(mu, w1Encode w1);
       (c, sl) <@ SampleInBall_O(XC).sample(ct);
       ctl <- ((ct, c), sl);
       leakage <- leakage ++ [ RO ctl.`2] ;
       cs1 <- smulvl c s1;
       cs2 <- smulvk c s2;
       z <- y + cs1;
       r0 <- polykvec_LowBits (w - cs2);
       bz <- infnorm_lt z (gamma1 - Beta) &&
                  infnorm_lt r0 (gamma2 - Beta);
       leakage <- leakage ++ [ CheckZ bz ];
       if (bz) {
          ct0 <- smulvk c t0;
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

  proc verify(pk : BytesPK.t, m : W8.t list, sigma : BytesSig.t) : bool = {
    var rho,t1,c,l,ct,z,h,rb,_A,tr,mu,wapprox,w1,ctp;
    w1 <- witness;
    rb <- false;
    (rho,t1) <@ PkEncDec.pkDecode(pk);
    (ct,z,h) <@ SigEncDec.sigDecode(sigma);
    if (h <> None) {
      _A <@ ExpandA(XOFA_O(XA)).sample(rho);
      tr <@ Htr.get(pk);
      mu <@ Hmu.get(tr, m);
      (c,l) <@ SampleInBall_O(XC).sample(ct);
      wapprox <- mulmxv (invnttm _A) z - smulvk c (smul t1 (incoeff (2^d)));
      w1 <- UseHint (oget h) wapprox;
      ctp <@ Hct.get(mu, w1Encode w1);
      rb <- infnorm_lt z (gamma1 - Beta);
      rb <- rb && ct = ctp;
    }
    return rb;
  }
}.

(*************** G8 and G9 ****************)

equiv keygen89 :
  MLDSA_RO_DS8(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO).keygen ~
  MLDSA_RO_DS9(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO).keygen :
  ={glob DS5.RO1.RO, DS5.RO3.RO.m, glob XOFA_O}
  ==> ={res, glob DS5.RO1.RO, DS5.RO3.RO.m, glob XOFA_O, RO_y.RO.m}.
proof.
proc.
call (: ={DS5.RO3.RO.m}); 1: by sim.
wp; call (: true); 1: by sim.
wp; rnd; rnd; call (: ={glob DS5.RO1.RO, glob XOFA_O}); 1: by sim.
by inline *; auto => />; smt(invnttv_mulmxv).
qed.

equiv sign89 :
  MLDSA_RO_DS8(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO).sign ~
  MLDSA_RO_DS9(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO).sign :
  ={sk, m, glob DS5.RO1.RO, DS5.RO2.RO.m, DS5.RO4.RO.m, DS5.RO5.RO.m, glob XOFA_O, RO_y.RO.m}
  ==> ={res, glob DS5.RO1.RO, DS5.RO2.RO.m, DS5.RO4.RO.m, DS5.RO5.RO.m, glob XOFA_O, RO_y.RO.m}.
proof.
proc.
seq 13 10 : (={coins, ct, ctl, sigma, leakage, rho, tr, s1, s2, t0, _A, mu, kappa, zh, glob DS5.RO1.RO,
               DS5.RO2.RO.m, DS5.RO4.RO.m, DS5.RO5.RO.m, glob XOFA_O, RO_y.RO.m} /\
             s1h{1} = PolyLVec.nttv s1{1} /\ s2h{1} = PolyKVec.nttv s2{1} /\ t0h{1} = PolyKVec.nttv t0{1}).
+ wp; call (: ={DS5.RO4.RO.m}); 1: by sim.
  call (: ={glob DS5.RO1.RO, glob XOFA_O}); 1: by sim.
  by auto.
seq 1 1 : (={zh, ct, sigma, leakage, glob DS5.RO1.RO, DS5.RO2.RO.m, DS5.RO4.RO.m, DS5.RO5.RO.m, glob XOFA_O,
             RO_y.RO.m}).
+ while (={coins, ct, ctl, sigma, leakage, s1, s2, t0, _A, mu, kappa, zh, glob DS5.RO1.RO, DS5.RO2.RO.m,
           DS5.RO4.RO.m, DS5.RO5.RO.m, glob XOFA_O, RO_y.RO.m} /\
         s1h{1} = PolyLVec.nttv s1{1} /\ s2h{1} = PolyKVec.nttv s2{1} /\ t0h{1} = PolyKVec.nttv t0{1}).
  - wp; call (: ={DS5.RO2.RO.m}); 1: by sim.
    wp; call (: ={DS5.RO5.RO.m}); 1: by sim.
    wp; call (: ={RO_y.RO.m}); 1: by sim.
    auto => /> &2 _ y; rewrite !invnttv_mulmxv /= => cl.
    by rewrite !invnttv_smull !invnttv_smulk /=; smt().
  by auto => />.
by if => //; wp; call (: true); [by sim | auto].
qed.

equiv verify89 :
  MLDSA_RO_DS8(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO).verify ~
  MLDSA_RO_DS9(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO).verify :
  ={pk, m, sigma, glob DS5.RO1.RO, DS5.RO2.RO.m, DS5.RO3.RO.m, DS5.RO4.RO.m, DS5.RO5.RO.m, glob XOFA_O}
  ==> ={res}.
proof.
proc.
seq 4 4 : (={pk, m, rho, t1, ct, z, h, rb, w1, glob DS5.RO1.RO, DS5.RO2.RO.m, DS5.RO3.RO.m, DS5.RO4.RO.m,
             DS5.RO5.RO.m, glob XOFA_O}); 1: by sim.
if => //.
wp; call (: ={DS5.RO5.RO.m}); 1: by sim.
wp; call (: ={DS5.RO2.RO.m}); 1: by sim.
call (: ={DS5.RO4.RO.m}); 1: by sim.
call (: ={DS5.RO3.RO.m}); 1: by sim.
call (: ={glob DS5.RO1.RO, glob XOFA_O}); 1: by sim.
auto => /> &2 _ a cl.
by rewrite invnttv_sub invnttv_mulmxv invnttv_smulk.
qed.

section.

declare module A <: DS2.Adversary {
  -DS2.RO1.RO, -DS2.RO2.RO, -DS2.EUF_CMA, -XOFA_O, -XOFS_O, -MLDSA_RO_DS1, -RoutedH,
  -DS5.RO1.RO, -DS5.RO2.RO, -DS5.RO3.RO, -DS5.RO4.RO, -DS5.RO5.RO, -DS5.EUF_CMA, -RO_rest.RO,
  -RO_pad.RO, -RO_pad.FRO, -RO_seed.RO, -RO_S.RO, -RO_rhopp.RO, -RO_v.RO, -CountH, -CountS, -St5,
  -RO_lp.RO, -RO_lp.FRO, -St6, -St7, -Router, -RO_y.RO, -DS8.EUF_CMA }.

lemma G8_G9 &m :
  Pr[DS8.EUF_CMA(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO, MLDSA_RO_DS8, Router(A)).main()
       @ &m : res] =
  Pr[DS8.EUF_CMA(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO, MLDSA_RO_DS9, Router(A)).main()
       @ &m : res].
proof.
byequiv (: ={glob A, glob XOFA_O} ==> ={res}) => //.
proc.
inline{1} DS8.EUF_CMA(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO, MLDSA_RO_DS8, Router(A)).A.forge.
inline{2} DS8.EUF_CMA(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO, MLDSA_RO_DS9, Router(A)).A.forge.
wp; call verify89.
wp; call (: ={RO_pad.RO.m, RO_rest.RO.m, DS5.RO1.RO.m, DS5.RO2.RO.m, DS5.RO3.RO.m, DS5.RO4.RO.m,
              DS5.RO5.RO.m, glob XOFA_O, Router.tr, RO_y.RO.m, DS8.EUF_CMA.qs, DS8.EUF_CMA.sk}).
+ by proc; call sign89; auto.
+ by proc; auto.
+ by proc; inline *; sim.
call (: ={DS5.RO3.RO.m}); 1: by sim.
inline RO_rest.RO.init RO_pad.RO.init; wp.
call keygen89.
by inline *; auto => />.
qed.

(* Hop 9: the NTT is eliminated *)
lemma hop9 (qH qS : int) &m : 0 <= qH => 0 <= qS =>
  (forall (H1 <: DS2.POracle1 {-A}) (H2 <: DS2.POracle2 {-A}) (O <: DS2.SOracle {-A}),
     islossless H1.get => islossless H2.get => islossless O.sign =>
     islossless A(H1, H2, O).forge) =>
  (forall (H <: DS2.POracle1 {-A, -CountH, -CountS}) (G <: DS2.POracle2 {-A, -CountH, -CountS})
          (O <: DS2.SOracle {-A, -CountH, -CountS}),
     hoare [A(CountH(H), G, CountS(O)).forge :
              CountH.c = 0 /\ CountS.c = 0 ==> CountH.c <= qH /\ CountS.c <= qS]) =>
  Pr[DS2.EUF_CMA(DS2.RO1.RO, DS2.RO2.RO, MLDSA_RO_DS1, A).main() @ &m : res] <=
  Pr[DS8.EUF_CMA(DS5.RO1.RO, DS5.RO2.RO, DS5.RO3.RO, DS5.RO4.RO, DS5.RO5.RO, MLDSA_RO_DS9, Router(A)).main()
       @ &m : res] +
  2%r * p512 + (qH + qS * (1 + kappa_max) + 2)%r * p512 +
  ((qS * (qS + qH + 1))%r * p512 + (3 * qH + qS + 4)%r * p256).
proof.
move=> hqH hqS A_ll A_count.
by rewrite -(G8_G9 &m); apply (hop8 A qH qS &m hqH hqS A_ll A_count).
qed.

end section.
