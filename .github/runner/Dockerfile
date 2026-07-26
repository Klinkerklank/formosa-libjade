# Containerized self-hosted GitHub Actions runner for the bench workflow.
#
# The image carries only the runner agent and basic system tooling (git,
# curl/jq for the entrypoint, taskset). The build toolchain is NOT in the
# image: jobs get it from the repo's flake.nix via `nix develop`, served by
# the host's nix store shared into the container (MOUNT_NIX=1 in
# run-runner.sh) -- so a toolchain bump changes flake.lock, never the image.
#
# No Docker-in-Docker is needed (the workflow is plain make/cc). Run WITHOUT
# --privileged and WITHOUT mounting the docker socket.
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
# git for actions/checkout (submodules), curl/jq for the entrypoint and the
# agent download below, util-linux for taskset (bench core pinning).
RUN apt-get update && apt-get install -y --no-install-recommends \
        git curl jq ca-certificates util-linux \
    && rm -rf /var/lib/apt/lists/*

# The runner agent must not run as root; use a dedicated unprivileged user.
RUN useradd -m runner
WORKDIR /home/runner

# Fetch the latest runner agent (it self-updates on connect anyway), install its
# OS dependencies, then hand ownership to the runner user.
RUN set -eux; \
    ver="$(curl -fsSL https://api.github.com/repos/actions/runner/releases/latest \
           | jq -r .tag_name | sed 's/^v//')"; \
    curl -fsSL -o runner.tar.gz \
      "https://github.com/actions/runner/releases/download/v${ver}/actions-runner-linux-x64-${ver}.tar.gz"; \
    tar xzf runner.tar.gz && rm runner.tar.gz; \
    ./bin/installdependencies.sh; \
    chown -R runner:runner /home/runner

USER runner
COPY --chown=runner:runner entrypoint.sh /home/runner/entrypoint.sh
ENTRYPOINT ["/home/runner/entrypoint.sh"]
