#!/bin/bash

#/home/SI unexistant -> using /home/students

# 1551168000
# 1551176100

# print FN \t NAME
# СИ 
# dirs changed time (stc) in this interval

find /home/students -maxdepth 1 -mindepth 1 -type d -printf "%C@ %f\n" | awk '{if ($1 >= 1660400000 && $1 <= 1660550000) print $2}' | xargs -I {} grep {} /etc/passwd | cut -c 2- | awk -F "[,:]" '{printf ("%s\t%s\n", $1, $5)}'
