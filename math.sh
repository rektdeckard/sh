#!/bin/bash
# DO SOME MATH!

# Functions
add() {
    answer1=$(($1 + $2))
    let answer2=($1 + $2)
    answer3=`expr $1 + $2`
}

sub() {
    answer1=$(($1 - $2))
    let answer2=($1 - $2)
    answer3=`expr $1 - $2`
}

mult() {
    answer1=$(($1 * $2))
    let answer2=($1 * $2)
    answer3=`expr $1 \* $2`
}

div() {
    answer1=$(($1 / $2))
    let answer2=($1 / $2)
    answer3=`expr $1 / $2`
}

# Declare Local Variables
OP=$1
INT1=$2
INT2=$3

# Test Conditions
[[ $# -ne 3 ]] && \
    echo "Incorrect number of arguments. Please provide an operation (a, s, m, d) and two numbers." && exit 1

[[ $OP != a ]] && [[ $OP != s ]] && [[ $OP != m ]] && [[ $OP != d ]] && \
    echo "Operation $OP not recognized. Please use permitted operators:
    a for addition
    s for subtraction
    m for multiplication
    d for division" && exit 2

if [[ $OP == a ]] ; then
    add $INT1 $INT2
elif [[ $OP == s ]] ; then
    sub $INT1 $INT2
elif [[ $OP == m ]] ; then
    mult $INT1 $INT2
elif [[ $OP == d ]] ; then
    div $INT1 $INT2
else
    echo "An unknown error occurred. Please check your code dummy."
fi

# Output Results
echo $OP $INT1 $INT2
echo "Using the \$((..)) built-in shell method, the answer is $answer1."
echo "Using the \"let\" shell method, the answer is $answer2."
echo "Using the deprecated \`expr .. \` method, the answer is $answer3."
