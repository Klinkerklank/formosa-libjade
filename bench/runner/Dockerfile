# Containerized self-hosted GitHub Actions runner for the bench workflow.
#
# The image carries only the stable pieces: the runner agent, a C toolchain,
# python/git/make/taskset, and opam. It deliberately does NOT install jasmin or
# EasyCrypt -- the workflow installs those from the repo's jasmin-nist.opam each
# run (they change often), so a version bump needs no image rebuild. Build
# caching is handled by the workflow, not here.
#
# No Docker-in-Docker is needed (the workflow is plain make/cc). Run WITHOUT
# --privileged and WITHOUT mounting the docker socket.
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive
# build-essential/opam for the toolchain the workflow installs; m4/pkg-config/
# libgmp-dev are the usual system deps of the OCaml stack (zarith etc.) so opam
# does not need to shell out for depexts (it has no sudo in the container).
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential python3 git make opam curl jq util-linux \
        ca-certificates m4 pkg-config autoconf \
        libgmp-dev libmpfr-dev libpcre2-dev libppl-dev zlib1g-dev \
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
