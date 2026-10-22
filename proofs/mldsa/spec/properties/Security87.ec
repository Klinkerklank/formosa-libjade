require Spec87 MLDSA_ROSep_Hop18.

(* The security proof of ML-DSA-87: the generic chain of spec/properties
   instantiated on the specification MLDSA87 (the instance used by the
   implementation proofs). *)
clone MLDSA_ROSep_Hop18.MLDSA_ROSep_Hop18 as Sec87 with
  theory Spec <- Spec87.MLDSA87.
