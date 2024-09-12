#!/bin/bash

if [ $# -ne 2 ]; then
  exit 1
fi

length1=$(wc -l $1 | awk '{print $1}')
length2=$(wc -l $2 | awk '{print $1}')
winner=""

if [ $length1 -ge $length2 ]; then
    winner=$1
else
    winner=$2
fi

name=$(cat $winner | head -n 1 | awk -F '[.-]' '{print $2}' | head -c -2 | tail -c +2)

awk -F '- ' '{print $2}' $winner | sort 1> "$name.songs"

exit 0

