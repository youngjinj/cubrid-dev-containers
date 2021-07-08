#!/bin/bash

# deprecated
exit

docker stop \
	test192 test193 \
	test194 test195 \
	test196 test197 \
	test198 test199 \
	test200	test201

docker rm \
	test192 test193 \
	test194 test195 \
	test196 test197 \
	test198 test199 \
	test200	test201

docker volume rm \
	development-cubrid_test192_192_data development-cubrid_test193_193_data \
	development-cubrid_test194_194_data development-cubrid_test195_195_data \
	development-cubrid_test196_196_data development-cubrid_test197_197_data \
	development-cubrid_test198_198_data development-cubrid_test199_199_data \
	development-cubrid_test200_200_data development-cubrid_test201_201_data
