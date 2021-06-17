#!/bin/bash

head /etc/passwd | awk -F ':' '{print $6}' | sort | uniq | while read line; do

    if [ -d $line ]; then
        find $line -type f -printf "%u:%T@:%p\n" >> ./newfile 2> /dev/null
    fi
done

cat ./newfile | sort -n -t ':' -rk 1 | head -n 1 |  awk -F ':' '{print $1" "$3}'
