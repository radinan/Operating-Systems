#!/bin/bash

if [ $# -lt 1 ]; then
        exit 1
fi

if [ "$2" = "" ]; then
        find $1 -xtype l
else
        find $1 -type f -printf "%n:%p\n" | awk -v var="$2" -F ':' '$1 >= var {print $2}' #'{if($1 >= var) print $2}' 
fi
  
