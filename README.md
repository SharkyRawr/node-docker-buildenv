# Node.js Docker Build Environment

A Docker image based on Node.js 25 (Debian Trixie) with additional build tools for Node.js projects. This image is primarily used as a build environment for my personal projects.

## Features

- **Node.js 25**: Latest Node.js runtime on Debian Trixie base
- **pnpm**: Fast, disk space efficient package manager
- **Docker Client**: For Docker-in-Docker scenarios and container builds
- **Git LFS**: Support for Git Large File Storage
- **Build-ready**: Pre-configured environment for CI/CD pipelines

## Usage

### Pull from Registry

```bash
docker pull ghcr.io/sharkyrawr/node-docker-buildenv:latest
```

### Build Locally

```bash
git clone https://github.com/SharkyRawr/node-docker-buildenv.git
cd node-docker-buildenv
docker build -t node-docker-buildenv .
```

### Use in CI/CD

#### GitHub Actions Example

```yaml
jobs:
  build:
    runs-on: ubuntu-latest
    container:
      image: ghcr.io/sharkyrawr/node-docker-buildenv:latest
    steps:
      - uses: actions/checkout@v4
      - name: Install dependencies
        run: pnpm install
      - name: Build project
        run: pnpm build
      - name: Run tests
        run: pnpm test
```

#### GitLab CI Example

```yaml
build:
  image: ghcr.io/sharkyrawr/node-docker-buildenv:latest
  script:
    - pnpm install
    - pnpm build
    - pnpm test
```

### Use as Development Environment

```bash
# Run interactive shell
docker run -it --rm -v $(pwd):/workspace -w /workspace \
  ghcr.io/sharkyrawr/node-docker-buildenv:latest bash

# Run with Docker socket mounted (for Docker-in-Docker)
docker run -it --rm \
  -v $(pwd):/workspace \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -w /workspace \
  ghcr.io/sharkyrawr/node-docker-buildenv:latest bash
```

## Use Cases

- **Node.js project builds**: Consistent build environment across different systems
- **CI/CD pipelines**: Reliable, reproducible builds in containerized environments
- **Docker image builds**: Build Node.js applications that also need to build Docker images
- **Development consistency**: Same environment locally and in CI

## Version Tags

- `latest`: Always points to the most recent build
- `main`: Built from the main branch
- Specific version tags may be available for pinning to specific builds

## Security Considerations

- The image includes the Docker client, which requires mounting the Docker socket for Docker-in-Docker scenarios
- When mounting `/var/run/docker.sock`, ensure you trust the code running in the container
- Consider using specific version tags in production rather than `latest`

## Contributing

This is primarily a personal build environment tailored to my specific needs. I'm not actively seeking pull requests. If you'd like to customize this for your own use, I recommend forking the repository and maintaining your own version.

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.
