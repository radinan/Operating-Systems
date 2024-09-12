#!/bin/bash

#initial validations..

original_symbs=$( grep -e "$2" $1 | awk -F '=' '{print "["$2"]"}' | sed 's/ //g' )
modified=$( grep -e "$3" $1 | awk -F "=" '{print $2}' | sed "s/$original_symbs//g" | awk '{$1=$1;print $0}')

echo "=$modified;"


