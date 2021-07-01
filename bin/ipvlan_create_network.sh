#!/bin/bash

#
# Not in use.
#
exit

# 
# Use IPvlan networks
#  - https://docs.docker.com/network/ipvlan/
#
# Prerequisites
#    ...
#  - Kernel requirements
#    * To check your current kernel version, use `uname -r`
#    * IPvlan Linux kernel v4.2+ (support for earlier kernels exists but is buggy)
#

docker network create \
        --driver ipvlan \
	--subnet=192.168.2.0/24 \
	--gateway=192.168.2.1 \
	--aux-address="dev1=192.168.2.251" \
	--aux-address="dev2=192.168.2.252" \
	--aux-address="dev3=192.168.2.253" \
	--aux-address="switch=192.168.2.254" \
	-opt ipvlan_mode=l2 \
	-opt parent=eno1 \
	dev-net
