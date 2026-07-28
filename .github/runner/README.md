# Self-hosted bench runners

Host-side provisioning for the machines behind
[`bench.yml`](../workflows/bench.yml) (cycle benchmarks): one **matrix job
per bench machine**, each machine's runner advertising a
`bench-<microarchitecture>` label (e.g. `bench-skylake`) and running one
ephemeral container per job.

The workflow builds its toolchain from the repo's `flake.nix` (derived from
`jasmin-nist.opam` via opam-nix) with `nix develop`; nothing is cached on
the GitHub side.

## Security model (designed for a public repo)

A self-hosted runner executes job code on your machine, so on a **public**
repo it is an RCE vector. The bench workflow is built to contain that:

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

## Bench machine — containerized runner

This directory builds a small image with the runner agent and basic system
tooling. `run-runner.sh` then supervises a loop that starts **one fresh
container per job**: each iteration is `docker run --rm` with the in-container
agent registered `--ephemeral`, so it serves a single job and exits, the
container (and its whole filesystem) is removed, and the next job gets a
brand-new one. Job code never touches the host filesystem and nothing in
`$HOME` or `_work` persists between jobs.

The toolchain (jasminc + the pinned C compiler from `devShells.bench`) is
**not** in the image: jobs get it via `nix develop`, served by the host's nix
store shared into the container (`MOUNT_NIX=1`, below) — so a jasmin or
compiler bump changes `flake.lock`, never the image.

For a quick manual test you can run the loop in the foreground:

```
cd .github/runner
REPO=<owner>/<repo> ACCESS_TOKEN=<PAT> LABELS=bench-skylake NAME=bench-runner MOUNT_NIX=1 ./run-runner.sh   # Ctrl-C to stop
```

All instance variables (required and optional) are documented in one place:
**the header of [`run-runner.sh`](run-runner.sh)**.

For a persistent runner, supervise it with the provided systemd **user** unit
so it starts on boot and restarts if the loop dies (this replaces docker's
`--restart=always`, which cannot give a fresh container per job):

```
loginctl enable-linger "$USER"
mkdir -p ~/.config/systemd/user ~/.config/bench-runner
cp bench-runner.service ~/.config/systemd/user/
printf 'REPO=<owner>/<repo>\nACCESS_TOKEN=<PAT>\nLABELS=bench-skylake\nNAME=bench-runner\nCPUSET=7\nMOUNT_NIX=1\n' > ~/.config/bench-runner/env
chmod 600 ~/.config/bench-runner/env
# edit ExecStart in the unit to point at this checkout, then:
systemctl --user daemon-reload
systemctl --user enable --now bench-runner        # logs: journalctl --user -u bench-runner -f
```

Operational notes:

- The PAT goes in the unit's `EnvironmentFile` (as above) — do not commit it.
- Under rootless Docker `--cpuset-cpus` needs a `Delegate=cpuset` drop-in, so
  leaving `CPUSET` unset is simplest (the in-container `taskset` still pins).
- The container needs **no `--privileged`** and **no docker socket**;
  `run-runner.sh` grants neither.
- Do **not** reintroduce a persisted `$HOME` in the runner (a persisted
  `$HOME` is exactly what made the opam-era toolchain silently survive
  between jobs); the nix store sharing below is the supported way to carry
  the toolchain.

## Sharing the host nix store with job containers (`MOUNT_NIX=1`)

On an ephemeral-container runner the job needs a nix store that survives
between jobs; share the **host's** store instead of caching.

One-time host setup (multi-user nix, daemon mode — run as a sudo-capable
user; the Debian `nix-bin` package does *not* fit here, its nix lives outside
`/nix` and its socket is group-gated):

```
sh <(curl -L https://nixos.org/nix/install) --daemon
```

Then set `MOUNT_NIX=1` in the instance env (e.g. `~/.config/bench-runner/env`)
and restart the unit (what the flag mounts, and why this preserves the
isolation model, is documented with the variable in `run-runner.sh`).
Occasional `nix-collect-garbage --delete-older-than 30d` on the host keeps
the store bounded.

## Frequency (stable cycle counts) — host setting

The workflow does not change CPU frequency (no sudo in CI); it relies on the
core-pinning + warm-up in the Makefile. For stable numbers, pin the governor
**once, out of band** (root):

```
cpupower frequency-set -g performance
echo 1 > /sys/devices/system/cpu/intel_pstate/no_turbo   # lock to base clock
```

Make it persistent with a `systemd` unit or `tuned` so the report's Environment
block reads `freq governor: performance` across reboots.

## What the bench workflow runs

Per matrix job (one per `bench-*` machine): `checkout` (with submodules — the
`third_party` reference implementations) → **toolchain** (`nix develop .#bench`
against the shared host store; seconds when warm) → `make -C src` +
`make -C bench libs` → `make -C bench test` (KAT gate) → `make -C bench report`
→ append `bench.md` to that job's `$GITHUB_STEP_SUMMARY`. The core to pin is
auto-selected (highest-max-MHz core); override per run with the Makefile's
`CPU=` if needed.
