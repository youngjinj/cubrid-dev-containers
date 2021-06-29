#!/bin/bash

mkdir -p /home/package/astyle/astyle-3.1 \
	&& curl -L https://jaist.dl.sourceforge.net/project/astyle/astyle/astyle%203.1/astyle_3.1_linux.tar.gz -o /home/package/astyle/astyle_3.1_linux.tar.gz \
	&& tar -zxvf /home/package/astyle/astyle_3.1_linux.tar.gz -C /home/package/astyle/astyle-3.1 --strip-components=1 \
	&& cd /home/package/astyle/astyle-3.1 && cmake . && make && make install \
	;
