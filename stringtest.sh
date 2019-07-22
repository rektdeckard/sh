#!/bin/bash

str1=$1
str2=$2

echo "Is String 1 zero length? Value of 1 means FALSE."
[[ -z $str1 ]]
echo $?

echo "Is String 2 nonzero length? Value of 1 means TRUE."
[[ -n $str3 ]]
echo $?

len1=${#str1}
len2=${#str2}

if [[ $len1 == $len2 ]] ; then
    echo "String 1 and 2 are of equal length ($len1)."
    elif [[ $len1 -gt $len2 ]] ; then
        echo "String 1 ($len1) is longer than String 2 ($len2)."
    else
        echo "String 2 ($len2) is longer than String 1 ($len1)."
fi

if [[ $str1 == $str2 ]] ; then
    echo "String 1 and 2 are the same ($str1)."
    else 
        echo "String 1 ($str1) and String 2 ($str2) are different. Duh."
fi
