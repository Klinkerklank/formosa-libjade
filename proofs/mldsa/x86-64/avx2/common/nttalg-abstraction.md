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
