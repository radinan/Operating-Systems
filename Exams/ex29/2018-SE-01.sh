#!/bin/bash

# LOGDIR/protocol/account/friend/yyy-mm-dd-hh-mm-ss.txt
# ..txt:
# lines


# $1 = LOGDIR
# top 10 friends :)

if [ '$1' -eq '' ]; then
  exit 1
fi

find $1 -type f | xargs -I {} wc -l {} | awk -F '[ /]' '{print $1" "$(NF-1)}' | sort -rn | sort -k 2 -u | head -n 10 | awk -F ' ' '{print $2" "$1}'

