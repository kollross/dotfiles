#!/bin/sh
#mount truenas.kollross.net:/Bitkeeper ~/Desktop/.Shared/Bitkeeper
#while [ "$1" != "" ]; do
if [ "$1" != "" ]; then 
	case $1 in
	-m | --mount )	
			#mount -t nfs  -o vers=4,sec=sys,intr,hard,tcp,rdirplus,readahead=128,rsize=1048576,wsize=1048576 truenas.kollross.net:/mnt/Data/Bitkeeper/.Shared ~/.Shared
			mount -t nfs  truenas.kollross.net:/mnt/Data/Bitkeeper/.Shared ~/.Shared
			exit
			;;
	-u | --umount )
			#umount ~/.Shared/Bitkeeper
			#umount ~/.Shared/Downloads
			umount ~/.Shared
			exit
			;;

	esac
	else 
	echo "Switch options:"
	echo "-m | --mount Mount"
	echo "-u | --umount Unmount"
fi
#done
			

