#!/bin/bash

# Input prompt
echo "This script will perform basic arithmetic operations on two numbers."
echo -n "Please enter the first number: "
read inp1
echo -n "Please enter the second number: "
read inp2
echo "Select:
    1 for Addition
    2 for Subtration
    3 for Multiplication"
read oper

# Conditional arithmetic logic
if [ $oper -eq 1 ]
then
    echo "Addition Result: " $(( $inp1 + $inp2 ))
else
    if [ $oper -eq 2 ]
    then
        echo "Subtraction Result: " $(( $inp1 - $inp2 ))
    else
        if [ $oper -eq 3 ]
        then
            echo "Multiplication Result: " $(( $inp1 * $inp2 ))
        else
            echo "Invalid Input"
        fi
    fi
fi
