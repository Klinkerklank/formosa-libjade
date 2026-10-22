require Spec44 MLDSA_ROSep_Hop18.

(* The security proof of ML-DSA-44: the generic chain of spec/properties
   instantiated on the specification MLDSA44 (the instance used by the
   implementation proofs). *)
clone MLDSA_ROSep_Hop18.MLDSA_ROSep_Hop18 as Sec44 with
  theory Spec <- Spec44.MLDSA44.
