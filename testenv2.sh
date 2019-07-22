#!/bin/bash
# A script to test the value of environment variables set by the user

# Read argument
echo "Enter 1 or 2 to set the environment variable EVAR to Yes or No"
read ans

# Set up and return, showing if there was an error
RC=0

if [ $ans -eq 1 ]
then
    export EVAR="Yes"
else
    if [ $ans -eq 2 ]
    then
        export EVAR="No"
    else
        export EVAR="Unknown"
        RC=1
    fi
fi
echo "The value of EVAR is: $EVAR"
exit $RC
