#!/bin/bash

# Web Server Admin Tools
#
# Bash file for help with web server
#
# Author: ZhukMax, <zhukmax@ya.ru>
# https://github.com/ZhukMax/PhalconServer
# Apache License v.2
#

BASEDIR=`dirname $0`

# Import bash library
cd $BASEDIR
git clone https://github.com/ZhukMax/shlib.git lib
lib=$BASEDIR/lib/index.sh ; source "$lib"
if [ $? -ne 0 ] ; then echo "Error: can't import $lib" 1>&2 ; exit 1 ; fi

if [ ! -d ./server ]; then
	git clone https://github.com/ZhukMax/PhalconServer.git server
fi
if [ ! -d ./phost ]; then
	git clone https://github.com/ZhukMax/phost.git
fi
if [ ! -d ./yiihost ]; then
	git clone https://github.com/ZhukMax/yiihost.git
fi
if [ ! -d ./mhost ]; then
	git clone https://github.com/ZhukMax/mhost.git
fi
