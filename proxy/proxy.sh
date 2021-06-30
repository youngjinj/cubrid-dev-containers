#!/bin/bash

docker pull nginx:latest

docker run --detach \
	--name proxy \
	--hostname proxy \
        --network host \
	--volume /home/docker_build/proxy/nginx.conf:/etc/nginx/nginx.conf \
	--restart always \
	nginx:latest
