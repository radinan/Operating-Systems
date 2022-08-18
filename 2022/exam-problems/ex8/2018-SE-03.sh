#!/bin/bash

group_id=$( cat /etc/passwd | head -n 201 | tail -n 1 | awk -F : '{print $4}' )

echo $group_id

awk -F ":" -v group_id="$group_id" '{if ($4 == group_id) print $5":"$6}' /etc/passwd | awk -F "[,:]" '{print $1":"$NF}'

