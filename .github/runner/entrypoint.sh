#!/usr/bin/env bash
# Register an *ephemeral* self-hosted runner, run one job, then exit. The host
# supervisor (run-runner.sh) launches this with `docker run --rm`, so container
# exit removes it and a fresh container is started for the next job -- nothing
# persists across jobs. A short-lived registration token is minted from
# $ACCESS_TOKEN each start, so the PAT itself is never handed to the runner agent.
set -euo pipefail

: "${REPO:?set REPO=owner/name (e.g. strub/jasmin-nist)}"
: "${ACCESS_TOKEN:?set ACCESS_TOKEN to a PAT that can create runner registration tokens}"
LABELS="${LABELS:?set LABELS=<runner label(s), e.g. bench or proofs>}"
NAME="${RUNNER_NAME:?set RUNNER_NAME=<unique runner name>}"

reg_token() {
  curl -fsSL -X POST \
    -H "Authorization: token ${ACCESS_TOKEN}" \
    -H "Accept: application/vnd.github+json" \
    "https://api.github.com/repos/${REPO}/actions/runners/registration-token" \
    | jq -r .token
}

TOKEN="$(reg_token)"
[ -n "$TOKEN" ] && [ "$TOKEN" != null ] || { echo "failed to mint registration token" >&2; exit 1; }

cleanup() {
  # An ephemeral runner usually deregisters itself; this is best-effort backup.
  ./config.sh remove --token "$(reg_token)" >/dev/null 2>&1 || true
}
trap cleanup EXIT

./config.sh \
    --unattended --replace --ephemeral \
    --url "https://github.com/${REPO}" \
    --token "${TOKEN}" \
    --labels "${LABELS}" \
    --name "${NAME}"

exec ./run.sh
