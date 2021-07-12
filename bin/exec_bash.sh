#!/bin/bash

#!/bin/bash

if [ $# != 1 ]; then
	echo "$# is Illegal number of parameters."
	echo "Usage: $0 <CONTAINER_NAME>"
	exit
fi

CONTAINER_NAME=$1

if [ `docker ps --format "{{.Names}}" | grep ${CONTAINER_NAME} | wc -l` != 0 ]; then
	docker exec --interactive --tty ${CONTAINER_NAME} /bin/bash
elif [ `docker ps --all --format "{{.Names}}" | grep ${CONTAINER_NAME} | wc -l` != 0 ]; then
	docker ps --all --filter name=${CONTAINER_NAME} --format {{.Status}}
else
	echo "${CONTAINER_NAME} does not exist."
fi
