#!/bin/bash

IMAGE_NAME="centos-systemd"
IMAGE_TAG="7.9.2009"

docker build \
	--rm \
	--tag ${IMAGE_NAME}:${IMAGE_TAG} \
	.
