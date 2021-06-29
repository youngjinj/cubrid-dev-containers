#!/bin/bash

DEV_DOCKER_HUB="dev-docker-hub:5000"
TAG_NAME="develop:20210624"

docker tag ${TAG_NAME} ${DEV_DOCKER_HUB}/${TAG_NAME}
docker push ${DEV_DOCKER_HUB}/${TAG_NAME}
