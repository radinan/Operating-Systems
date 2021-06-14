#!/bin/bash

text=$(cat $1) #variable that's containing the text
filename=/home/radina/OS/shells/temprorary #name of the temp file

echo $text > $filename

opened_braces=0
closed_braces=0
max_nesting=0
curr=""

while [[ $curr != \{ ]] ; do
	curr=$(head -c 1 $filename)

	text=$(tail -c +2 $filename)
	echo $text > $filename

	if [ $curr = "{" 2> /dev/null ]; then
		(( opened_braces++ ))
	       	break
        fi

done


while [ $opened_braces -ne $closed_braces ]; do
	curr=$(head -c 1 $filename)
	text=$(tail -c +2 $filename)
	echo $text > $filename
	if [ $curr = '{' ]; then
		(( opened_braces++ ))
		curr_nesting=$(( $opened_braces - $closed_braces))
		if [ $max_nesting -lt $curr_nesting ]; then
			(( max_nesting++ ))
		fi
	elif [ $curr = '}' ]; then
		(( closed_braces++ ))
	fi
done

echo "The deepest nesting is $max_nesting levels" 

rm $file_name
