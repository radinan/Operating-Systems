#!/bin/bash

if [ $# -ne 1 ]; then
	exit 1
fi

if [ $(id -u) -ne $0 ]; then
	exit 1
fi

for user in $(ps -e -o user | sort | uniq | awk '/^s[0-9]+/' ); do
	echo "user: ${user}"

	total_rss=0
	max_rss=0
	max_pid=0

	while read line; do

		u_pid=$( echo ${line} | awk '{print $1}')
		u_rss=$( echo ${line} | awk '{print $2}')
		
		if [ $u_rss -gt $max_pid ]; then
			max_rss=$(( max_rss + u_rss  ))
			max_pid=$u_pid
		fi

		total_rss=$(( total_rss + u_rss ))
	done< <(ps -u ${user} -o pid,rss | tail -n 2)
	
	if [ $total_rss -gt $1 ]; then
		echo "!!! Exceeding rss. Kill $max_pid" 
	else
		echo "Total rss: $total_rss"
	fi

	echo
done

