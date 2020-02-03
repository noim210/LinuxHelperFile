#!/bin/bash 



if [ $# -eq 0   ];then
    xrandr
elif [ $# -eq 1 ]; then
    
    if [ "$1" == "laptop" ] || [ "$1" == "lap" ]  || [ "$1" == "l"  ]; then
        xrandr -s 5
    elif [ "$1" == "monitor" ] || [ "$1" == "mon" ] ||  [ "$1" == "m" ] ; then
        xrandr -s 1
    else    
        xrandr -s $1
    fi
    
else 
    echo "too Many parameter Given"

fi




