#!/bin/bash

mkdir -p /home/package/cmake \
	&& curl -L https://github.com/Kitware/CMake/releases/download/v3.20.4/cmake-3.20.4.tar.gz -o /home/package/cmake/cmake-3.20.4.tar.gz \
	&& tar -zxvf /home/package/cmake/cmake-3.20.4.tar.gz -C /home/package/cmake \
	&& cd /home/package/cmake/cmake-3.20.4 && ./bootstrap && make && make install \
	&& cd / && rm -rf /home/package/cmake/cmake-3.20.4 \
	;
