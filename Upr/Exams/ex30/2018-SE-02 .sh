#!/bin/bash

# 1. split by [:(]
#        1.1 get col 1
#        1.2 trim
#        1.3 multiple spaces = space
#        1.4 ...;NUMBER_ORDER >> dict.txt
# 2. uniq dict.txt
#        2.1 touch NUMBER_ORDER.txt in $2
# 3. split by :
#        3.1 col 1
#                3.1.1 trim (spaces and braces)
#                3.1.2 multiple spaces = space
#                3.1.3 find in dict.txt & get NUMBER
#                3.1.4 write in file NUMBER
#        3.2 col 2
#                3.2.1 trim
#                3.2.2 >> file NUMBER


#validation
if [ $# -ne 2 ]; then
        exit 1
fi

file=$1
dir=$(echo $2 | sed 's/\/$//')

if [ "$(ls -A $dir)" ]; then
        exit 2
fi

dict="$dir/dict.txt"
touch "$dict"



#1. filter names and save quotes
counter=0
declare -A name_quote

while read line; do
        name=$(echo $line | awk -F '[:(]' '{print $1}' | sed -e 's/^[[:space:]]*//g' -e 's/[[:space:]]*$//g' | sed 's/ +/ /g')
        quote=$(echo $line | awk -F ':' '{print $2}' | sed -e 's/^[[:space:]]*//g' -e 's/[[:space:]]*$//g')

        echo "$name;$counter" >> "$dict"

        if [ "${name_quote[$name]}" != "" ]; then
                name_quote[$name]=$(echo -e "${name_quote[$name]}\n$quote")
        else
                name_quote[$name]="$quote"
        fi


        ((counter++))
done < <(cat $file)



#2. filter unique names
cat "$dict" | awk -F ';' '{if(!_[$1]) _[$1]=$0} END {for(i in _) print _[i]}' > "$dir/dict1.txt"

rm "$dict"
mv "$dir/dict1.txt" "$dict"



#3. connect names with their numbers
declare -A name_number

while read line; do
        number=$(echo $line | awk -F ';' '{print $2}')
        name=$(echo $line | awk -F ';' '{print $1}')
        touch "$dir/$number.txt"
        name_number[$name]="$dir/$number.txt"
done < <(cat "$dict")



#4. add quotes to number files
for n in "${!name_number[@]}"; do
        echo "${name_quote[$n]}" > "${name_number[$n]}"
done




exit 0
                                                           

