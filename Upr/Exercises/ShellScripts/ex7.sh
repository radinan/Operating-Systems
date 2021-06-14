#!/bin/bash

echo "Enter directory's fullname: "
read fullname

filecount=$( find $fullname -type f | wc -l  )
dircount=$(( $( find $fullname -type d | wc -l ) - 1 )) #without the current dir

echo -e "files: $filecount\ndirs: $dircount"

exit 0
