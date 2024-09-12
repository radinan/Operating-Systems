#!/bin/bash

#Solution according to the current /etc/passwd file


# /etc/passwd => fn ->2nd+3rd digit & famiy name = ___|a & informatics

#1. all informatics
#2. family name ending with A
#3. get fn
#4. get 2nd and 3rd digit
#5. sort dict
#6. uniq
#7. sort rev
#8. get first

	awk -F :  '/,И:/ && /а,/ {row=$1; print substr(row,2,2)}' /etc/passwd | sort | uniq -c | sort -rn -k 1 | head -n 1
