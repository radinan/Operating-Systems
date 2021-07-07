#!/bin/bash

# $1 - dir
# $2 - file (optional)

if [ $# -ne 1 ] && [ $# -ne 2 ]; then
        exit 1
fi

if [ ! -d $1 ]; then
        exit 2
fi

counter=0

while read line; do
        connection=$(stat $line --printf "%N\n" | sed "s/'//g")
        target=$(echo $connection | awk -F ' -> ' '{print $2}')

        if [ ! -e $target ]; then
                counter=$((counter+1))
        else
                if [ $# -eq 2 ]; then
                        echo "$connection" >> $2
                else
                        echo "$connection"
                fi
        fi
done < <(find $1 -type l)

if [ $# -eq 2 ]; then
        echo "Broken symlinks: $counter" >> $2
else
        echo "Broken symlinks: $counter"
fi
