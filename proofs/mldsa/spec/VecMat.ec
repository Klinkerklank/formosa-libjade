require import AllCore List StdBigop.
require import Parameters GFq Rq.
require import Array256.

import Round ZModQ Zq MLDSAParams.

(* polyXnD1-typed vectors/matrices, from's DynMatrix clone.   *)
(* (Previously these came from cloning [DVect] in the dilithium submodule.) *)
import VM VM.Vectors VM.Matrices.

from Jasmin require import JArray. 
clone export PolyArray as LArray  with
        op size <- lvec
        proof ge0_size by smt(gt0_l).

clone export PolyArray as KArray  with
        op size <- kvec
        proof ge0_size by smt(gt0_k).

clone export PolyArray as KLMatrix  with
        op size <- kvec*lvec
        proof ge0_size by smt(gt0_l gt0_k).

theory PolyLVec.
type polylvec = poly LArray.t.
type apolylvec  = vector.

op [opaque] polylvec2alg(v : polylvec) : apolylvec = offunv (fun i => poly2alg v.[i], lvec).
op [opaque] alg2polylvec(v : apolylvec) : polylvec = LArray.init (fun i => alg2poly v.[i]).

lemma polylvec2algK (v : apolylvec) : size v = lvec => polylvec2alg (alg2polylvec v) = v.
proof.
move=> hs; rewrite /polylvec2alg /alg2polylvec; apply/eq_vectorP; rewrite size_offunv hs; split; 1: smt(gt0_l).
by move=> i hi; rewrite get_offunv 1:/# /= LArray.initiE 1:/# /= poly2algK.
qed.

lemma alg2polylvecK : cancel polylvec2alg alg2polylvec.
proof.
move=> v; rewrite /alg2polylvec /polylvec2alg; apply LArray.ext_eq => i hi.
by rewrite LArray.initiE //= get_offunv //= alg2polyK.
qed.

op nttv v = LArray.map ntt v.
op invnttv v = LArray.map invntt v. 
op zerov : polylvec = LArray.init (fun i =>  poly_zero).

op (+) (v1 v2 : polylvec) : polylvec = alg2polylvec ((polylvec2alg v1) + (polylvec2alg v2)).

lemma polylvec_add_iE (v1 v2 : polylvec) k :
  0 <= k < lvec => (v1 + v2).[k] = v1.[k] &+ v2.[k].
proof.
move=> hk; have -> : v1 + v2 = alg2polylvec (polylvec2alg v1 + polylvec2alg v2) by done.
by rewrite /alg2polylvec LArray.initiE //= get_addv /polylvec2alg !get_offunv.
qed.

op ntt_smul(p : poly, v : polylvec) : polylvec = map (fun p' => basemul p' p) v.

lemma invnttv_ntt_smul_k (c : poly) (sv : polylvec) (k : int) :
  0 <= k < lvec =>
  (invnttv (ntt_smul c sv)).[k] = invntt (basemul sv.[k] c).
proof. by move => hk; rewrite /invnttv /ntt_smul !mapiE 1:/# /=. qed.

op infnorm_lt(v : polylvec, bound : int) : bool =
  all (fun ii => all (fun jj => `|v.[ii].[jj]| < bound) (iota_ 0 256)) (iota_ 0 lvec).

lemma infnorm_lt_polyE (v : polylvec) (bound : int) :
  infnorm_lt v bound <=> all (fun i => infnorm_lt v.[i] bound) (iota_ 0 lvec).
proof.
by rewrite /infnorm_lt  allP /=; split => H i Hi /=.
qed.

op mods(v : polylvec) : polylvec =
  map (fun (vi : poly) => map (fun c => incoeff (crepr c)) vi) v.

 end PolyLVec.

theory PolyKVec.
type polykvec = poly KArray.t.
type apolykvec  = vector.

op [opaque] polykvec2alg(v : polykvec) : apolykvec = offunv (fun i => poly2alg v.[i], kvec).
op [opaque] alg2polykvec(v : apolykvec) : polykvec = KArray.init (fun i => alg2poly v.[i]).

lemma polykvec2algK (v : apolykvec) : size v = kvec => polykvec2alg (alg2polykvec v) = v.
proof.
move=> hs; rewrite /polykvec2alg /alg2polykvec; apply/eq_vectorP; rewrite size_offunv hs; split; 1: smt(gt0_k).
by move=> i hi; rewrite get_offunv 1:/# /= KArray.initiE 1:/# /= poly2algK.
qed.

lemma alg2polykvecK : cancel polykvec2alg alg2polykvec.
proof.
move=> v; rewrite /alg2polykvec /polykvec2alg; apply KArray.ext_eq => i hi.
by rewrite KArray.initiE //= get_offunv //= alg2polyK.
qed.


op nttv v = KArray.map ntt v.
op invnttv v = KArray.map invntt v.
op zerov : polykvec = create poly_zero.

op (+) (v1 v2 : polykvec) : polykvec = alg2polykvec ((polykvec2alg v1) + (polykvec2alg v2)).
op (-) (v1 v2 : polykvec) : polykvec = alg2polykvec ((polykvec2alg v1) - (polykvec2alg v2)).
op ntt_smul(p : poly, v : polykvec) : polykvec = map (fun p' => basemul p' p) v.

lemma invnttv_ntt_smul_k (c : poly) (sv : polykvec) (k : int) :
  0 <= k < kvec =>
  (invnttv (ntt_smul c sv)).[k] = invntt (basemul sv.[k] c).
proof. by move => hk; rewrite /invnttv /ntt_smul !mapiE 1:/# /=. qed.

lemma polykvec_sub_iE (v1 v2 : polykvec) k :
  0 <= k < kvec => (v1 - v2).[k] = v1.[k] &+ (&-) v2.[k].
proof.
move=> hk; have -> : v1 - v2 = alg2polykvec (polykvec2alg v1 - polykvec2alg v2) by done.
by rewrite /alg2polykvec KArray.initiE //= get_addv getvN /polykvec2alg !get_offunv //= /(&+) /(&-) poly2algK.
qed.

lemma polykvec_add_iE (v1 v2 : polykvec) k :
  0 <= k < kvec => (v1 + v2).[k] = v1.[k] &+ v2.[k].
proof.
move=> hk; have -> : v1 + v2 = alg2polykvec (polykvec2alg v1 + polykvec2alg v2) by done.
by rewrite /alg2polykvec KArray.initiE //= get_addv /polykvec2alg !get_offunv.
qed.

op smul(v : polykvec, c : coeff) : polykvec =
   KArray.map (fun (vi : poly) => map (fun ci => c*ci) vi) v.

op Power2Round(t : polykvec) : polykvec * polykvec =
   (map (fun p => (poly_Power2Round p).`1) t, 
    map (fun p => (poly_Power2Round p).`2) t).

op UseHint(h : polykvec, r : polykvec) : polykvec = 
    map2 poly_UseHint h r.

op MakeHint(v1 : polykvec, v2 : polykvec) : polykvec =
    map2 poly_MakeHint v1 v2.

op MakeHintImpl(v1 : polykvec, v2 : polykvec) : polykvec =
    map2 poly_MakeHintImpl v1 v2.

op infnorm_lt(v : polykvec, bound : int) : bool = 
  all (fun ii => all (fun jj => `|v.[ii].[jj]| < bound) (iota_ 0 256)) (iota_ 0 kvec).

import Bigint BIA. 
op hammw(v : polykvec, bound : int) : bool =
 big predT (fun ii => count (fun jj => v.[ii].[jj] <> Zq.zero) (iota_ 0 256)) (iota_ 0 kvec) <= bound.

op polykvec_HighBits(v : polykvec) : polykvec =
  map poly_HighBits v.

op polykvec_LowBits(v : polykvec) : polykvec =
  map poly_LowBits v.

(* When |cs2| <= Beta at every coefficient, LowBits(w-cs2) and LowBits(w)-cs2 agree
   for the infnorm check at threshold gamma2-Beta.  If cs2 were to cross a
   2*gamma2 rounding boundary, then |LowBits(w)-cs2| >= gamma2 > gamma2-Beta,
   making both sides false; in the no-crossing case the two representations are equal. *)
lemma bz_sync (w cs2 : polykvec) :
    infnorm_lt cs2 (Beta + 1) =>
    infnorm_lt (polykvec_LowBits (w - cs2)) (gamma2 - Beta) =
    infnorm_lt (polykvec_LowBits w - cs2) (gamma2 - Beta).
proof.
move => Hcs2.
rewrite /infnorm_lt eq_iff.
apply eq_all_in => k Hk_iota.
have Hk : 0 <= k < kvec by smt(mem_iota).
rewrite /=.
apply eq_all_in => j Hj_iota.
have Hj : 0 <= j < n by smt(mem_iota).
rewrite /=.
rewrite /polykvec_LowBits.
rewrite KArray.mapiE 1:/#.
rewrite polykvec_sub_iE 1:/#.
rewrite polykvec_sub_iE 1:/#.
rewrite KArray.mapiE 1:/#.
rewrite /poly_LowBits !Array256.initiE 1,2:/# /=.
rewrite poly_addE 1:/#.
rewrite poly_negE 1:/#.
have rewr_sub : forall (a b : coeff), a + -b = a - b by smt(@Zq).
have HLBS := LowBits_sub_sync w.[k].[j] cs2.[k].[j] _.
+ move: Hcs2; rewrite /infnorm_lt !allP => Hcs2.
  have := Hcs2 k _; first by rewrite mem_iota /#.
  rewrite /= allP => Hcs2k.
  have := Hcs2k j _; first by rewrite mem_iota /#.
  by simplify => /#.
rewrite PolyReduce.rcoeffD poly2algiE 1:/# poly2algiE 1:/# Array256.initiE 1:/# /=.
rewrite poly_negE 1:/#.
rewrite rewr_sub.
by rewrite HLBS.
qed.

(* Coefficient-wise lift of MakeHintImpl_MakeHint_equiv from GFq.ec. *)
lemma polykvec_MakeHintImpl_MakeHint_equiv (w cs2 ct0 : polykvec) :
    infnorm_lt cs2 (Beta + 1) =>
    MakeHintImpl (polykvec_HighBits w) (polykvec_LowBits w - cs2 + ct0) =
    MakeHint (zerov - ct0) (w - cs2 + ct0).
proof.
move => Hcs2.
apply KArray.tP => k Hk.
rewrite /MakeHintImpl /MakeHint !KArray.map2iE //.
rewrite /polykvec_HighBits /polykvec_LowBits !KArray.mapiE //.
rewrite !polykvec_add_iE //.
rewrite !polykvec_sub_iE //.
rewrite KArray.mapiE 1:/# /= /zerov KArray.createiE 1:/#.
apply Array256.tP => j Hj.
rewrite /poly_MakeHintImpl /poly_MakeHint !Array256.initiE 1,2:/# /=.
do 2!(rewrite poly_addE /= 1:/#).
do 1!(rewrite poly_negE /= 1:/#).
do 1!(rewrite poly_addE /= 1:/#).
do 1!(rewrite poly_negE /= 1:/#).
do 2!(rewrite poly_addE /= 1:/#).
do 1!(rewrite poly_negE /= 1:/#).
do 1!(rewrite poly_zeroE 1:/#).
rewrite /poly_HighBits /poly_LowBits !Array256.initiE 1,2:/# /=.
congr. congr.
have rewr_sub : forall (a b : coeff), a + -b = a - b by smt(@Zq).
(* do 10!(rewrite rewr_sub). *)
apply MakeHintImpl_MakeHint_equiv.
move: Hcs2; rewrite /infnorm_lt !allP => Hcs2.
have := Hcs2 k _; first by rewrite mem_iota /#.
rewrite /= allP => Hcs2k.
have := Hcs2k j _; first by rewrite mem_iota /#.
by simplify => /#.
qed. (* Ours *)

end PolyKVec.

theory PolyMat.
type polymat = poly KLMatrix.t.
type apolymat = matrix.

op "_.[_<-_]" (m : polymat, rc : int * int, p : poly) =
        m.[rc.`1*lvec+rc.`2 <- p].

op nttm m = KLMatrix.map ntt m.
op invnttm m = KLMatrix.map invntt m.
op zerom : polymat = create poly_zero.

op row(m : polymat, r : int) : PolyLVec.polylvec = LArray.init (fun i => m.[r*lvec+i]).
op col(m : polymat, c : int) : PolyKVec.polykvec = KArray.init (fun i => m.[c+lvec*i]).
end PolyMat.

import PolyLVec PolyKVec PolyMat.

op ntt_dotp (v1 v2 : polylvec) : poly =
   foldr (fun (i : int) (a : poly) => (basemul v1.[i] v2.[i]) &+ a) poly_zero (iota_ 0 lvec).

op ntt_mulmxv(m : polymat, v : polylvec) : polykvec = 
   KArray.init (fun i => ntt_dotp (row m i) v).
 
op dotp_partial (v1 v2 : polylvec) (k : int) : poly =
  foldr (fun (i : int) (a : poly) => (basemul v1.[i] v2.[i]) &+ a)
        poly_zero (iota_ 0 k).

lemma dotp_partialS (v1 v2 : polylvec) (k : int) :
  0 <= k => dotp_partial v1 v2 (k + 1) = basemul v1.[k] v2.[k] &+ dotp_partial v1 v2 k.
proof. admitted. (* todo dotp algebra PY *)

lemma dotp_partial_ntt_dotp (v1 v2 : polylvec) :
  dotp_partial v1 v2 lvec = ntt_dotp v1 v2.
proof. by rewrite /dotp_partial /ntt_dotp. qed.

(* NTT/INTT cancellation + polynomial multiplication norm bound:
   invnttv(ntt_smul(ntt c)(nttv s2)) = c * s2 componentwise, and
   |c * s2|_inf <= tau * Eta = Beta when c has tau nonzero +-1 coefficients
   and |s2|_inf <= Eta.  The infnorm_lt c 2 hypothesis encodes the +-1 bound. *)
lemma cs2_norm_bound (c : poly) (s2 : polykvec) :
    infnorm_lt c 2 =>
    PolyKVec.infnorm_lt s2 (Eta + 1) =>
    PolyKVec.infnorm_lt (PolyKVec.invnttv (PolyKVec.ntt_smul (ntt c) (PolyKVec.nttv s2))) (Beta + 1).
proof. admit. qed. (* FIXME: PY *)

