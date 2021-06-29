#!/bin/bash

docker run \
  --name portainer-agent \
  --hostname portainer-agent \
  --publish 9001:9001 \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  --volume /home/docker/volumes:/var/lib/docker/volumes \
  --restart always \
  --detach \
   portainer/agent
