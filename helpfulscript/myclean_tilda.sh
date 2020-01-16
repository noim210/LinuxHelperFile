#!/bin/bash 



if [ $# -eq 0   ];then
    rm -rf *~
else
    for d in $@; do
        #echo "$d/*~"
        rm -rf  $d/*~
    done
    echo "~files removed from folders: $@ . "
fi




