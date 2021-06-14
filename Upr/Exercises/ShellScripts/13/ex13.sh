#!/bin/bash

#$1 dir
#$2 dir2
#kopira fileo-ve sys sydyrj promeneno prdi <45 min
# dir->dir2

#if [ "$2" = "" ] => 14_06_2020 

dir2=""

if [ "$2" = "" ]; then
        dir2="/home/radina/OS/shells/14_06_2020"
        mkdir "$dir2"
else
        dir2="$2"
fi

find $1 -amin -45 | xargs -I {} cp -t $dir2 {} 2> /dev/null
