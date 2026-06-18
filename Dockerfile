FROM node:lts-trixie
ARG PNPM_VERSION=11.7.0
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends -y git-lfs unzip curl wget ca-certificates sudo && apt clean && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*

# Node.js v25+ no longer ships Corepack, so install it explicitly and
# activate a pinned pnpm release on the system PATH for CI containers.
ENV COREPACK_DEFAULT_TO_LATEST=0
RUN npm install --global corepack@latest \
    && corepack install --global "pnpm@${PNPM_VERSION}" \
    && pnpm --version

RUN curl -fsSL https://get.docker.com -o get-docker.sh && chmod 755 get-docker.sh && ./get-docker.sh && rm ./get-docker.sh

LABEL org.opencontainers.image.title="node-25-docker" \
      org.opencontainers.image.description="node:25-trixie base image with Docker client and pinned pnpm installed" \
      org.opencontainers.image.authors="SharkyRawr" \
      org.opencontainers.image.url="https://github.com/SharkyRawr/node-docker-buildenv" \
      org.opencontainers.image.source="https://github.com/SharkyRawr/node-docker-buildenv" \
      org.opencontainers.image.licenses="Apache-2.0"
