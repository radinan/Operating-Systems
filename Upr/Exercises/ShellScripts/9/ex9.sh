#!/bin/bash

read filename
read string

grep -q "$string" $filename

echo $?

exit 0
