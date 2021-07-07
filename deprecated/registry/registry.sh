#!/bin/bash

# deprecated
exit

docker pull registry:2
docker pull hyper/docker-registry-web:latest

docker volume create registry-server_data
docker volume create registry-web_data

docker run --detach \
	--name registry-server \
	--hostname registry-server \
	--publish 5000:5000 \
	--env REGISTRY_STORAGE_DELETE_ENABLED=true \
	--volume registry-server_data:/var/lib/registry \
	--restart always \
	registry:2

docker run --detach \
	--name registry-web \
	--hostname registry-web \
	--publish 8080:8080 \
	--env REGISTRY_URL=http://registry-server:5000/v2 \
	--env REGISTRY_NAME=localhost:5000 \
	--env REGISTRY_READONLY=false \
	--env REGISTRY_AUTH_ENABLED=false \
	--volume registry-web_data:/data \
	--link registry-server \
	--restart always \
	hyper/docker-registry-web
