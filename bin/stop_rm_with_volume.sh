#!/bin/bash

# deprecated
# exit

if [ $# != 1 ]; then
	echo "$# is Illegal number of parameters."
	echo "Usage: $0 <CONTAINER_NAME>"
	exit
fi

CONTAINER_NAME=$1

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`

CONTAINER_VOLUME_LIST=`docker inspect ${CONTAINER_NAME} --format '{{range .Mounts}}{{if eq .Type "volume"}}{{printf "%s\n" .Name}}{{end}}{{end}}'`

if [ `docker ps --format "{{.Names}}" | grep ${CONTAINER_NAME} | wc -l` != 0 ]; then
	docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME}
elif [ `docker ps -a --format "{{.Names}}" | grep ${CONTAINER_NAME} | wc -l` != 0 ]; then
	docker rm ${CONTAINER_NAME}
fi

for CONTAINER_VOLUME in ${CONTAINER_VOLUME_LIST[@]}; do
	docker volume rm ${CONTAINER_VOLUME}
done

