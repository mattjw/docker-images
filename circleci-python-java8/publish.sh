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
IMAGE_TAG="py3.6.8"

#
# Build

IMAGE_PATH="docker.pkg.github.com/${GITHUB_USERNAME}/${GITHUB_REPO}/${IMAGE_NAME}:${IMAGE_TAG}"

echo -e "\nBuilding ${IMAGE_PATH}\n"
docker build -t "${IMAGE_PATH}" .

#
# Push

docker login -u ${GITHUB_USERNAME} -p ${GITHUB_TOKEN} docker.pkg.github.com

echo -e "\nPushing ${IMAGE_PATH}\n"
docker push ${IMAGE_PATH}
