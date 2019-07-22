#!/bin/bash

echo -ne "Enter an absolute path of the file you wish to read: "
read file
exec < $file # redirects a file to stdin
while read line
do
    echo $line
done
