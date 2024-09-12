#!/bin/bash

if [ $# -ne 2 ]; then
        exit 1
fi

declare -A fields
order=()
while read line; do
        id=$(echo $line | awk -F ',' '{print $1}')
        field=$(echo $line | cut -d ',' -f 2-)

        if [ ! "${fields[$field]}" ]; then
                fields[$field]=$line
                order+=("$field")
        else
                field_id=$(echo "${fields[$field]}" | awk -F ',' '{print $1}')
                if [ $field_id -gt $id ]; then
                        fields[$field]=$line
                fi
        fi
done < <(cat $1)

for f in ${order[@]}; do
        echo "$f"
        echo "${fields[$f]}" >> $2
done

exit 0
