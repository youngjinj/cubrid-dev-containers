#!/bin/bash

docker pull portainer/agent:latest

docker run --detach \
	--name portainer-agent \
	--hostname portainer-agent \
	--publish 9001:9001 \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--volume /home/docker/volumes:/var/lib/docker/volumes \
	--restart always \
	portainer/agent:latest
