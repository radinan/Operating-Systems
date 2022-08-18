#!/bin/bash

# print name + mass when:
# 	min distance
#	type == max distance type

#1. read plantes.txt
#2. exclude 1st line
#3. sort by 3rd col 
#4. get last's group $furthestGroup
#5. filter by $furthestGroup
#6. get 1st name + mass

furthestGroup=$( cat planets.txt | tail -n +2 | sort -t ";" -k 3 | tail -n 1 | awk -F ";" '{print $2}' )

grep ";$furthestGroup;" planets.txt | sort -t ";" -k 3 | head -n 1 | awk -F ";" '{printf ("%s\t%s\n", $1, $4)}'
