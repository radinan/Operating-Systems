#!/bin/bash

# home dir
# print file depth
# same inode as the most lately changed 
# has min depth



# 1. last changed file
# 2. get its inode
# 3. get all files with this inode
# 4. get their depth?!
# 5. sort
# 6. print the smallest


inode=$( find ~velin -type f -printf "%T@ %i\n" | sort -rn -k 1 | head -n 1 | awk '{print $2}' )

echo $inode
find ~velin -type f -printf "%i %d %f" | awk -v inode="$inode" '{if ($1 == $inode) print $0}' | sort -n -k 2 | head -n 1 | awk '{print $3}'
