require import AllCore.
require Ring ZModP.
clone import ZModP.ZModField as Zq with op p <- 8380417 proof prime_p by admit.

(* inner abstract theory: ONE IDomainBundle parameter *)
abstract theory Inner.
  type t.
  clone import Ring.IDomainBundle as KD with type t <= t.
  lemma inner_mulf (x y : t) :
    KD.R.( * ) x y = KD.R.zeror <=> x = KD.R.zeror \/ y = KD.R.zeror.
  proof. by apply KD.Dom.mulf_eq0. qed.
end Inner.

(* outer abstract theory: ONE FieldBundle parameter; includes Inner by
   piercing its bundle slot-by-slot -- no intermediate bundle built    *)
abstract theory Outer.
  type t.
  clone import Ring.FieldBundle as K with type t <= t.

  clone include Inner with
    type t       <- t,
    theory KD.R   <- K.R,
    theory KD.Dom <- K.F.Dom.
end Outer.

(* concrete-to-abstract: one wholesale bundle substitution *)
clone Outer as O with type t <= Zq.zmod, theory K <= Zq.ZModpFieldBd.

lemma check (x y : Zq.zmod) :
  Zq.( * ) x y = Zq.zero <=> x = Zq.zero \/ y = Zq.zero.
proof. by apply O.inner_mulf. qed.
