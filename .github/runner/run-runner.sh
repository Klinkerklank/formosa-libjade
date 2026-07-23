#!/usr/bin/env bash
# Build the image and supervise a truly ephemeral runner instance: one fresh
# container per job. One supervisor per instance (bench, proofs, ...); every
# instance-identifying variable is MANDATORY so no unit can silently run under
# another instance's identity:
#
#   REPO=strub/jasmin-nist ACCESS_TOKEN=<PAT> \
#   LABELS=bench NAME=bench-runner CPUSET=7 ./run-runner.sh
#
# Each iteration runs `docker run --rm`, and the in-container agent registers as
# `--ephemeral`, so it serves exactly one job and exits; the container is then
# removed and the loop starts a brand-new one. Nothing survives between jobs
# (fresh _work *and* fresh $HOME opam root). This runs in the foreground and
# loops forever -- supervise it with the matching systemd unit
# (bench-runner.service / proofs-runner.service) so it starts on boot and
# restarts if the loop itself dies.
#
# CPUSET (optional) pins the container to a core (recommended for stable bench
# cycles; leave unset for the proofs instance) and is passed through as CPU= so
# taskset targets the same core. The CPU governor is a host setting (see
# README.md) -- not something the container changes.
set -euo pipefail
cd "$(dirname "$0")"

REPO="${REPO:?set REPO=owner/name}"
ACCESS_TOKEN="${ACCESS_TOKEN:?set ACCESS_TOKEN=<PAT that can create runner registration tokens>}"
# Runner label(s) this instance advertises (bench, proofs, ...).
LABELS="${LABELS:?set LABELS=<runner label(s), e.g. bench or proofs>}"
# Instance name: container name and runner-name prefix. MUST be unique per
# instance on a host -- the loop starts with `docker rm -f $NAME`, so two
# supervisors sharing a name kill each other's containers.
NAME="${NAME:?set NAME=<unique instance name, e.g. bench-runner>}"
CPUSET="${CPUSET:-}"
IMAGE="${IMAGE:-jasmin-ci-runner}"

docker build -t "$IMAGE" .

# Clean exit: on SIGINT/SIGTERM stop looping and remove any in-flight container.
running=1
trap 'running=0; docker rm -f "$NAME" >/dev/null 2>&1 || true' INT TERM

echo "supervising ephemeral runner '$NAME' (fresh container per job)${CPUSET:+, pinned to cpu(s) $CPUSET}"
while [ "$running" = 1 ]; do
  # A leftover container from a hard kill would clash with --name; clear it.
  docker rm -f "$NAME" >/dev/null 2>&1 || true
  # No --privileged, no docker socket: the workflow needs neither, and granting
  # them would defeat the container's isolation. --rm discards the container
  # (and its opam root) the moment the one-shot ephemeral job finishes.
  #
  # Run in the background and `wait`: bash only handles signals between
  # foreground commands, so a foreground `docker run` would defer the TERM
  # trap until the job ends and make `systemctl stop` hang until its kill
  # timeout. In `wait` the trap fires immediately, and its `docker rm -f`
  # tears the container down (the container lives under dockerd, outside the
  # unit's cgroup, so systemd cannot kill it directly).
  docker run --rm --name "$NAME" \
      ${CPUSET:+--cpuset-cpus="$CPUSET" -e CPU="$CPUSET"} \
      -e REPO="$REPO" \
      -e ACCESS_TOKEN="$ACCESS_TOKEN" \
      -e LABELS="$LABELS" \
      -e RUNNER_NAME="$NAME-$(hostname)-$$" \
      "$IMAGE" &
  wait $! || true
  # Brief backoff so a registration failure can't spin the loop hot.
  [ "$running" = 1 ] && sleep 2
done
