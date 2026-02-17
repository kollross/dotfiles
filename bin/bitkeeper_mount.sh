#!/bin/sh
#mount freenas.kollross.net:/Bitkeeper ~/Desktop/.Shared/Bitkeeper
#while [ "$1" != "" ]; do
if [ "$1" != "" ]; then
	case $1 in
	-m | --mount )
			mount -t nfs -o nfsvers=3,soft,intr,rsize=8192,wsize=8192,timeo=900,retrans=3,proto=tcp freenas.kollross.net:/mnt/Data/Bitkeeper ~/.Shared/Bitkeeper
			#mount -t nfs -o nfsvers=3,soft,intr,rsize=8192,wsize=8192,timeo=900,retrans=3,proto=tcp freenas.kollross.net:/mnt/Data/Bitkeeper/.Shared/bin/sort/ ~/.Shared/Downloads
			exit
			;;
	-u | --umount )
			umount ~/.Shared/Bitkeeper
			umount ~/.Shared/Downloads
			exit
			;;

	esac
	else
	echo "Switch options:"
	echo "-m | --mount Mount"
	echo "-u | --umount Unmount"
fi
#done
