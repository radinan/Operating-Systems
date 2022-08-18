#!/bin/bash

# ONLY inode of the lately changed file in ~pesho (or subdirs) 
# more than 1 name => hardlinks

find ~ -type f -printf "%n %Ts %i\n" | awk '{if ($1 > 1) print $2" "$3}' | sort -rn -k 1 | head -n 1 | awk '{print $2}' 
