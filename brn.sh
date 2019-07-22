#!/bin/bash

n=0

if [ $1 == "" ]
then
    echo "Please enter a file extension to change." && exit 1
fi

for file in *$1; do
    mv "$file" "$(basename "$file" $1)$2"
    n=$(($n+1))
done
echo "$n file extensions changed from $1 to $2"
exit 0
