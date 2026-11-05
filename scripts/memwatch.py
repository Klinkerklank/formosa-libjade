#!/usr/bin/env python3
"""Sample the resident memory of a proof-checking run (Linux).

    memwatch.py OUT [INTERVAL]

Every INTERVAL seconds (default 1) until SIGTERM or SIGINT, appends to OUT
one JSON line {"t": <seconds since start>, "total": <bytes>, "easycrypt":
<bytes>, "provers": <bytes>}: the resident memory of all the processes
visible in /proc (the job's container), and of the easycrypt processes and
the SMT provers among them. A short process can fall between two samples;
it has little memory by construction.
"""

import json
import os
import signal
import sys
import time

PROVERS = ("z3", "cvc5", "alt-ergo", "alt-ergo-free")


def processes():
    """pid -> (name, parent pid, resident bytes) of the processes in /proc"""
    procs = {}
    for pid in os.listdir("/proc"):
        if not pid.isdigit():
            continue
        try:
            with open(f"/proc/{pid}/status") as f:
                st = dict(l.split(":", 1) for l in f if ":" in l)
        except OSError:
            continue
        rss = st.get("VmRSS")
        if not rss:
            continue                    # kernel threads
        procs[pid] = (st.get("Name", "").strip(), st.get("PPid", "").strip(),
                      int(rss.split()[0]) * 1024)
    return procs


def sample():
    total = ec = provers = 0
    procs = processes()
    for pid, (name, ppid, b) in procs.items():
        # easycrypt starts a prover by forking itself: until the child
        # executes the prover, it has easycrypt's name and resident memory
        # (shared with its parent), which must not be counted twice
        if "easycrypt" in name and "easycrypt" in procs.get(ppid, ("",))[0]:
            continue
        total += b
        if "easycrypt" in name:
            ec += b
        elif name in PROVERS:
            provers += b
    return {"total": total, "easycrypt": ec, "provers": provers}


def main():
    out = sys.argv[1]
    interval = float(sys.argv[2]) if len(sys.argv) > 2 else 1.0
    stop = []
    for sig in (signal.SIGINT, signal.SIGTERM):
        signal.signal(sig, lambda *_: stop.append(True))
    t0 = time.monotonic()
    with open(out, "a") as f:
        while not stop:
            s = sample()
            s["t"] = round(time.monotonic() - t0, 1)
            f.write(json.dumps(s) + "\n")
            f.flush()
            time.sleep(interval)


if __name__ == "__main__":
    main()
