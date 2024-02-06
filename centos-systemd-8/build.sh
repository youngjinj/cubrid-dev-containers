#!/bin/bash

IMAGE_NAME="centos-systemd"
IMAGE_TAG="8.4.2105"

docker build \
	--rm \
	--tag ${IMAGE_NAME}:${IMAGE_TAG} \
	.
