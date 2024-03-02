#!/usr/bin/env bash

set -e
set -x

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

docker build -t khulnasoft/node-frontend:10 .

docker build -t khulnasoft/node-frontend:latest .

docker push khulnasoft/node-frontend:10

docker push khulnasoft/node-frontend:latest
