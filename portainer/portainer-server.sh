#!/bin/bash

docker pull portainer/portainer-ce:latest

docker volume create portainer-server_data

docker run --detach \
	--name portainer-server \
	--hostname portainer-server \
	--publish 8000:8000 \
	--publish 9000:9000 \
	--volume /var/run/docker.sock:/var/run/docker.sock \
	--volume portainer-server_data:/data \
	--restart always \
	portainer/portainer-ce:latest
