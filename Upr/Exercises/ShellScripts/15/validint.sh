#!/bin/bash

#3
if ! [[ "$1" =~ ^[0-9]+$ ]] || ! [[ "$2" =~ ^[0-9]+$ ]] || ! [[ "$3" =~ ^[0-9]+$ ]]; then
        exit 3
fi

#2
if [ $3 -lt $2 ]; then
        exit 2
fi

#0 1
if [ $1 -lt $3  ] && [ $1 -gt $2 ]; then
        exit 0
else
        exit 1
fi
