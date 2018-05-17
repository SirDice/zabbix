#!/bin/sh

if [ "$#" -ne 2 ]; then 
	echo "Usage: $0 <zpool> <stat>" >&2
	exit 1
fi

ZPOOL=$1
STAT=$2

case $STAT in
	rops)
		POS=4
		;;
	wops)
		POS=5
		;;
	rbytes)
		POS=6
		;;
	wbytes)
		POS=7
		;;
	*)	echo Unknown statistic >&2
		exit 1
		;;
esac
 
zpool iostat -p -H $ZPOOL | cut -f $POS
