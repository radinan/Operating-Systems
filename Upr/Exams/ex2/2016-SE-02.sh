#!/bin/bash

#$1 = filename

awk -F '- ' 'BEGIN{i=1} { $1=i"."; i++; print $0;}' $1 | sort -t '.' -k 2 
