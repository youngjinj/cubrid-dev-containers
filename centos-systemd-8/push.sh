#!/bin/bash

DOCKER_HUB_PROJECT="192.168.2.253:5000/development"
IMAGE_NAME="centos-systemd"
IMAGE_TAG="8.4.2105"

IMAGE_TAG_PATCH=${IMAGE_TAG}           # X.Y.Z
IMAGE_TAG_MINOR=${IMAGE_TAG_PATCH%\.*} # X.Y
IMAGE_TAG_MAJOR=${IMAGE_TAG_MINOR%\.*} # X
IMAGE_TAG_LATEST="latest"

docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_HUB_PROJECT}/${IMAGE_NAME}:${IMAGE_TAG_PATCH}
docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_HUB_PROJECT}/${IMAGE_NAME}:${IMAGE_TAG_MINOR}
docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_HUB_PROJECT}/${IMAGE_NAME}:${IMAGE_TAG_MAJOR}
docker tag ${IMAGE_NAME}:${IMAGE_TAG} ${DOCKER_HUB_PROJECT}/${IMAGE_NAME}:${IMAGE_TAG_LATEST}

docker push ${DOCKER_HUB_PROJECT}/${IMAGE_NAME}:${IMAGE_TAG_PATCH}
docker push ${DOCKER_HUB_PROJECT}/${IMAGE_NAME}:${IMAGE_TAG_MINOR}
docker push ${DOCKER_HUB_PROJECT}/${IMAGE_NAME}:${IMAGE_TAG_MAJOR}
docker push ${DOCKER_HUB_PROJECT}/${IMAGE_NAME}:${IMAGE_TAG_LATEST}
