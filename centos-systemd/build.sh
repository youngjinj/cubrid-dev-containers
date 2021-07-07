#!/bin/bash

IMAGE_NAME="centos-systemd"
IMAGE_TAG="7"

docker buildx build \
	--rm \
	--tag ${IMAGE_NAME}:${IMAGE_TAG} \
	.
