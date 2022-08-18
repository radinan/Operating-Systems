#!/bin/bash

# lines count > at least one EVEN digit & NO a-w

lines_count=$( awk '!/[a-w]/ && /[02468]/' $1 | wc -l )
echo "Count of the lines is $lines_count"

exit 0
