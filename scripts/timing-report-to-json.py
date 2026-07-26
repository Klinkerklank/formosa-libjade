#!/usr/bin/env python3
"""Convert an `easycrypt runtest -report` YAML into the timing JSON.

The report has one node per scenario, each with per-file details:

    - name: mldsa
      details:
      - name: keygen (mldsa/x86-64/avx2/ml_dsa_65/keygen.ec)
        time: '12.345'
        success: true
        ...

Output is the sunburst input format (see scripts/timing-sunburst.py):

    { "meta": {...}, "files": [{"path": ..., "seconds": ...}, ...] }

Run metadata is picked up from the GitHub Actions environment when
present (GITHUB_SHA, GITHUB_REF_NAME, GITHUB_RUN_ID); the timestamp
comes from the report itself.

Usage:  timing-report-to-json.py report.yml [out.json]
Exits non-zero if the report contains failures (no timing JSON is
written from a broken run).
"""

import json
import os
import re
import sys
from pathlib import Path

import yaml


def main():
    inp = Path(sys.argv[1] if len(sys.argv) > 1 else "timing.yml")
    out = Path(sys.argv[2] if len(sys.argv) > 2 else "proofs-timing.json")

    report = yaml.safe_load(inp.read_text())

    files, seen, failures = [], set(), []
    for group in report:
        for d in group.get("details", []):
            m = re.search(r"\((.*)\)\s*$", d["name"])
            path = m.group(1) if m else d["name"]
            if not d.get("success", False):
                failures.append(path)
            if path in seen:
                continue
            seen.add(path)
            files.append({"path": path, "seconds": round(float(d["time"]), 1)})

    if failures:
        print(f"{inp}: {len(failures)} failed file(s), refusing to emit timing:",
              file=sys.stderr)
        for p in failures:
            print(f"  {p}", file=sys.stderr)
        sys.exit(1)

    files.sort(key=lambda f: f["path"])
    meta = {
        "repo": os.environ.get("GITHUB_REPOSITORY"),
        "branch": os.environ.get("GITHUB_REF_NAME"),
        "commit": (os.environ.get("GITHUB_SHA") or "")[:8] or None,
        "run_id": int(os.environ["GITHUB_RUN_ID"])
                  if os.environ.get("GITHUB_RUN_ID") else None,
        "date": report[0].get("timestamp") if report else None,
        "files": len(files),
        "total_seconds": round(sum(f["seconds"] for f in files), 1),
    }
    meta = {k: v for k, v in meta.items() if v is not None}

    out.write_text(json.dumps({"meta": meta, "files": files}, indent=1))
    print(f"{out}: {len(files)} files, {meta['total_seconds']/60:.1f} min total")


if __name__ == "__main__":
    main()
