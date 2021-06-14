#!/bin/bash

#$1 = num
#$2 = delimiter

delimiter=""

if [ "$2" = "" ]; then
        delimiter=" "
else
        delimiter=$2
fi

reversed=$(echo $1 | rev)
echo $( sed 's/\(...\)/\1'$delimiter'/g' < <(echo $reversed) | rev )

