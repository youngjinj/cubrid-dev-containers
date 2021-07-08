#!/bin/bash

GIT_PATH='/home/docker_build'

CREATED=`date -u +'%Y-%m-%dT%H:%M:%SZ'`
VERSION='0.0.1'
REVISION=`cd ${GIT_PATH} && git log -1 --format=%h`
REF_NAME=`cd ${GIT_PATH} && git symbolic-ref -q --short HEAD || git describe --tags --exact-match`

docker buildx build \
	--build-arg CREATED=${CREATED} \
	--build-arg VERSION=${VERSION} \
	--build-arg REVISION=${REVISION} \
	--build-arg REF_NAME=${REF_NAME} \
	--rm \
        --tag develop:${VERSION} \
	.
