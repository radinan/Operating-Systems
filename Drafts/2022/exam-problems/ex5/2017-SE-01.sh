#!/bin/bash

#maxdepth for checking ONLY the directory
find . -maxdepth 1 -type f -printf "%f %n\n" | sort | uniq -c | sort -rn -k 2 | head -n 5 | awk '{print $2}'
