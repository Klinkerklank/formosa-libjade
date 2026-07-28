#!/usr/bin/env bash
# Register an *ephemeral* self-hosted runner, run one job, then exit. The host
# supervisor (run-runner.sh) launches this with `docker run --rm`, so container
# exit removes it and a fresh container is started for the next job -- nothing
# persists across jobs. A short-lived registration token is minted from
# $ACCESS_TOKEN each start, so the PAT itself is never handed to the runner
# agent. All variables are set by the supervisor and documented in
# run-runner.sh.
set -euo pipefail

REPO="${REPO:?see run-runner.sh}"
ACCESS_TOKEN="${ACCESS_TOKEN:?see run-runner.sh}"
LABELS="${LABELS:?see run-runner.sh}"
NAME="${RUNNER_NAME:?see run-runner.sh}"

reg_token() {
  curl -fsSL -X POST \
    -H "Authorization: token ${ACCESS_TOKEN}" \
    -H "Accept: application/vnd.github+json" \
    "https://api.github.com/repos/${REPO}/actions/runners/registration-token" \
    | jq -r .token
}

# When the supervisor shares the host nix store (MOUNT_NIX=1), expose the
# host's default nix profile so job steps find the `nix` CLI on PATH.
if [ -d /nix/var/nix/profiles/default/bin ]; then
  export PATH="$PATH:/nix/var/nix/profiles/default/bin"
fi

TOKEN="$(reg_token)"
[ -n "$TOKEN" ] && [ "$TOKEN" != null ] || { echo "failed to mint registration token" >&2; exit 1; }

cleanup() {
  # Best-effort deregistration if we fail before handing over to the agent
  # (after the exec below, an ephemeral runner deregisters itself).
  ./config.sh remove --token "$(reg_token)" >/dev/null 2>&1 || true
}
trap cleanup EXIT

./config.sh \
    --unattended --replace --ephemeral \
    --url "https://github.com/${REPO}" \
    --token "${TOKEN}" \
    --labels "${LABELS}" \
    --name "${NAME}"

# Job steps run as this same user and could read the agent's environment via
# /proc; drop the PAT (and the spent registration token) before handing over.
# (exec never runs the EXIT trap, so cleanup loses nothing here.)
unset ACCESS_TOKEN TOKEN
exec ./run.sh
