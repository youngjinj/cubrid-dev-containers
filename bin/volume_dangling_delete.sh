#!/bin/bash

docker volume ls -f dangling=true

if [ `docker volume ls -f dangling=true -q | wc -l` != 0 ]; then
	docker volume rm $(docker volume ls -f dangling=true -q)
fi
