#!/bin/bash

if [ $# != 2 ]; then
	echo "$# is Illegal number of parameters."
	echo "Usage: $0 <CONTAINER_NAME> <IP_D_CLASS>"
	exit
fi

CONTAINER_NAME=$1
IP_D_CLASS=$2

TAG_NAME="develop:test"

docker run \
	--name ${CONTAINER_NAME} \
	--hostname ${CONTAINER_NAME} \
	--network dev-net \
	--ip=192.168.2.${IP_D_CLASS} \
	--dns=1.1.1.1 \
	--dns=8.8.8.8 \
	--dns=8.8.4.4 \
	--privileged \
	--detach \
	${TAG_NAME}
