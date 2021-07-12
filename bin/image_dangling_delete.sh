#!/bin/bash

docker image ls -f dangling=true

if [ `docker image ls -f dangling=true -q | wc -l` != 0 ]; then
	docker image rm $(docker image ls -f dangling=true -q)
fi
