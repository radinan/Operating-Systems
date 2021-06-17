#!/bin/bash

#• име на фаил   $1
#• низ1          $2
#• низ2          $3
#ключ=стойност
#стойност:
#• ключ=
#• ключ=t1 t2 t3
#Някъде във файла:
#• ключ == $2
#• и може: ключ == $3

#ключ == $3 => mahat se povtoreniqta ot ключ == $2

if [ $# -ne 3 ]; then
        exit 1
fi

cat $1 | while read line; do
        key=$(echo $line | cut -d '=' -f 1)

        #seaarch for $2, $3 => value1 value2  
        if [ $key = $2 ]; then
                value1="$(echo $line | cut -d '=' -f 2)"
        elif [ $key = $3 ]; then
                value2="$(echo $line | cut -d '=' -f 2)"

                newvalue2=$value2
                for i in $value1; do
                        for j in $value2; do
                                newvalue2=$(echo $(echo $newvalue2 | sed "s/$i//g")) #remove duplicates in value2
                        done
                done

                cat $1 | while read line; do
                        key=$(echo $line | cut -d '=' -f 1)
                        
                        if [ $key = $3 ]; then
                                echo "$key=$newvalue2" #changed line
                        else
                                echo "$line" #same line
                        fi
                done
        break
        fi
done
