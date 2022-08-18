#!/bin/bash

if [ ! -d $1 ]; then 
	exit 1
fi

find $1 -xtype l 

exit 0
