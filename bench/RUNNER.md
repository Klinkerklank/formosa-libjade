# Self-hosted bench runner

One-time setup for the machine that runs [`.github/workflows/bench.yml`](../.github/workflows/bench.yml).
The workflow benchmarks the backends and writes the report to the run's Job
Summary; everything here is the host-side provisioning it assumes.

## Security model (this is a public repo)

A self-hosted runner executes job code on your machine, so on a **public** repo
it is an RCE vector. The workflow is built to contain that:

- **No fork code ever runs** (the primary defense). PR runs are gated on the
  `bench` *label* **and** `head.repo == this repo`, so only branches pushed into
  the repo by collaborators are benched. A labeled fork PR is skipped.
- **The PR can't weaken the gate.** `pull_request_target` runs the workflow file
  from the **base branch**, not the PR's copy, so a PR cannot edit the gate or
  steps to bypass these checks. (It can still change the `src/`/`bench/` code we
  build and run — that is what the same-repo gate above contains.)
- **Nothing to exfiltrate.** A `pull_request_target` job runs in the trusted base
  context and *could* read `secrets.*` by default, but this workflow references
  **no secrets** and sets `permissions: contents: read` (a read-only
  `GITHUB_TOKEN`), so checked-out code has nothing sensitive to steal.

Operational rules:

- **Review the diff before adding the `bench` label** to any PR.
- Run the agent as a **dedicated unprivileged user** (the container path below
  does this for you), and restrict its network egress.
- Do **not** relax the `head.repo == this repo` gate to bench forks unless you
  fully accept arbitrary-code execution on this host.

## Option A — containerized runner (recommended)

[`runner/`](runner/) builds a small image with the runner agent + a C/opam
toolchain. `run-runner.sh` then supervises a loop that starts **one fresh
container per job**: each iteration is `docker run --rm` with the in-container
agent registered `--ephemeral`, so it serves a single job and exits, the
container (and its whole filesystem) is removed, and the next job gets a
brand-new one. Job code never touches the host filesystem and nothing — not
`_work`, not `$HOME`/opam root — persists between jobs. The image does **not**
contain jasmin/EasyCrypt — the workflow installs those from `jasmin-nist.opam`
(so a version bump needs no image rebuild).

For a quick manual test you can run the loop in the foreground:

```
cd bench/runner
REPO=strub/jasmin-nist ACCESS_TOKEN=<PAT> ./run-runner.sh   # Ctrl-C to stop
```

For a persistent runner, supervise it with the provided systemd **user** unit
so it starts on boot and restarts if the loop dies (this replaces docker's
`--restart=always`, which cannot give a fresh container per job):

```
loginctl enable-linger "$USER"
mkdir -p ~/.config/systemd/user ~/.config/bench-runner
cp bench-runner.service ~/.config/systemd/user/
printf 'REPO=strub/jasmin-nist\nACCESS_TOKEN=<PAT>\nCPUSET=7\n' > ~/.config/bench-runner/env
chmod 600 ~/.config/bench-runner/env
# edit ExecStart in the unit to point at this checkout, then:
systemctl --user daemon-reload
systemctl --user enable --now bench-runner        # logs: journalctl --user -u bench-runner -f
```

- `ACCESS_TOKEN` is a PAT allowed to create runner registration tokens (classic
  `repo` scope, or a fine-grained token with repository **Administration: write**).
  `entrypoint.sh` mints a short-lived registration token from it each start, so
  the PAT is never given to the runner agent. Pass it via env / the unit's
  `EnvironmentFile` — do not commit it.
- `CPUSET=<core>` pins the container to one core and forwards it to the bench as
  `CPU=`; omit to let the Makefile's `taskset` pin. Under rootless Docker
  `--cpuset-cpus` needs a `Delegate=cpuset` drop-in, so leaving it unset is
  simplest (the in-container `taskset` still pins).
- The container needs **no `--privileged`** and **no docker socket** (the
  workflow is plain `make`/`cc`); `run-runner.sh` grants neither.
- **Every job rebuilds the toolchain** (OCaml + jasmin + EasyCrypt) in the fresh
  container, since nothing is persisted — wire up GitHub Actions caching (e.g.
  an `~/.opam` cache keyed on `jasmin-nist.opam`) in the workflow if that gets
  slow. Do **not** reintroduce persistence in the runner (a persisted `$HOME`
  is exactly what made the toolchain silently survive before).

## Option B — bare-metal runner

Install the GitHub Actions runner agent for `strub/jasmin-nist` (Settings →
Actions → Runners → New self-hosted runner) and configure it as a dedicated
unprivileged user with the `bench` label so `runs-on: [self-hosted, linux, x64,
bench]` matches:

```
./config.sh --url https://github.com/strub/jasmin-nist --token <TOKEN> --labels bench
./run.sh        # or install as a service: sudo ./svc.sh install <user> && sudo ./svc.sh start
```

The runner user just needs `opam` plus a C toolchain (`build-essential`,
`m4`, `pkg-config`, `libgmp-dev`), `python3`, `git`, and `make` on `PATH`. The
**workflow itself** creates the `jasmin-bench` switch (name = `CI_OPAM_SWITCH`)
and runs `opam install . --deps-only` (jasmin + EasyCrypt) against the checkout,
using the runner's default opam root (`~/.opam`), which on a persistent bare-metal
runner survives across jobs — so the toolchain build is naturally reused there.

(True `--ephemeral` on bare metal needs an autoscaler to re-register after each
job; for one fixed box, run persistently and rely on the same-repo gate — or use
Option A, which gives ephemeral cleanly.)

## Frequency (stable cycle counts) — host, both options

The workflow does not change CPU frequency (no sudo in CI); it relies on the
core-pinning + warm-up in the Makefile. For stable numbers, pin the governor
**once, out of band** (root):

```
cpupower frequency-set -g performance
echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo   # lock to base clock
```

Make it persistent with a `systemd` unit or `tuned` so the report's Environment
block reads `freq governor: performance` across reboots.

## What the workflow runs

`checkout` (no submodules) → explicit `submodule update --init` of the four
`third_party` libs + `formosa-keccak` → **toolchain** (`opam install . --deps-only`
from `jasmin-nist.opam` into the `jasmin-bench` switch) → `make -C src` +
`make -C bench libs` → `make -C bench test` (KAT gate) → `make -C bench report` →
append `bench.md` to `$GITHUB_STEP_SUMMARY`. The core to pin is auto-selected
(highest-max-MHz core); override per run with the Makefile's `CPU=` if needed.
