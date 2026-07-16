(**
  List-related user reduction rules, collected in the named database
  [listred]. Nothing here touches the default simplification database:
  requiring this file leaks no reduction behavior. Proofs opt in
  explicitly, either for a whole proof

      hint +listred.

  or for a single call ([simplify hint +listred], [with hint +listred (...)]).
*)

(* -------------------------------------------------------------------- *)
require import AllCore List.

from Jasmin require import JUtils.

(* -------------------------------------------------------------------- *)
hint simplify in listred : size_map, size_nseq.
hint simplify in listred : size_mkseq.
hint simplify in listred : nth_mkseq, nth_nseq.
hint simplify in listred : flatten_cons, flatten_nil.
hint simplify in listred : cat0s, cats0.
hint simplify in listred : mkseqSr_minus, mkseq0.
hint simplify in listred : nseq0, nseqS_minus.
