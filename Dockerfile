FROM node:25-trixie
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y git-lfs && apt clean && rm -rf /var/cache/apt/archives /var/lib/apt/lists/*
RUN curl -fsSL https://get.pnpm.io/install.sh -o install-pnpm.sh && chmod +x install-pnpm.sh && SHELL=bash ./install-pnpm.sh && rm install-pnpm.sh
RUN curl -fsSL https://get.docker.com -o get-docker.sh && chmod 755 get-docker.sh && ./get-docker.sh && rm ./get-docker.sh

LABEL org.opencontainers.image.title="node-25-docker" \
      org.opencontainers.image.description="Node.js 25:trixie base image with Docker client installed" \
      org.opencontainers.image.authors="SharkyRawr" \
      org.opencontainers.image.url="https://github.com/SharkyRawr/node-docker-buildenv" \
      org.opencontainers.image.source="https://github.com/SharkyRawr/node-docker-buildenv" \
      org.opencontainers.image.licenses="Apache-2.0"
