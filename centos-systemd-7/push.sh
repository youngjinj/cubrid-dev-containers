#!/bin/bash

DOCKER_HUB_PROJECT="192.168.2.253:5000/rnd-dev"
TAG_NAME="centos-systemd:7"

docker tag ${TAG_NAME} ${DOCKER_HUB_PROJECT}/${TAG_NAME}
docker push ${DOCKER_HUB_PROJECT}/${TAG_NAME}
