#!/bin/bash

#$1 file
#$2 dir


for i in  $( find $2 -type f ); do
        if cmp -s "$i" "$1"; then
                echo "$i"
        fi
done
