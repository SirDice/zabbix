#!/bin/sh

first=1

echo "{\"data\":["

for dataset in `/sbin/zfs list -H -o name` ; do
	if [ $first -ne 1 ]; then
		echo ","
	fi
	first=0
	echo -n "{\"{#ZFS}\":\"${dataset}\"}"
done
echo
echo "]}"
