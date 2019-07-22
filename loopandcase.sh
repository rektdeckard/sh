#!/bin/bash

for filename in $(ls)
do
    ext=${filename#*.}
    case "$ext" in
        c)    echo "$filename: C Source File" ;;
	o)    echo "$filename: Object File" ;;
	sh)   echo "$filename: Shell Script" ;;
	txt)  echo "$filename: Text File" ;;
	*)    echo "$filename: Unsupported File Type" ;;
    esac
done
