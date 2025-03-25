#!/bin/bash

# Load environment variables
source ./load-env.sh

# Build the Docker image if it doesn't exist or if Dockerfile has changed
if [[ "$(docker images -q forge-app-dev 2> /dev/null)" == "" || "$1" == "--rebuild" ]]; then
  echo "Building Docker image..."
  docker build -t forge-app-dev .
fi

# Run the container
echo "Starting development environment..."
docker run -it --rm \
  --env-file .env \
  -v $(pwd):/app \
  -p 3000:3000 \
  --name forge-dev \
  forge-app-dev
