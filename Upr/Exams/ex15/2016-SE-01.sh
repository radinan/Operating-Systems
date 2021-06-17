#!/bin/bash

if [ "$#" -ne "0" ] && [ -d "$1" ]; then
        find $1 -maxdepth 2 -xtype l
else
        exit 1
fi

exit 0
