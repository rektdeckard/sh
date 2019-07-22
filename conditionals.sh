#!/bin/bash
file=$1
if [ -f $file ]
then
    echo -e "The file $file exists."
else
    echo -e "The file $file does not exist."
fi
