#!/bin/bash

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`

CREATED=`date -u +'%Y-%m-%dT%H:%M:%SZ'`
VERSION=`cd ${CANONICAL_PATH} && cat version`
REVISION=`cd ${CANONICAL_PATH} && git log -1 --format=%h`
REF_NAME=`cd ${CANONICAL_PATH} && git symbolic-ref -q --short HEAD`

IMAGE_NAME="cubrid"
IMAGE_TAG=${VERSION}

docker pull 192.168.2.253:5000/development/baseimage:latest

docker buildx build \
	--build-arg CREATED=${CREATED} \
	--build-arg VERSION=${VERSION} \
	--build-arg REVISION=${REVISION} \
	--build-arg REF_NAME=${REF_NAME} \
	--no-cache \
	--rm \
	--tag ${IMAGE_NAME}:${IMAGE_TAG} \
	.
