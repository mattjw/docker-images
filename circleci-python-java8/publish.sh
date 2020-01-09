#!/usr/bin/env bash
#
# Set `GITHUB_TOKEN` env var before executing

set -e
set -u

#
# Params

GITHUB_USERNAME="mattjw"
GITHUB_REPO="docker-images"

IMAGE_NAME="circleci-python-java8"
IMAGE_TAG="3.6.8"

#
# Build and publish

docker login -u ${GITHUB_USERNAME} -p ${GITHUB_TOKEN} docker.pkg.github.com

IMAGE_PATH="docker.pkg.github.com/${GITHUB_USERNAME}/${GITHUB_REPO}/${IMAGE_NAME}:${IMAGE_TAG}"

echo "Building ${IMAGE_PATH}"
docker build -t "${IMAGE_PATH}" .

echo "Pushing ${IMAGE_PATH}"
docker push ${IMAGE_PATH}
