#!/bin/bash

if [ $# != 2 ]; then
	echo "$# is Illegal number of parameters."
	echo "Usage: $0 <CONTAINER_NAME> <IP_D_CLASS>"
	exit
fi

CONTAINER_NAME=$1
IP_D_CLASS=$2

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`
VERSION=`cd ${CANONICAL_PATH} && cat version`

DOCKER_HUB_PROJECT="192.168.2.253:5000/development"
TAG_NAME="cubrid:${VERSION}"
VOLUME_NAME="development-cubrid_${CONTAINER_NAME}_${IP_D_CLASS}_data"

docker pull ${DOCKER_HUB_PROJECT}/${TAG_NAME}

if [ `docker volume ls --format "{{.Name}}" | grep ${VOLUME_NAME} | wc -l` == 0 ]; then
	docker volume create ${VOLUME_NAME}
fi

docker run --detach \
	--name ${CONTAINER_NAME} \
	--hostname ${CONTAINER_NAME} \
	--network dev-net \
	--ip=192.168.2.${IP_D_CLASS} \
	--volume ${VOLUME_NAME}:/home \
	--volume /sys/fs/cgroup:/sys/fs/cgroup:ro \
	--cap-add=ALL \
	--privileged \
	--restart always \
	${DOCKER_HUB_PROJECT}/${TAG_NAME}

docker exec --interactive --tty ${CONTAINER_NAME} /bin/bash -x /root/create_user_cubrid.sh

${CANONICAL_PATH}/ip_address_update.sh
