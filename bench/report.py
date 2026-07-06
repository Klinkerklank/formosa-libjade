#!/usr/bin/env python3
"""Render the bench CSV as a Markdown report (tables + Mermaid bar charts).

Input is the CSV from `make bench-all` (columns scheme,backend,operation,
median_cycles), read from a file argument or stdin. Output is Markdown on
stdout or to --out, with one Mermaid bar chart per (scheme, operation), axis
anchored at 0.

    make bench-all | python3 report.py -o bench.md
    python3 report.py bench.csv --exclude pqcrystals-ref -o bench.md

--exclude (repeatable) drops a backend from the tables and charts.
--require keeps only schemes that include the named backend (default jasmin,
since a comparison without the implementation under study is uninteresting);
pass --require '' to report every scheme.
"""

import argparse
import csv
import sys
from collections import defaultdict

# display order; anything else falls after these, alphabetically
BACKEND_ORDER = ["jasmin", "mlkem-native", "mldsa-native", "pqcrystals",
                 "pqcrystals-ref"]
# operation order per kind, keyed by a signature operation present in the data
OPS = {"keypair": ["keypair", "encaps", "decaps"],   # KEM
       "keygen": ["keygen", "sign", "verify"]}       # SIG


def load(stream):
    """-> {scheme: {backend: {op: cycles}}}, preserving scheme encounter order."""
    data = defaultdict(lambda: defaultdict(dict))
    order = []
    for row in csv.DictReader(stream):
        s, b, op = row["scheme"], row["backend"], row["operation"]
        if s not in data:
            order.append(s)
        data[s][b][op] = int(row["median_cycles"])
    return data, order


def backends_of(scheme_data, exclude):
    bs = [b for b in scheme_data if b not in exclude]
    return sorted(bs, key=lambda b: (BACKEND_ORDER.index(b)
                                     if b in BACKEND_ORDER else len(BACKEND_ORDER),
                                     b))


def ops_of(scheme_data):
    present = {op for ops in scheme_data.values() for op in ops}
    for key, seq in OPS.items():
        if key in present:
            return seq
    return sorted(present)


def table(scheme_data, backends, ops):
    out = ["| backend | " + " | ".join(ops) + " |",
           "|" + "---|" + "--:|" * len(ops)]
    for b in backends:
        cells = [f"{scheme_data[b].get(op, 0):,}" for op in ops]
        out.append(f"| {b} | " + " | ".join(cells) + " |")
    return "\n".join(out)


def chart(scheme, op, scheme_data, backends):
    vals = [scheme_data[b].get(op, 0) for b in backends]
    xs = ", ".join(f'"{b}"' for b in backends)
    ys = ", ".join(str(v) for v in vals)
    # anchor the axis at 0 so bars are proportional; mermaid otherwise scales to
    # [min, max] and exaggerates small differences
    top = int(max(vals) * 1.1) if vals else 1
    return (f"```mermaid\nxychart-beta\n"
            f'    title "{scheme} {op} — median cycles"\n'
            f"    x-axis [{xs}]\n"
            f'    y-axis "cycles" 0 --> {top}\n'
            f"    bar [{ys}]\n```")


def versions_table(versions):
    """versions: list of (component, value); rendered as a Markdown table."""
    out = ["## Environment", "", "| component | version |", "|---|---|"]
    out += [f"| {name} | {val} |" for name, val in versions]
    return "\n".join(out)


def render(data, order, exclude, require, versions):
    md = ["# Benchmark report", "",
          "Median CPU cycles (rdtsc) per operation, one process per backend, "
          "identical derandomized inputs across backends.", ""]
    if versions:
        md += [versions_table(versions), ""]
    for scheme in order:
        sd = data[scheme]
        backends = backends_of(sd, exclude)
        if require and require not in backends:
            continue
        ops = ops_of(sd)
        md += [f"## {scheme}", "", table(sd, backends, ops), ""]
        for op in ops:
            md += [chart(scheme, op, sd, backends), ""]
    return "\n".join(md)


def main(argv=None):
    ap = argparse.ArgumentParser(description=__doc__,
                                 formatter_class=argparse.RawDescriptionHelpFormatter)
    ap.add_argument("csv", nargs="?", type=argparse.FileType("r"),
                    default=sys.stdin, help="bench CSV (default: stdin)")
    ap.add_argument("-o", "--out", type=argparse.FileType("w"), default=sys.stdout)
    ap.add_argument("--exclude", action="append", default=[],
                    help="backend to drop from tables and charts (repeatable)")
    ap.add_argument("--require", default="jasmin",
                    help="keep only schemes with this backend ('' for all)")
    ap.add_argument("--version", action="append", default=[], dest="versions",
                    metavar="NAME=VALUE",
                    help="component version for the Versions table (repeatable)")
    args = ap.parse_args(argv)

    data, order = load(args.csv)
    if not order:
        sys.exit("no data on input")
    versions = [tuple(v.split("=", 1)) for v in args.versions if "=" in v]
    args.out.write(
        render(data, order, set(args.exclude), args.require, versions) + "\n")


if __name__ == "__main__":
    main()
