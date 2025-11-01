# SolidBench Multiple Vocabulary

A SolidBench instance configured to work with multiple vocabularies for testing and development.

## Prerequisites

- [Node.js 20](https://nodejs.org/en/download)
- [Yarn](https://yarnpkg.com/getting-started/install)
- [Docker](https://docs.docker.com/engine/install/)

## Local Development

Run SolidBench directly on your local machine:

```sh
# Install dependencies and submodules
./install.sh

# Generate benchmark data
yarn run solidbench-generate

# Start the server
yarn run solidbench-serve
```

The server will be available at http://localhost:4099

## Docker Deployment

### Why this approach?

SolidBench data generation requires Docker access, making it impractical to generate fragments during the Docker image build process. Additionally, the generated data can be quite large.

Our solution: Generate data locally first, then use Docker only for hosting with a volume mount for the generated resources.

### Steps

1. Generate data locally:

```sh
./install.sh
yarn run solidbench-generate
```

2. Build the Docker image:

```sh
docker buildx build -t solidbench-multiple-vocab --load .
```

3. Run the container:

```sh
docker run --name solidbench-multiple-vocab \
  -p 4099:4099 \
  -v $(pwd)/out-fragments:/app/out-fragments \
  solidbench-multiple-vocab
```

4. Access the server at http://localhost:4099
