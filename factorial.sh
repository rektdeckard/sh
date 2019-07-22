#!/bin/bash

n=$1

[ "$n" == "" ] && echo "Please enter a number as an argument." && exit 1

j=1
factorial=1

while [ $j -le $n ]
do
    factorial=$(( factorial * $j  ))
    j=$(($j + 1 ))
done
echo "The factorial of $n, "$n"!, is: $factorial"
exit 0
