#!/usr/bin/env bash
# Build the image and supervise a truly ephemeral bench runner: one fresh
# container per job.
#
#   REPO=strub/jasmin-nist ACCESS_TOKEN=<PAT> CPUSET=7 ./run-runner.sh
#
# Each iteration runs `docker run --rm`, and the in-container agent registers as
# `--ephemeral`, so it serves exactly one job and exits; the container is then
# removed and the loop starts a brand-new one. Nothing survives between jobs
# (fresh _work *and* fresh $HOME opam root). This runs in the foreground and
# loops forever -- supervise it with the systemd unit (bench-runner.service) so
# it starts on boot and restarts if the loop itself dies.
#
# CPUSET pins the container to a core (recommended for stable cycles) and is
# passed through to the bench as CPU= so taskset targets the same core. Leave it
# unset to let the Makefile pick/pin a core itself. The CPU governor is a host
# setting (see RUNNER.md) -- not something the container changes.
set -euo pipefail
cd "$(dirname "$0")"

REPO="${REPO:?set REPO=owner/name}"
ACCESS_TOKEN="${ACCESS_TOKEN:?set ACCESS_TOKEN=<PAT that can create runner registration tokens>}"
CPUSET="${CPUSET:-}"
IMAGE="${IMAGE:-jasmin-bench-runner}"
NAME="${NAME:-bench-runner}"

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
  docker run --rm --name "$NAME" \
      ${CPUSET:+--cpuset-cpus="$CPUSET" -e CPU="$CPUSET"} \
      -e REPO="$REPO" \
      -e ACCESS_TOKEN="$ACCESS_TOKEN" \
      -e LABELS=bench \
      "$IMAGE" || true
  # Brief backoff so a registration failure can't spin the loop hot.
  [ "$running" = 1 ] && sleep 2
done
