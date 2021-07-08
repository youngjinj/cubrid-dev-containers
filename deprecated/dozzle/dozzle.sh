#!/bin/bash

docker pull amir20/dozzle:latest

docker run --detach \
	--name dozzle \
	--hostname dozzle \
	--publish 8080:8080 \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--restart always \
	amir20/dozzle:latest
