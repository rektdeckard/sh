#!/bin/bash
# A script to test the value of environment variables set by the user

# Functions
func1 () {
echo "$0 has returned a $n from func$n"
}
func2 () {
echo "$0 has returned a $n from func$n"
}
func3 () {
echo "$0 has returned a $n from func$n"
}

# Prompt user for argument
echo "Enter 1, 2, or 3 to run one of three functions"
read n
if [ $n -gt 3 ]
then
    echo "That number is invalid."
else
    func$n
fi
