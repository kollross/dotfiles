#!/bin/sh

OS=`uname -o`

if [ $OS = 'GNU/Linux' ]; then
	/usr/bin/screenfetch > /etc/motd
else
	/usr/local/bin/screenfetch > /etc/motd
fi
