#!/bin/bash

echo -n "Please enter a month in numberical form (1 through 12): "
read month

case "$month" in
    1)    echo "January" ;;
    2)    echo "February" ;;
    3)    echo "March" ;;
    4)    echo "April" ;;
    5)    echo "May" ;;
    6)    echo "June" ;;
    7)    echo "July" ;;
    8)    echo "August" ;;
    9)    echo "September" ;;
    10)   echo "October" ;;
    11)   echo "November" ;;
    12)   echo "December" ;;
    * )   echo "Invalid Entry. Please try again." ; exit 2 ;;
esac
exit 0
