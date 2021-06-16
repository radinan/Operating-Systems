#!/bin/bash

lines=$( cat $1 | awk '!/[a-w]/ && /[02468]/' | wc -l )
echo "Broyat na tyrsenite redove e $lines"

exit 0
