#!/bin/bash

# spacex.txt

# $cosm =  max Failure => get $2
# latest ($1) for $cosm
# print $3:$4


most_failed_launch_site=$( cat spacex.txt | tail -n +2 | awk -F "|" '{if($3 == "Failure") print $2" "$3}' | sort -r -k 1 | uniq -c | sort -rn -k 1 | head -n 1 | awk '{print $2}' )

cat spacex.txt | grep $most_failed_launch_site | sort -rn -k 1 | head -n 1 |awk -F '|' '{print $3":"$4}' 
