#!/bin/bash

# deprecated
exit

REBUILD=$1

if [ $# != 0 ] && [ -n "${REBUILD}" ]  && [ "${REBUILD^^}" = "REBUILD" ]; then
	docker network rm dev-net
fi

#
# IP Subnet Calculator
#  - https://www.calculator.net/ip-subnet-calculator.html
#
# Network Address: 192.168.2.0
# Subnet Mask: 255.255.255.224
#
# |----------------------------------------------------------------------------------------------|
# | Network Address | Usable Host Range                 | Broadcast Address |                    |
# |-----------------+-----------------------------------+-------------------+--------------------|
# | 192.168.  2.  0 | 192.168.  2.  1 - 192.168.  2. 30 | 192.168.  2. 31   |                    |
# | 192.168.  2. 32 | 192.168.  2. 33 - 192.168.  2. 62 | 192.168.  2. 63   | rnd-dev1           |
# | 192.168.  2. 64 | 192.168.  2. 65 - 192.168.  2. 94 | 192.168.  2. 95   |                    |
# | 192.168.  2. 96 | 192.168.  2. 97 - 192.168.  2.126 | 192.168.  2.127   | rnd-dev2           |
# | 192.168.  2.128 | 192.168.  2.129 - 192.168.  2.158 | 192.168.  2.159   |                    |
# | 192.168.  2.160 | 192.168.  2.161 - 192.168.  2.190 | 192.168.  2.191   |                    |
# | 192.168.  2.192 | 192.168.  2.193 - 192.168.  2.222 | 192.168.  2.223   | rnd-dev3           |
# | 192.168.  2.224 | 192.168.  2.225 - 192.168.  2.254 | 192.168.  2.255   | rnd-dev3 (service) |
# |----------------------------------------------------------------------------------------------|
#

if [ `hostname` == "rnd-dev1" ]; then
	docker network create \
		--driver macvlan \
		--subnet=192.168.2.0/24 \
		--ip-range=192.168.2.32/27 \
		--gateway=192.168.2.1 \
		--aux-address="rnd-dev1=192.168.2.251" \
		--aux-address="rnd-dev2=192.168.2.252" \
		--aux-address="rnd-dev3=192.168.2.253" \
		--aux-address="switch=192.168.2.254" \
		--opt parent=eno1 \
		dev-net
fi

if [ `hostname` == "rnd-dev2" ]; then
	docker network create \
		--driver macvlan \
		--subnet=192.168.2.0/24 \
		--ip-range=192.168.2.96/27 \
		--gateway=192.168.2.1 \
		--aux-address="rnd-dev1=192.168.2.251" \
		--aux-address="rnd-dev2=192.168.2.252" \
		--aux-address="rnd-dev3=192.168.2.253" \
		--aux-address="switch=192.168.2.254" \
		--opt parent=eno1 \
		dev-net
fi

if [ `hostname` == "rnd-dev3" ]; then
	docker network create \
		--driver macvlan \
		--subnet=192.168.2.0/24 \
		--ip-range=192.168.2.192/26 \
		--gateway=192.168.2.1 \
		--aux-address="rnd-dev1=192.168.2.251" \
		--aux-address="rnd-dev2=192.168.2.252" \
		--aux-address="rnd-dev3=192.168.2.253" \
		--aux-address="switch=192.168.2.254" \
		--opt parent=eno1 \
		dev-net
fi
