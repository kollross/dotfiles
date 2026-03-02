#!/bin/sh
if [ "$1" != "" ]; then 
	case $1 in
	-m | --mount )	
			mount -t nfs  -o vers=3,sec=sys,intr,hard,tcp,rdirplus,readahead=128,rsize=1048576,wsize=1048576  truenas.kollross.net:/mnt/Data/Media ~/Movies/Media
			mount -t nfs   -o vers=4,sec=sys,intr,hard,tcp,rdirplus,readahead=128,rsize=1048576,wsize=1048576 truenas.kollross.net:/mnt/Data/home/kollross ~/nfs/kollross
			exit
			;;
	-u | --umount )
			umount ~/Movies/Media
			umount ~/nfs
			exit
			;;

	esac
	else 
	echo "Switch options:"
	echo "-m | --mount Mount"
	echo "-u | --umount Unmount"
fi
