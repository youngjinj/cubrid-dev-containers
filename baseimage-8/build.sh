#!/bin/bash

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`

VERSION=`cd ${CANONICAL_PATH} && cat version`

# `date -d @$(stat --printf='%Z' ${CANONICAL_PATH}/Dockerfile) -u +'%Y-%m-%dT%H:%M:%SZ'`
CREATED=`date -d @$(cd ${CANONICAL_PATH} && git show --format=%ct | head -1) -u +'%Y-%m-%dT%H:%M:%SZ'`
REVISION=`cd ${CANONICAL_PATH} && git show --format=%h | head -1`

git tag -f v${VERSION}

# branch: `cd ${CANONICAL_PATH} && git symbolic-ref -q --short HEAD`
# tag: `cd ${CANONICAL_PATH} && git describe --tags --exact-match`
REF_NAME=`cd ${CANONICAL_PATH} && git describe --tags --exact-match`

IMAGE_NAME="baseimage"
IMAGE_TAG=${VERSION}

IS_CACHE="Y"
# IS_CACHE="N"

docker pull 192.168.2.253:5000/development/centos-systemd:8.4.2105

if [ ${IS_CACHE} == "Y" ]; then
        docker buildx build \
                --build-arg CREATED=${CREATED} \
                --build-arg VERSION=${VERSION} \
                --build-arg REVISION=${REVISION} \
                --build-arg REF_NAME=${REF_NAME} \
                --rm \
                --tag ${IMAGE_NAME}:${IMAGE_TAG} \
                .
elif [ ${IS_CACHE} == "N" ]; then
        docker build \
                --build-arg CREATED=${CREATED} \
                --build-arg VERSION=${VERSION} \
                --build-arg REVISION=${REVISION} \
                --build-arg REF_NAME=${REF_NAME} \
                --no-cache \
                --rm \
                --tag ${IMAGE_NAME}:${IMAGE_TAG} \
                . > ${CANONICAL_PATH}/build_no-cache_${VERSION}.log
fi
