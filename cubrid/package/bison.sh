#!/bin/bash

mkdir -p /home/package/bison \
	&& curl -L https://ftp.gnu.org/gnu/bison/bison-3.7.6.tar.xz -o /home/package/bison/bison-3.7.6.tar.xz \
	&& tar -Jxvf /home/package/bison/bison-3.7.6.tar.xz -C /home/package/bison \
	&& cd /home/package/bison/bison-3.7.6 && ./configure && make && make install \
	&& cd / && rm -rf /home/package/bison/bison-3.7.6 \
	;
