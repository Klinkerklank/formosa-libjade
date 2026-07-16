# Abstracting the NTT algebraic layer (notes for a later rework)

The current development (`nttalg.ec`, and its inverse counterpart) is
deliberately elementary: statements are integer congruences (`x %% q`),
transported by hand (`modzMml`-chains, local `cgrD`/`cgrB`/`cgrMr`
helpers), and the polynomial residue "P mod (X^m - zeta^e)" exists only
through its closed-form coefficient sum (`nttsum`). The underlying
mathematics is: Zq a field, Rq = Zq[X]/(X^256+1), and the butterfly
network is the iterated CRT along

    X^(2m) - zeta^(2e) = (X^m - zeta^e) (X^m + zeta^e),
    X^m + zeta^e = X^m - zeta^(e+256),        zeta^256 = -1.

Three levels of abstraction, in increasing ambition.

## A. Work in Zq instead of int-mod-q (cheap, do first)

Clone `ZModP.ZModField` for q and restate every congruence lemma as an
*equation in Zq* (`inzmod (to_sint ...) = ...`).

- All transport plumbing disappears: `ring` / field reasoning replaces
  every `-modzDmr ... modzDmr` dance and the ad-hoc `cgrD/cgrB/cgrMr`.
- `zpw` becomes `zeta ^ e` in Zq, with a single order-512 lemma
  absorbing the exponent bookkeeping (`zexp_modE`, `zpwD`, `zpw_oppE`).
- The word-level layer (`mmr_svalE`, `to_sintD_small`, coefficient
  bounds) is unchanged and becomes the explicit int/Zq boundary.
- Mechanical refactor of `nttalg.ec`; every later file gets shorter.

## B. The polynomial reading (the actual "congruence system")

Represent block contents as polynomials over Zq and state the tree
invariant as a *remainder modulo the monic binomial* X^m - c.

Obstacle: the standard library has no polynomial Euclidean division —
`Poly.ec` has no `edivp`/`pmod`, and `PolyReduce` only quotients by
X^n + 1. Two routes:

1. Define remainder-by-monic-binomial directly (`bmod c m p`) with the
   elementary existence/uniqueness lemma (uniqueness by the degree
   argument, divisor monic). Self-contained, small.
2. Land proper polynomial division in the stdlib (there is a `polydiv`
   worktree in the EasyCrypt repository; this may be the moment to
   upstream it) and instantiate.

With B in place the whole tree reduces to two abstract facts:

- tower property:  bmod c m (bmod (c^2) (2m) p) = bmod c m p;
- evaluation:      bmod c 1 p = P(c)  (constant polynomial).

`nttsum` becomes a derived closed form instead of the definition, and
the per-level lemmas are instances rather than inductions.

## C. NTT as the CRT ring isomorphism Rq ~ Zq^256

Package multiplicativity. The payoff is not the NTT itself but the next
target: correctness of *pointwise multiplication in the NTT domain*
(basemul) is exactly "NTT is a ring morphism", which follows from
evaluation-map multiplicativity once B exists. No need for first-class
iso packaging: state the morphism facts as standalone lemmas
(map of product = pointwise product; intt . ntt = id) when
poly-multiplication becomes a target.

## Suggested order

A now (so the inverse-NTT layer is written once in the clean style),
B as a small dedicated file, C deferred until basemul.

---

# Adopted plan: ambient congruences and root-based CRS (no quotients)

Decisions (2026-07-16): keep the existing int-level proofs untouched;
link the spec to the algebraic view *in the ambient logic*, via a
predicate relating a word array to a polynomial over Zq.  No quotient
constructions (`P/<I>`): everything is expressed through a congruence
equality on `poly`.  Congruent representation systems (CRS) are taken
with bases of the form (X^n - P_i)_i, deg P_i < n, where each basis
element is a product of monomials and the roots are globally distinct.
Pairwise co-primality is never mentioned: injectivity/gluing comes from
roots and evaluation only.  (This covers ML-DSA, where everything
splits into distinct linear factors; ML-KEM will need the
generalization to higher-degree factors.)

## M1 - `crspoly.ec`: the generic kit (over Zq)

1. Zq: clone of `ZModP.ZModField` for q = 8380417.  Bridging lemmas
   int-congruence <-> Zq equality (`inzmod x = inzmod y <=> x %% q =
   y %% q`).  The `prime q` obligation is AXIOMATIZED (decision
   2026-07-16): the fact is standard and externally checkable; an
   in-logic certificate can be added later if desired.
2. `poly` over Zq (stdlib `Poly`).  Congruence:
       pred peqm (m p1 p2 : poly) = exists h, p1 - p2 = h * m
   (existential witness: no division theory needed).  Kit: equivalence
   relation, compatibility with +, -, *, scaling; and the restriction
   rule `peqm (m1 * m2) p1 p2 => peqm m1 p1 p2` - the whole CRT-tree
   "descend" direction is this one lemma.
3. Factor theorem: `root p a <=> exists h, p = (X - C a) * h`
   (=> by an explicit synthetic-division construction; <= by peval).
4. Products of monomials: `mprod (rs : coeff list) = prod (X - C r)`.
   Gluing, the core lemma (proved by induction on the root list,
   using only evaluation + factor theorem + integral domain):
       uniq (rs1 ++ rs2), disjoint roots =>
       peqm (mprod rs1) u v => peqm (mprod rs2) u v =>
       peqm (mprod rs1 * mprod rs2) u v
   folded over a family: congruent on every basis element => congruent
   modulo the product.

## M2 - the linking predicate and the forward restatement

5. `pofw (a : wpoly) : poly` (coefficients `inzmod (to_sint a.[i])`,
   deg < 256) and its block variant `pofw_blk a base len`.
6. Basis elements: `xnp n c = X^n - C c`;  level-k family
   `basis k j = xnp (2^k) (zq zeta ^ (E k j))`.  Bridge zpw <-> Zq exp.
7. Monomial-reduction lemma (the constructive congruence witness):
       peqm (xnp n c) (X^(n*s + t)) (C (c^s) * X^t)
   by induction on s; with big-sum linearity this gives
   `peqm (basis k j) (pofw p) (nttsum-polynomial p k j)`.
8. Forward restatement, *derived* from `reduce_tree_alg` (no
   re-verification): block (k, j) of `reduce_tree p k` represents a
   polynomial congruent to `pofw p` modulo `basis k j`.  At k = 0:
   `peval (pofw p) (zeta^(E 0 j)) = inzmod (sval (ntt p).[j])`.

## M3 - the ML-DSA CRS instance

9. Root lists of the basis elements: roots of X^(2^k) - zeta^(E k j)
   are explicit powers of zeta.  Distinctness from: order of zeta is
   exactly 512 (zeta^512 = 1, zeta^256 = -1, order a power of two),
   plus injectivity of j |-> E k j (from bitrev8 involutivity).
10. Instantiate M1: the level-k family is a CRS; gluing corollary:
    congruent on all 256 leaves => congruent modulo X^256 + 1.

## M4 - inverse restatement

11. From the int-level roundtrip: `pofw (iscale (invtree v 8)) =
    C (inzmod 2^32) * pofw p` - an *equality* of polynomials (both
    sides have degree < 256), from which the X^256+1 congruence forms
    are immediate.

## M5 - later payoff

12. basemul/pointwise multiplication: products glue leaf-wise through
    the CRS (this is where uniqueness/gluing is actually consumed).
13. ML-KEM generalization: replace monomials by an abstract list of
    pairwise root-disjoint low-degree factors (degree-2 for ML-KEM);
    the kit of M1 is to be parameterized accordingly.
