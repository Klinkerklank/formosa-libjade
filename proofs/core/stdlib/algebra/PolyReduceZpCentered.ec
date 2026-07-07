(* ==================================================================== *)
(* PolyReduceZpCentered: same scaffolding as [PolyReduceZp] but the     *)
(* coefficient sub-theory is [ZqCentered] (extends [ZModRing] with     *)
(* centered representation [crepr], absolute value `|_|`, and the      *)
(* abs_zp lemma family).                                                *)
(*                                                                      *)
(* Built by first cloning [ZqCentered] (to get the extended Zp), then  *)
(* clone-including [PolyReduceZp] with PolyReduceZp's internal Zp       *)
(* rebound to ours — so the polynomial-ring construction and the       *)
(* distributions are inherited without copy-paste.                     *)
(* ==================================================================== *)

require import AllCore Finite List Bigalg Distr.
require import Ring StdOrder IntDiv ZModP Ideal Poly.
(*---*) import IntOrder.

require import PolyReduce ZModPCentered Nneg.
require DynMatrix.

abstract theory PolyReduceZpCentered.

clone include ZpCenteredRing.

clone include PolyReduceZp with
  theory Zp <- ZMR.
import PolyReduce.
import ZMR.

(* ==================================================================== *)
(* Centered-representation infinity-norm machinery on polyXnD1.         *)
(*                                                                      *)
(* Two complementary views, equivalent under non-negative bounds:       *)
(*   - predicate-style checks: poly_infnorm_le, poly_infnorm_lt         *)
(*   - computed norm: inf_norm : polyXnD1 -> Nneg.nneg                   *)
(* The soundness lemmas tie them together.                               *)
(* ==================================================================== *)

(* -------------------------------------------------------------------- *)
(* Predicate-style inf-norm bound checks on coefficients.                *)

op poly_infnorm_lt (q : polyXnD1) (b : int) : bool =
  forall i, 0 <= i < n => `|q.[i]| < b.

op poly_infnorm_le (q : polyXnD1) (b : int) : bool =
  forall i, 0 <= i < n => `|q.[i]| <= b.

(* -------------------------------------------------------------------- *)
(* Basic monotonicity / equivalence lemmas.                              *)

lemma poly_infnorm_lt_le (q : polyXnD1) (b : int) :
  poly_infnorm_lt q b => poly_infnorm_le q b.
proof. by move=> H i Hi; have := H i Hi; smt(). qed.

lemma poly_infnorm_le_mono (q : polyXnD1) (b1 b2 : int) :
  b1 <= b2 => poly_infnorm_le q b1 => poly_infnorm_le q b2.
proof. by move=> Hb H i Hi; have := H i Hi; smt(). qed.

lemma poly_infnorm_lt_mono (q : polyXnD1) (b1 b2 : int) :
  b1 <= b2 => poly_infnorm_lt q b1 => poly_infnorm_lt q b2.
proof. by move=> Hb H i Hi; have := H i Hi; smt(). qed.

(* -------------------------------------------------------------------- *)
(* Trivial bounds.                                                       *)

lemma poly_infnorm_le_ub (q : polyXnD1) :
  poly_infnorm_le q (p %/ 2)
  by move=> i Hi; smt(abs_zp_ub).

lemma poly_infnorm_le_zero :
  poly_infnorm_le zeroXnD1 0.
proof. move=> i Hi; rewrite rcoeff0; smt(abs_zp_zero). qed.

(* -------------------------------------------------------------------- *)
(* Triangle inequality and negation bounds.                              *)

lemma poly_infnorm_le_add (q r : polyXnD1) (bq br : int) :
     poly_infnorm_le q bq
  => poly_infnorm_le r br
  => poly_infnorm_le (q + r) (bq + br).
proof.
move=> Hq Hr i Hi.
rewrite rcoeffD; have := abs_zp_triangle q.[i] r.[i].
have := Hq i Hi; have := Hr i Hi; smt().
qed.

lemma poly_infnorm_lt_add (q r : polyXnD1) (bq br : int) :
     poly_infnorm_lt q bq
  => poly_infnorm_lt r br
  => poly_infnorm_lt (q + r) (bq + br).
proof.
move=> Hq Hr i Hi.
rewrite rcoeffD; have := abs_zp_triangle q.[i] r.[i].
have := Hq i Hi; have := Hr i Hi; smt().
qed.

lemma poly_infnorm_le_opp (q : polyXnD1) (b : int) :
  poly_infnorm_le q b => poly_infnorm_le (- q) b.
proof.
move=> H i Hi.
rewrite -rcoeffN -abs_zpN.
have := H i Hi; smt().
qed.

lemma poly_infnorm_lt_opp (q : polyXnD1) (b : int) :
  poly_infnorm_lt q b => poly_infnorm_lt (- q) b.
proof.
move=> H i Hi.
rewrite -rcoeffN -abs_zpN.
have := H i Hi; smt().
qed.

(* -------------------------------------------------------------------- *)
(* Computed inf-norm via big-max of coefficient absolute values.        *)

op inf_norm (q : polyXnD1) : Nneg.nneg =
  Nneg.BMaxN.bigi predT (fun i => Nneg.ofint `|q.[i]|) 0 n.

(* Soundness against the [_le] check (for non-negative bounds). *)
lemma poly_infnorm_le_iff (q : polyXnD1) (b : int) :
  0 <= b =>
  (poly_infnorm_le q b <=> Nneg.(<=) (inf_norm q) (Nneg.ofint b)).
proof.
move=> ge0_b; rewrite /poly_infnorm_le /inf_norm Nneg.BMaxN.big_le_iff.
have valK_b : Nneg.val (Nneg.ofint b) = b by apply Nneg.valK_pos.
have step : forall a, 0 <= a =>
  Nneg.(<=) (Nneg.ofint a) (Nneg.ofint b) <=> a <= b.
- move=> a ge0_a; rewrite /Nneg.(<=) valK_b.
  by have -> : Nneg.val (Nneg.ofint a) = a by apply Nneg.valK_pos.
split.
- move=> H; split; first by apply Nneg.zero_le.
  move=> i; rewrite mem_range => Hi _ /=.
  have ge0_a : 0 <= `|q.[i]| by smt().
  by rewrite step //; apply H; smt().
- case=> _ H i Hi.
  have Hi' : i \in range 0 n by rewrite mem_range; smt().
  have ge0_a : 0 <= `|q.[i]| by smt().
  have := H i Hi' _; first by [].
  by rewrite /= step.
qed.

(* Soundness against the [_lt] check. Strictly-less bound means         *)
(* coefficient bounds by [b - 1] (since values are integers).           *)
lemma poly_infnorm_lt_iff (q : polyXnD1) (b : int) :
  1 <= b =>
  (poly_infnorm_lt q b <=> Nneg.(<=) (inf_norm q) (Nneg.ofint (b - 1))).
proof.
move=> ge1_b.
have -> : poly_infnorm_lt q b <=> poly_infnorm_le q (b - 1)
  by rewrite /poly_infnorm_lt /poly_infnorm_le; smt().
by apply poly_infnorm_le_iff; smt().
qed.

(* ==================================================================== *)
(* Vectors over polyXnD1.                                                *)
(*                                                                      *)
(* Clones DynMatrix at the polyXnD1 polynomial ring, then defines       *)
(* entry-wise centered-inf-norm bound predicates and a computed         *)
(* inf-norm on vectors, with soundness lemmas tying the two.            *)
(* (Matrix-level can be added analogously in a follow-up.)              *)
(* ==================================================================== *)

clone import DynMatrix as VM with
  theory ZR <- ComRingDflInv.
import VM.Vectors.

(* -------------------------------------------------------------------- *)
(* Vector-level: entry-wise centered-inf-norm predicates.                *)

op vec_infnorm_lt (v : vector) (b : int) : bool =
  forall i, 0 <= i < size v => poly_infnorm_lt v.[i] b.

op vec_infnorm_le (v : vector) (b : int) : bool =
  forall i, 0 <= i < size v => poly_infnorm_le v.[i] b.

(* -------------------------------------------------------------------- *)
(* Computed vector inf-norm via big-max of per-entry inf-norms.          *)

op inf_normv (v : vector) : Nneg.nneg =
  Nneg.BMaxN.bigi predT (fun i => inf_norm v.[i]) 0 (size v).

(* -------------------------------------------------------------------- *)
(* Soundness: vector-level [_le] check iff the computed vector inf-norm *)
(* is bounded by [Nneg.ofint b].                                        *)

lemma vec_infnorm_le_iff (v : vector) (b : int) :
  0 <= b =>
  (vec_infnorm_le v b <=> Nneg.(<=) (inf_normv v) (Nneg.ofint b)).
proof.
move=> ge0_b; rewrite /vec_infnorm_le /inf_normv Nneg.BMaxN.big_le_iff.
split.
- move=> H; split; first by apply Nneg.zero_le.
  move=> i; rewrite mem_range => Hi _ /=.
  have := H i _; first by smt().
  by rewrite -(poly_infnorm_le_iff _ _ ge0_b).
- case=> _ H i Hi.
  have Hi' : i \in range 0 (size v) by rewrite mem_range; smt().
  have := H i Hi' _; first by [].
  by rewrite /= -(poly_infnorm_le_iff _ _ ge0_b).
qed.

lemma vec_infnorm_lt_iff (v : vector) (b : int) :
  1 <= b =>
  (vec_infnorm_lt v b <=> Nneg.(<=) (inf_normv v) (Nneg.ofint (b - 1))).
proof.
move=> ge1_b.
have -> : vec_infnorm_lt v b <=> vec_infnorm_le v (b - 1).
- rewrite /vec_infnorm_lt /vec_infnorm_le.
  split=> H i Hi; have := H i Hi.
  + by rewrite /poly_infnorm_lt /poly_infnorm_le; smt().
  + by rewrite /poly_infnorm_lt /poly_infnorm_le; smt().
by apply vec_infnorm_le_iff; smt().
qed.

(* -------------------------------------------------------------------- *)
(* Matrix-level: entry-wise centered-inf-norm predicates and norm.       *)
import VM.Matrices.

op mat_infnorm_lt (m : matrix) (b : int) : bool =
  forall i j, 0 <= i < rows m => 0 <= j < cols m =>
    poly_infnorm_lt m.[(i, j)] b.

op mat_infnorm_le (m : matrix) (b : int) : bool =
  forall i j, 0 <= i < rows m => 0 <= j < cols m =>
    poly_infnorm_le m.[(i, j)] b.

op inf_normm (m : matrix) : Nneg.nneg =
  Nneg.BMaxN.bigi predT
    (fun i => Nneg.BMaxN.bigi predT
                (fun j => inf_norm m.[(i, j)]) 0 (cols m))
    0 (rows m).

lemma mat_infnorm_le_iff (m : matrix) (b : int) :
  0 <= b =>
  (mat_infnorm_le m b <=> Nneg.(<=) (inf_normm m) (Nneg.ofint b)).
proof.
move=> ge0_b; rewrite /mat_infnorm_le /inf_normm Nneg.BMaxN.big_le_iff.
split.
- move=> H; split; first by apply Nneg.zero_le.
  move=> i; rewrite mem_range => Hi _ /=.
  rewrite Nneg.BMaxN.big_le_iff; split; first by apply Nneg.zero_le.
  move=> j; rewrite mem_range => Hj _ /=.
  by rewrite -(poly_infnorm_le_iff _ _ ge0_b); apply H; smt().
- case=> _ H i j Hi Hj.
  have Hi' : i \in range 0 (rows m) by rewrite mem_range; smt().
  have := H i Hi' _; first by [].
  rewrite /= Nneg.BMaxN.big_le_iff => -[_ Hr].
  have Hj' : j \in range 0 (cols m) by rewrite mem_range; smt().
  have := Hr j Hj' _; first by [].
  by rewrite /= -(poly_infnorm_le_iff _ _ ge0_b).
qed.

lemma mat_infnorm_lt_iff (m : matrix) (b : int) :
  1 <= b =>
  (mat_infnorm_lt m b <=> Nneg.(<=) (inf_normm m) (Nneg.ofint (b - 1))).
proof.
move=> ge1_b.
have -> : mat_infnorm_lt m b <=> mat_infnorm_le m (b - 1).
- rewrite /mat_infnorm_lt /mat_infnorm_le.
  split=> H i j Hi Hj; have := H i j Hi Hj.
  + by rewrite /poly_infnorm_lt /poly_infnorm_le; smt().
  + by rewrite /poly_infnorm_lt /poly_infnorm_le; smt().
by apply mat_infnorm_le_iff; smt().
qed.

end PolyReduceZpCentered.

(* ==================================================================== *)
(* Field version: when [p] is prime, additionally make available the    *)
(* prime-only coefficient lemmas (creprN, creprND, creprN2) on the same *)
(* polyXnD1 coefficient instantiation.                                  *)
(* ==================================================================== *)
abstract theory PolyReduceZpCenteredField.

clone include ZpCenteredField.

clone include PolyReduceZp with
  theory Zp <- ZMR.
import PolyReduce.
import ZMR.
import ZMF.

(* ==================================================================== *)
(* Centered-representation infinity-norm machinery on polyXnD1.         *)
(* (Duplicated from [PolyReduceZpCentered] — both theories provide the  *)
(*  same inf-norm surface on top of their respective coefficient rings.)*)
(* ==================================================================== *)

op poly_infnorm_lt (q : polyXnD1) (b : int) : bool =
  forall i, 0 <= i < n => `|q.[i]| < b.

op poly_infnorm_le (q : polyXnD1) (b : int) : bool =
  forall i, 0 <= i < n => `|q.[i]| <= b.

lemma poly_infnorm_lt_le (q : polyXnD1) (b : int) :
  poly_infnorm_lt q b => poly_infnorm_le q b.
proof. by move=> H i Hi; have := H i Hi; smt(). qed.

lemma poly_infnorm_le_mono (q : polyXnD1) (b1 b2 : int) :
  b1 <= b2 => poly_infnorm_le q b1 => poly_infnorm_le q b2.
proof. by move=> Hb H i Hi; have := H i Hi; smt(). qed.

lemma poly_infnorm_lt_mono (q : polyXnD1) (b1 b2 : int) :
  b1 <= b2 => poly_infnorm_lt q b1 => poly_infnorm_lt q b2.
proof. by move=> Hb H i Hi; have := H i Hi; smt(). qed.

lemma poly_infnorm_le_ub (q : polyXnD1) :
  poly_infnorm_le q (p %/ 2)
  by move=> i Hi; smt(abs_zp_ub).

lemma poly_infnorm_le_zero :
  poly_infnorm_le zeroXnD1 0.
proof. move=> i Hi; rewrite rcoeff0; smt(abs_zp_zero). qed.

lemma poly_infnorm_le_add (q r : polyXnD1) (bq br : int) :
     poly_infnorm_le q bq
  => poly_infnorm_le r br
  => poly_infnorm_le (q + r) (bq + br).
proof.
move=> Hq Hr i Hi.
rewrite rcoeffD; have := abs_zp_triangle q.[i] r.[i].
have := Hq i Hi; have := Hr i Hi; smt().
qed.

lemma poly_infnorm_lt_add (q r : polyXnD1) (bq br : int) :
     poly_infnorm_lt q bq
  => poly_infnorm_lt r br
  => poly_infnorm_lt (q + r) (bq + br).
proof.
move=> Hq Hr i Hi.
rewrite rcoeffD; have := abs_zp_triangle q.[i] r.[i].
have := Hq i Hi; have := Hr i Hi; smt().
qed.

lemma poly_infnorm_le_opp (q : polyXnD1) (b : int) :
  poly_infnorm_le q b => poly_infnorm_le (- q) b.
proof.
move=> H i Hi.
rewrite -rcoeffN -abs_zpN.
have := H i Hi; smt().
qed.

lemma poly_infnorm_lt_opp (q : polyXnD1) (b : int) :
  poly_infnorm_lt q b => poly_infnorm_lt (- q) b.
proof.
move=> H i Hi.
rewrite -rcoeffN -abs_zpN.
have := H i Hi; smt().
qed.

op inf_norm (q : polyXnD1) : Nneg.nneg =
  Nneg.BMaxN.bigi predT (fun i => Nneg.ofint `|q.[i]|) 0 n.

lemma poly_infnorm_le_iff (q : polyXnD1) (b : int) :
  0 <= b =>
  (poly_infnorm_le q b <=> Nneg.(<=) (inf_norm q) (Nneg.ofint b)).
proof.
move=> ge0_b; rewrite /poly_infnorm_le /inf_norm Nneg.BMaxN.big_le_iff.
have valK_b : Nneg.val (Nneg.ofint b) = b by apply Nneg.valK_pos.
have step : forall a, 0 <= a =>
  Nneg.(<=) (Nneg.ofint a) (Nneg.ofint b) <=> a <= b.
- move=> a ge0_a; rewrite /Nneg.(<=) valK_b.
  by have -> : Nneg.val (Nneg.ofint a) = a by apply Nneg.valK_pos.
split.
- move=> H; split; first by apply Nneg.zero_le.
  move=> i; rewrite mem_range => Hi _ /=.
  have ge0_a : 0 <= `|q.[i]| by smt().
  by rewrite step //; apply H; smt().
- case=> _ H i Hi.
  have Hi' : i \in range 0 n by rewrite mem_range; smt().
  have ge0_a : 0 <= `|q.[i]| by smt().
  have := H i Hi' _; first by [].
  by rewrite /= step.
qed.

lemma poly_infnorm_lt_iff (q : polyXnD1) (b : int) :
  1 <= b =>
  (poly_infnorm_lt q b <=> Nneg.(<=) (inf_norm q) (Nneg.ofint (b - 1))).
proof.
move=> ge1_b.
have -> : poly_infnorm_lt q b <=> poly_infnorm_le q (b - 1)
  by rewrite /poly_infnorm_lt /poly_infnorm_le; smt().
by apply poly_infnorm_le_iff; smt().
qed.

(* -------------------------------------------------------------------- *)
(* Vector / Matrix layer.                                                *)

clone import DynMatrix as VM with
  theory ZR <- ComRingDflInv.
import VM.Vectors.

op vec_infnorm_lt (v : vector) (b : int) : bool =
  forall i, 0 <= i < size v => poly_infnorm_lt v.[i] b.

op vec_infnorm_le (v : vector) (b : int) : bool =
  forall i, 0 <= i < size v => poly_infnorm_le v.[i] b.

op inf_normv (v : vector) : Nneg.nneg =
  Nneg.BMaxN.bigi predT (fun i => inf_norm v.[i]) 0 (size v).

lemma vec_infnorm_le_iff (v : vector) (b : int) :
  0 <= b =>
  (vec_infnorm_le v b <=> Nneg.(<=) (inf_normv v) (Nneg.ofint b)).
proof.
move=> ge0_b; rewrite /vec_infnorm_le /inf_normv Nneg.BMaxN.big_le_iff.
split.
- move=> H; split; first by apply Nneg.zero_le.
  move=> i; rewrite mem_range => Hi _ /=.
  have := H i _; first by smt().
  by rewrite -(poly_infnorm_le_iff _ _ ge0_b).
- case=> _ H i Hi.
  have Hi' : i \in range 0 (size v) by rewrite mem_range; smt().
  have := H i Hi' _; first by [].
  by rewrite /= -(poly_infnorm_le_iff _ _ ge0_b).
qed.

lemma vec_infnorm_lt_iff (v : vector) (b : int) :
  1 <= b =>
  (vec_infnorm_lt v b <=> Nneg.(<=) (inf_normv v) (Nneg.ofint (b - 1))).
proof.
move=> ge1_b.
have -> : vec_infnorm_lt v b <=> vec_infnorm_le v (b - 1).
- rewrite /vec_infnorm_lt /vec_infnorm_le.
  split=> H i Hi; have := H i Hi.
  + by rewrite /poly_infnorm_lt /poly_infnorm_le; smt().
  + by rewrite /poly_infnorm_lt /poly_infnorm_le; smt().
by apply vec_infnorm_le_iff; smt().
qed.

import VM.Matrices.

op mat_infnorm_lt (m : matrix) (b : int) : bool =
  forall i j, 0 <= i < rows m => 0 <= j < cols m =>
    poly_infnorm_lt m.[(i, j)] b.

op mat_infnorm_le (m : matrix) (b : int) : bool =
  forall i j, 0 <= i < rows m => 0 <= j < cols m =>
    poly_infnorm_le m.[(i, j)] b.

op inf_normm (m : matrix) : Nneg.nneg =
  Nneg.BMaxN.bigi predT
    (fun i => Nneg.BMaxN.bigi predT
                (fun j => inf_norm m.[(i, j)]) 0 (cols m))
    0 (rows m).

lemma mat_infnorm_le_iff (m : matrix) (b : int) :
  0 <= b =>
  (mat_infnorm_le m b <=> Nneg.(<=) (inf_normm m) (Nneg.ofint b)).
proof.
move=> ge0_b; rewrite /mat_infnorm_le /inf_normm Nneg.BMaxN.big_le_iff.
split.
- move=> H; split; first by apply Nneg.zero_le.
  move=> i; rewrite mem_range => Hi _ /=.
  rewrite Nneg.BMaxN.big_le_iff; split; first by apply Nneg.zero_le.
  move=> j; rewrite mem_range => Hj _ /=.
  by rewrite -(poly_infnorm_le_iff _ _ ge0_b); apply H; smt().
- case=> _ H i j Hi Hj.
  have Hi' : i \in range 0 (rows m) by rewrite mem_range; smt().
  have := H i Hi' _; first by [].
  rewrite /= Nneg.BMaxN.big_le_iff => -[_ Hr].
  have Hj' : j \in range 0 (cols m) by rewrite mem_range; smt().
  have := Hr j Hj' _; first by [].
  by rewrite /= -(poly_infnorm_le_iff _ _ ge0_b).
qed.

lemma mat_infnorm_lt_iff (m : matrix) (b : int) :
  1 <= b =>
  (mat_infnorm_lt m b <=> Nneg.(<=) (inf_normm m) (Nneg.ofint (b - 1))).
proof.
move=> ge1_b.
have -> : mat_infnorm_lt m b <=> mat_infnorm_le m (b - 1).
- rewrite /mat_infnorm_lt /mat_infnorm_le.
  split=> H i j Hi Hj; have := H i j Hi Hj.
  + by rewrite /poly_infnorm_lt /poly_infnorm_le; smt().
  + by rewrite /poly_infnorm_lt /poly_infnorm_le; smt().
by apply mat_infnorm_le_iff; smt().
qed.

end PolyReduceZpCenteredField.
