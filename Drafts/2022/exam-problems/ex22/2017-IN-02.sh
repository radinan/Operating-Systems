#!/bin/bash

ps -e -o user,pid,%cpu,%mem,vsz,rss,tty,stat,time,command| tail -n +2 | awk '{$1=$1;print $9}' | sort | uniq -c

# TODO: finish pls
