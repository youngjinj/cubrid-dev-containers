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

# oracle
sed -i "s/^\(192\.168\.2\.224\).*/\1\toracle-19c-r3-224 (rnd-dev3)/" ${CANONICAL_PATH}/../ip_address/*

# mysql
sed -i "s/^\(192\.168\.2\.225\).*/\1\tmysql-8.0.26-225 (rnd-dev3)/" ${CANONICAL_PATH}/../ip_address/*

# mariadb
sed -i "s/^\(192\.168\.2\.226\).*/\1\tmariadb-10.6.4-226 (rnd-dev3)/" ${CANONICAL_PATH}/../ip_address/*

# postgres
sed -i "s/^\(192\.168\.2\.227\).*/\1\tpostgres-13.4-227 (rnd-dev3)/" ${CANONICAL_PATH}/../ip_address/*

# mssql
sed -i "s/^\(192\.168\.2\.228\).*/\1\tmssql-2019-CU12-228 (rnd-dev3)/" ${CANONICAL_PATH}/../ip_address/*

# hikwon
sed -i "s/^\(192\.168\.2\.31\).*/\1\ttest31 (rnd-dev2) (hikwon)/" ${CANONICAL_PATH}/../ip_address/*

# hiclass
sed -i "s/^\(192\.168\.2\.30\).*/\1\ttech30 (rnd-dev3) (hiclass)/" ${CANONICAL_PATH}/../ip_address/*

for CONTAINER_IP_NAME in ${CONTAINER_IP_NAME_LIST[@]}; do
	CONTAINER_IP=`echo ${CONTAINER_IP_NAME} | cut -d "," -f 1`
	CONTAINER_NAME=`echo ${CONTAINER_IP_NAME} | cut -d "," -f 2`

	sed -i "s/^\(${CONTAINER_IP}\).*/\1\t${CONTAINER_NAME} (`hostname`)/" ${CANONICAL_PATH}/../ip_address/*_`hostname`
done

cat ${CANONICAL_PATH}/../ip_address/*_`hostname`
