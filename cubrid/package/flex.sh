#!/bin/bash

mkdir -p /home/package/flex \
	&& curl -L https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz -o /home/package/flex/flex-2.6.4.tar.gz \
	&& tar -zxvf /home/package/flex/flex-2.6.4.tar.gz -C /home/package/flex \
	&& cd /home/package/flex/flex-2.6.4 && ./configure && make && make install \
	&& cd / && rm -rf /home/package/flex/flex-2.6.4 \
	;
