#!/usr/bin/env python3
"""The results of the checks workflow as one JSON record per commit.

  checks-record.py run OUT CHECK TARGET -- CMD...
      run CMD, print its output, append its result to OUT (JSON lines) and
      exit with its status
  checks-record.py tool OUT NAME -- CMD...
      append the first line printed by CMD as the version of the tool NAME
  checks-record.py merge OUT FRAGMENT...
      write the record of the commit checked out: its meta (commit, run,
      tools, the conclusion of each job, from the JOBS environment variable:
      the workflow's `toJSON(needs)`; the end of the log of each job that
      failed, from <JOB_LOGS>/<job>.log when JOB_LOGS names a directory) and
      the results of every fragment

A result is {"check", "target", "ok", "seconds"}, with the line of the
output that states the result as "summary" when there is one, and the last
lines of the output as "tail" when the check fails. The record has the
shape publish-result expects ("meta" with the full commit hash, "results").
"""

import datetime
import json
import os
import re
import subprocess
import sys
import time

# the lines that state a check's result: the totals of kat.py, the verdict
# of memcheck.c, the last words of check-extraction
SUMMARY = re.compile(r"\d+ passed, \d+ failed|: (ok|FAILED)$|up to date$")


def append(out, entry):
    with open(out, "a") as f:
        f.write(json.dumps(entry) + "\n")


def command(argv):
    if "--" not in argv:
        sys.exit("missing -- before the command")
    i = argv.index("--")
    return argv[:i], argv[i + 1:]


def run(argv):
    (out, check, target), cmd = command(argv)
    start = time.monotonic()
    p = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                         text=True, errors="replace")
    lines = []
    for line in p.stdout:
        sys.stdout.write(line)
        sys.stdout.flush()
        lines.append(line.rstrip("\n"))
        del lines[:-40]
    rc = p.wait()
    shown = [l for l in lines if l.strip()]
    entry = {"check": check, "target": target, "ok": rc == 0,
             "seconds": round(time.monotonic() - start, 1)}
    summary = [l for l in shown if SUMMARY.search(l)]
    if summary:
        entry["summary"] = summary[-1].strip()
    if rc != 0:
        entry["tail"] = shown[-20:]
    append(out, {"result": entry})
    return rc


def tool(argv):
    (out, name), cmd = command(argv)
    try:
        r = subprocess.run(cmd, capture_output=True, text=True, errors="replace")
        lines = (r.stdout + r.stderr).splitlines()
        version = lines[0].strip() if lines else ""
    except OSError as e:
        version = f"unavailable ({e.strerror})"
    print(f"{name}: {version}")
    append(out, {"tool": {name: version}})
    return 0


def git(*args):
    try:
        return subprocess.run(["git", *args], capture_output=True, text=True,
                              check=True).stdout.strip()
    except (OSError, subprocess.CalledProcessError):
        return None


def log_tail(text, n=30):
    """the last n lines of a job log up to its last error, without the
    timestamps GitHub puts in front of every line"""
    lines = [re.sub(r"^\d{4}-\d\d-\d\dT[\d:.]+Z ", "", l) for l in text.splitlines()]
    errors = [i for i, l in enumerate(lines) if "##[error]" in l]
    end = errors[-1] + 1 if errors else len(lines)
    return lines[max(0, end - n):end]


def merge(argv):
    out, fragments = argv[0], argv[1:]
    tools, results = {}, []
    for path in fragments:
        for line in open(path):
            if line.strip():
                d = json.loads(line)
                tools.update(d.get("tool", {}))
                if "result" in d:
                    results.append(d["result"])
    jobs = {name: v.get("result")
            for name, v in json.loads(os.environ.get("JOBS") or "{}").items()}
    logs = {}
    if os.environ.get("JOB_LOGS"):
        for job, result in jobs.items():
            path = os.path.join(os.environ["JOB_LOGS"], f"{job}.log")
            if result != "success" and os.path.exists(path):
                logs[job] = log_tail(open(path, errors="replace").read())
    commit = git("rev-parse", "HEAD") or os.environ.get("GITHUB_SHA")
    env = os.environ.get
    run_url = (f"{env('GITHUB_SERVER_URL')}/{env('GITHUB_REPOSITORY')}"
               f"/actions/runs/{env('GITHUB_RUN_ID')}") if env("GITHUB_RUN_ID") else None
    meta = {
        "repo": env("GITHUB_REPOSITORY"),
        "branch": env("GITHUB_REF_NAME"),
        "event": env("GITHUB_EVENT_NAME"),
        "commit": commit,
        "commit_date": git("show", "-s", "--format=%cI", "HEAD"),
        "subject": git("show", "-s", "--format=%s", "HEAD"),
        "run_id": int(env("GITHUB_RUN_ID")) if env("GITHUB_RUN_ID") else None,
        "run_url": run_url,
        "date": datetime.datetime.now(datetime.timezone.utc)
                .isoformat(timespec="seconds"),
        "tools": tools,
        "jobs": jobs,
        "job_logs": logs,
        "ok": all(r["ok"] for r in results)
              and all(v == "success" for v in jobs.values()),
    }
    results.sort(key=lambda r: (r["check"], r["target"]))
    json.dump({"meta": meta, "results": results}, open(out, "w"), indent=1)
    failed = [f"{r['check']}/{r['target']}" for r in results if not r["ok"]]
    print(f"{out}: {len(results)} results, {len(failed)} failed"
          + (f" ({', '.join(failed)})" if failed else ""))
    return 0


def main():
    if len(sys.argv) < 3 or sys.argv[1] not in ("run", "tool", "merge"):
        sys.exit(__doc__)
    return {"run": run, "tool": tool, "merge": merge}[sys.argv[1]](sys.argv[2:])


if __name__ == "__main__":
    sys.exit(main())
