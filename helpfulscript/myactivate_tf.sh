#!/bin/bash 


PWDsave=$(pwd)


path_act="build_cmake/venv-tf-py3/bin/activate"
found=0

if [ -f "$path_act" ]; then
    found=1
fi



if [ $found -eq 0 ]; then
    for d in  */; do 
        if [ ! -d "$d" ]; then continue; fi 
        #echo "$d"
        if [ -f "$d/$path_act" ]; then
            path_act="$d/$path_act"
            found=1
            break
        fi
    done
fi


if [ $found -eq 0 ]; then
    for d in  */*/; do 
        if [ ! -d "$d" ]; then continue; fi 
        #echo "$d"
        if [ -f "$d/$path_act" ]; then
            path_act="$d/$path_act"
            found=1
            break
        fi
    done
fi

currentpath=$PWDsave


if [ $found -eq 0 ]; then
    for i in $(seq 1 10); do 
        #echo $i
        cd ..
        foldername=$(basename $PWD)
        #echo "foldername="$foldername
        
        if [ "$foldername" == "mazharul" ]; then break; fi
        if [ "$foldername" == "home" ]; then break; fi

        if [ -f "$d/$path_act" ]; then
            path_act="$d/$path_act"
            found=1
            break
        fi
    done
fi

if [ $found -eq 1 ]; then
    source $path_act
else
    echo "ERROR: activating tf: actviation path not found"
fi


cd $PWDsave

#source build_cmake/venv-tf-py3/bin/activate
