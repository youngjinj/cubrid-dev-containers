#!/bin/bash

if [ $# != 2 ]; then
	echo "$# is Illegal number of parameters."
	echo "Usage: $0 <CONTAINER_NAME> <IP_D_CLASS>"
	exit
fi

CONTAINER_NAME=$1
IP_D_CLASS=$2

DOCKER_HUB_PROJECT="192.168.2.253:5000/rnd-dev"
TAG_NAME="develop:latest"
VOLUME_NAME="develop_${CONTAINER_NAME}_${IP_D_CLASS}_data"

docker pull ${DOCKER_HUB_PROJECT}/${TAG_NAME}

docker volume create ${VOLUME_NAME}

docker run --detach \
	--name ${CONTAINER_NAME} \
	--hostname ${CONTAINER_NAME} \
	--network dev-net \
	--ip=192.168.2.${IP_D_CLASS} \
        --env CREATE_USER_NAME="youngjinj" \
	--volume ${VOLUME_NAME}:/home \
	--volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
	--cap-add=ALL \
	--privileged \
	--restart always \
	${DOCKER_HUB_PROJECT}/${TAG_NAME}
