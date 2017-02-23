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
	sudo chmod +x server/phserver.sh
fi
if [ ! -d ./phost ]; then
	git clone https://github.com/ZhukMax/phost.git
	sudo chmod +x ./phost/phost.sh
fi
if [ ! -d ./yiihost ]; then
	git clone https://github.com/ZhukMax/yiihost.git
	sudo chmod +x ./yiihost/yiihost.sh
fi
if [ ! -d ./mhost ]; then
	git clone https://github.com/ZhukMax/mhost.git
	sudo chmod +x ./mhost/mhost.sh
fi

apt-get install dialog

DIALOG=dialog

InfoDialog() {
    $DIALOG --msgbox "$1" 5 70
}

# Keys for script
while [ 1 ] ; do
	if [ "$1" = "install" ] ; then
		install
	elif [ "$1" = "add" ] ; then
		addHost
	elif [ "$1" = "--help" ] ; then
		echoHelp $BASEDIR/docs/help.txt
	elif [ "$1" = "-h" ] ; then
		echoHelp $BASEDIR/docs/help.txt
	elif [ -z "$1" ] ; then
		break
	else
		echo "Error: unknown key" 1>&2
		exit 1
	fi
	shift
done

function install() {
	sudo ./server/phserver.sh
}

function addHost() {
}
