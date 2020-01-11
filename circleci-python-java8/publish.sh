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
# Re-tag

TRUNCATED_HASH=$( \
    docker inspect --format='{{index .RepoDigests 0}}' ${IMAGE_PATH} | \
    sed 's/.*@sha256:\(.*\)/\1/' | \
    head -c 6
)
HASHED_IMAGE_PATH=${IMAGE_PATH}-${TRUNCATED_HASH}

echo -e "\nRe-tagging as ${HASHED_IMAGE_PATH}\n"
docker tag ${IMAGE_PATH} ${HASHED_IMAGE_PATH}

#
# Push

echo -e "\nPushing ${HASHED_IMAGE_PATH}\n"
docker push ${HASHED_IMAGE_PATH}

docker login -u ${GITHUB_USERNAME} -p ${GITHUB_TOKEN} docker.pkg.github.com
