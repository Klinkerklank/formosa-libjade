# The algebraic layer: status and plan

The int-level development (`nttalg.ec`, `fnttalg.ec`, `inttalg.ec`)
is deliberately elementary: statements are integer congruences
(`x %% q`) and the polynomial residues exist only through their
closed-form coefficient sums (`nttsum`).  The algebraic layer links
those untouched proofs to a polynomial view *in the ambient logic*,
via a predicate relating word arrays to polynomials over Zq — no
quotient construction anywhere; everything is a congruence
`peqm m p1 p2 <=> exists h, p1 - p2 = h * m` on `poly` itself.

## Done — the ML-DSA algebraic layer (M1–M5 of the original plan)

- `crspoly.ec` — Zq (`ZModField`, prime q axiomatized), the
  polynomial clone `ZqP`, the `peqm` congruence kit, factor theorem,
  root-based gluing, degree-uniqueness (`peqm_deg_eq`).
- `nttpoly.ec` — the linking predicate `pofw`, the basis
  `X^(2^k) - zeta^(E k j)`, and, derived with no program reasoning
  redone: the forward restatement (`reduce_tree_polyP`, `ntt_evalP` —
  the NTT is multipoint evaluation at the 256 leaf roots), the CRS
  instance (`leaf_glue` / `leaf_descend`: congruence mod X^256+1 iff
  congruence at every leaf; distinctness via bitrev8 involutivity and
  the odd-part order argument, no gcd), the ring-morphism properties
  (`peval_leaf_inj`, `peval_mul_glue`), the inverse restatement
  (`intt_polyP` / `intt_poly_algP`, an *equality* of polynomials),
  Lagrange interpolation at the leaves (`leafinterp`), and the
  end-to-end `intt_pwmul_polyP` (the Montgomery factors of the
  pointwise product and of the inverse transform cancel exactly).
- `pwmulcorrect.ec` / `pwmultest.ec` — code-level correctness of the
  AVX2 pointwise multiplication, and the closing loop: `PolyMul.mul`
  (ntt, pointwise multiply, inverse ntt) computes the product modulo
  X^256 + 1 on suitably bounded inputs.

## Done — generalization groundwork (EasyCrypt `comm-algebra` branch)

The generic content has been moved out of `crspoly.ec` upstream
(PR 602 carries all of it):

- `Poly.ec` / `PolyComRing`: the peval lemma library (`pevalC/0/D/N/
  B/MX/X/Z/M`, `peval_sum`, `peval_prod`; definition tightened to sum
  over `[0, deg p)`), the `mprod` cluster (products of monic linear
  factors, as `PCM` bigs), `degXBC`/`lcXBC`, `deg_mprod`.
- `Poly.ec` / `Poly` (IDomain): `peval_mprod_out`; the `IDPoly`
  instance is now matchable (`<=` aliases, clone-exported) — as is
  `ZModpField` — so `ZqP` clones at field level and `ZqP.IDPoly`
  feeds theory parameters directly.
- `Poly.ec` / `PolyField` (new floor): Field coefficients; the
  `Lagrange` sub-theory (`lag`, `interp`, evaluation and degree
  lemmas).  Future home of the Euclide realization for k[X].
- `CommAlgebra.ec` (new): stacked as **`Base`** — ideals
  (`Ideal.ec`), divisibility, and the CRT cluster against explicit
  Bezout witnesses (`comax x y = exists u v, u*x + v*y = 1`:
  `comax_Gauss`, `crt_comax`, `crt_uniq_comax`) with no axiom beyond
  the ring — and **`Euclidean`** — weight function and division,
  gcds, Bezout, `coprime`, factorization; the coprime-phrased
  `crt`/`crt_uniq` are corollaries of the witness-level cluster.
  Co-primality was avoided in the ML-DSA layer by design; for the
  generalization it enters only as the witness predicate, which
  binomial moduli `X^n - c1`, `X^n - c2` discharge by the constant
  `(c2 - c1)^-1`.

## Phase 1 — rewire ML-DSA onto `CommAlgebra.Base` (next)

1. Clone `CommAlgebra.Base` in `crspoly.ec` with
   `type t <= ZqP.poly, theory ID <= ZqP.IDPoly`; bridge
   `peqm m p1 p2 <-> idgen [m] (p1 - p2)`.
2. Binomial `comax` witnesses from distinctness of the zeta powers.
3. Re-derive `leaf_glue`/`leaf_descend` from `crt_uniq_comax` and
   descend; retire the root-based gluing (`peqm_glue1`, `peqm_glue`,
   `peqm_mprod2`).
4. Still local to `crspoly.ec` afterwards: `sdivP`/`factor_theorem`,
   the `peqm` kit (until the bridge absorbs it), `peqm_deg_eq` —
   all slated for replacement in phase 2.

## Phase 2 — after the polydiv rework

- Realize `Euclidean` at k[X] (`w := deg`; division by arbitrary
  nonzero divisors — PolyField content), activating the gcd layer
  and CRT reconstruction with canonical remainders.
- ML-KEM instance: X^256+1 over Z_3329 splits into 128 quadratics
  `X^2 - c`; leaves have linear residues (the basemul reading);
  same witness-level gluing, constant `comax` witnesses.
- Replace the hand-rolled `sdivP`/`peqm_deg_eq`/Lagrange by generic
  monic-division facts (unique remainders subsume uniqueness and
  interpolation).

## Infrastructure notes

- The dev is checked against the `comm-algebra` EasyCrypt (see the
  opam pin); suite: `runtest ... --bin-args=-stdlib` at that tree.
- Known upstream issue to report: overriding an anonymous parameter
  subtheory referenced by nested clones crashes the cloner
  (`ecThCloning.ml:472`); the Poly.ec named-parameter pattern is the
  workaround (used by `CommAlgebra.Base`).
