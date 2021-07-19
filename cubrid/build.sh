#!/bin/bash

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`

VERSION=`cd ${CANONICAL_PATH} && cat version`
VERSION_BASE=`cd ${CANONICAL_PATH}/../baseimage && cat version`

CREATED=`cd ${CANONICAL_PATH} && cat build_arg | jq .CREATED | sed "s/\"//g"`
REVISION=`cd ${CANONICAL_PATH} && cat build_arg | jq .REVISION | sed "s/\"//g"`
REF_NAME=`cd ${CANONICAL_PATH} && cat build_arg | jq .REF_NAME | sed "s/\"//g"`

IMAGE_NAME="cubrid"
IMAGE_TAG=${VERSION}

docker pull 192.168.2.253:5000/development/baseimage:${VERSION_BASE}

docker buildx build \
        --build-arg VERSION_BASE=${VERSION_BASE} \
	--build-arg CREATED=${CREATED} \
	--build-arg VERSION=${VERSION} \
	--build-arg REVISION=${REVISION} \
	--build-arg REF_NAME=${REF_NAME} \
	--no-cache \
	--rm \
	--tag ${IMAGE_NAME}:${IMAGE_TAG} \
	.
