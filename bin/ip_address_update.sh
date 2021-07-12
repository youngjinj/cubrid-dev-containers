#!/bin/bash

CANONICAL_PATH=`readlink -f $(dirname ${BASH_SOURCE})`

CONTAINER_IP_NAME_LIST=`docker network inspect dev-net --format '{{range .Containers }}{{printf "%s,%s\n" (index (split (.IPv4Address) "/") 0) (.Name)}}{{end}}'`

sed -i "s/^\(192\.168\.2\.[[:digit:]]\{1,3\}\).*/\1/" ${CANONICAL_PATH}/../ip_address/*_`hostname`

sed -i "s/^\(192\.168\.2\.0\).*/\1\tNetwork Address/" ${CANONICAL_PATH}/../ip_address/*
sed -i "s/^\(192\.168\.2\.251\).*/\1\trnd-dev1/" ${CANONICAL_PATH}/../ip_address/*
sed -i "s/^\(192\.168\.2\.252\).*/\1\trnd-dev2/" ${CANONICAL_PATH}/../ip_address/*
sed -i "s/^\(192\.168\.2\.253\).*/\1\trnd-dev3/" ${CANONICAL_PATH}/../ip_address/*
sed -i "s/^\(192\.168\.2\.254\).*/\1\tswitch/" ${CANONICAL_PATH}/../ip_address/*
sed -i "s/^\(192\.168\.2\.255\).*/\1\tBroadcast Address/" ${CANONICAL_PATH}/../ip_address/*

sed -i "s/^\(192\.168\.2\.31\).*/\1\ttest31 (rnd-dev2)/" ${CANONICAL_PATH}/../ip_address/*

for CONTAINER_IP_NAME in ${CONTAINER_IP_NAME_LIST[@]}; do
	CONTAINER_IP=`echo ${CONTAINER_IP_NAME} | cut -d "," -f 1`
	CONTAINER_NAME=`echo ${CONTAINER_IP_NAME} | cut -d "," -f 2`

	sed -i "s/^\(${CONTAINER_IP}\).*/\1\t${CONTAINER_NAME} (`hostname`)/" ${CANONICAL_PATH}/../ip_address/*_`hostname`
done

cat ${CANONICAL_PATH}/../ip_address/*_`hostname`
