#!/bin/bash

if [ $# -ne 2 ]; then
	exit 1
fi

mkdir ./a ./b ./c

find . -maxdepth 1 -type f | while read line; do
	lines=$(wc -l $line | awk '{print $1}')
	
	if [ $line == '.' ]; then
		continue
	fi
		
	if [ $lines -lt $1 ]; then
		mv $line ./a
	elif [ $lines -gt $1 ] && [ $lines -lt $2 ]; then
		mv $line ./b
	else
		mv $line ./c	
	fi
done
