#!/bin/bash


if [ $(id -u) -ne "0" ]; then
        exit 1
fi

cat /etc/passwd | while read line; do
        user=$(echo $line | cut -d ':' -f 1)
        uid=$(echo $line | cut -d ':' -f 3)
        gid=$(echo $line | cut -d ':' -f 4)
        homedir=$(echo $line | cut -d ':' -f 6)

        #no dir
        if [ "$homedir" = "" ]; then
                echo -e "$user has no home dir\n"
                continue
        fi

        #not a dir
        if [ ! -d $homedir ]; then
                echo -e "$user has home dir which is not a dir\n"
                continue
        fi

        #no perms
        perms=$(find $homedir -maxdepth 0 -printf "%m") #744 for example
        fuid=$(find $homedir -maxdepth 0 -printf "%U")
        fgid=$(find $homedir -maxdepth 0 -printf "%G")

        if [ "$fuid" -ne "$uid" ]; then
                if [ "$fgid" -ne "$gid" ]; then
                        if [[ $perms == ??5  ]] || [[ $perms == ??4 ]] || [[ $perms == ??1 ]] || [[ $perms == ??0 ]]; then # 4 2 1
                                echo -e "$user is not owner, not in owner group and has no perms\n"
                                continue
                        fi
                else
                        if [[ $perms == ?5? ]] || [[ $perms == ?4? ]] || [[ $perms == ?1? ]] || [[ $perms == ?0? ]]; then
                                echo -e "$user is not owner; no group perms\n"
                                continue
                        fi
                fi
        else
                if [[ $perms == 5?? ]] || [[ $perms == 4?? ]] || [[ $perms == 1?? ]] || [[ $perms == 0?? ]]; then
                        echo -e "$user has no user perms\n"
                        continue
                fi
        fi
done

#empty $6
#$6 is not a dir
#$6 -> perms
        #$1 == owner
                # write?
        #$1 group == owner group
                # write?
        #other
                #write?
