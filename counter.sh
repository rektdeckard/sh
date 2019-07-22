#!/bin/bash

n=0
until [ $n -ge 10 ] ;
do
  echo "Aaand a "$n"!"
  n=$((n+1))
done
echo "That's all folks!"
