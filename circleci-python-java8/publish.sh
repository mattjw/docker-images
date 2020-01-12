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

echo -e "\nGenerating image tag with hash\n"

TRUNCATED_HASH=$( \
    docker inspect --format='{{.Id}}' ${IMAGE_PATH} | \
    cut -d ':' -f 2 | \
    head -c 6 \
)
if [[ -z "${TRUNCATED_HASH}" ]]; then
    echo "Failed to obtain truncated hash ${TRUNCATED_HASH}"
    exit 1
fi

HASHED_IMAGE_PATH=${IMAGE_PATH}-${TRUNCATED_HASH}

echo -e "Image with hash: ${HASHED_IMAGE_PATH}"
docker tag ${IMAGE_PATH} ${HASHED_IMAGE_PATH}

#
# Push

docker login -u ${GITHUB_USERNAME} -p ${GITHUB_TOKEN} docker.pkg.github.com

echo -e "\nPushing ${IMAGE_PATH}\n"
docker push ${IMAGE_PATH}

echo -e "\nPushing ${HASHED_IMAGE_PATH}\n"
docker push ${HASHED_IMAGE_PATH}
