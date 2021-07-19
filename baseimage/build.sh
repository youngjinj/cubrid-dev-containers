#!/bin/bash

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`

VERSION=`cd ${CANONICAL_PATH} && cat version`

CREATED=`cd ${CANONICAL_PATH} && cat build_arg | jq .CREATED | sed "s/\"//g"`
REVISION=`cd ${CANONICAL_PATH} && cat build_arg | jq .REVISION | sed "s/\"//g"`
REF_NAME=`cd ${CANONICAL_PATH} && cat build_arg | jq .REF_NAME | sed "s/\"//g"`

IMAGE_NAME="baseimage"
IMAGE_TAG=${VERSION}

# IS_NO_CACHE="Y"
IS_NO_CACHE="N"

docker pull 192.168.2.253:5000/development/centos-systemd:7

if [ ${IS_NO_CACHE} != "Y" ]; then
        docker buildx build \
                --build-arg CREATED=${CREATED} \
                --build-arg VERSION=${VERSION} \
                --build-arg REVISION=${REVISION} \
                --build-arg REF_NAME=${REF_NAME} \
                --rm \
                --tag ${IMAGE_NAME}:${IMAGE_TAG} \
                .
elif [ ${IS_NO_CACHE} == "Y" ]; then
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
