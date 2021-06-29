#!/bin/bash

docker network create -d ipvlan \
	--subnet=192.168.2.0/24 \
	--gateway=192.168.2.1 \
	--aux-address="dev1=192.168.2.251" \
	--aux-address="dev2=192.168.2.252" \
	--aux-address="dev3=192.168.2.253" \
	--aux-address="switch=192.168.2.254" \
	-o ipvlan_mode=l2 \
	-o parent=eno1 \
	dev-net
