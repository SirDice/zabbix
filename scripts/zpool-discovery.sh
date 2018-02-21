#!/bin/sh

first=1

echo "{\"data\":["

for pool in `/sbin/zpool list -H -o name` ; do
	if [ $first -ne 1 ]; then
		echo ","
	fi
	first=0
	echo -n "{\"{#ZPOOL}\":\"${pool}\"}"
done
echo
echo "]}"
