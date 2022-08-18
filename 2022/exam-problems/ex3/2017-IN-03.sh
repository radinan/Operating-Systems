#!/bin/bash

#find . -type f -empty | xargs -I {} rm {}

find ~ -type f | xargs -I {} du {} | uniq | sort -rn -k 1 | head -n 2 |  awk '{print $2}' | xargs -I {} rm {}
