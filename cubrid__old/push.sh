#!/bin/bash

DOCKER_HUB_PROJECT="192.168.2.253:5000/rnd-dev"
TAG_NAME=`date "+%Y-%m-%d"`

docker tag develop:${TAG_NAME} ${DOCKER_HUB_PROJECT}/develop:${TAG_NAME}
docker push ${DOCKER_HUB_PROJECT}/develop:${TAG_NAME}

docker tag develop:${TAG_NAME} ${DOCKER_HUB_PROJECT}/develop:latest
docker push ${DOCKER_HUB_PROJECT}/develop:latest
