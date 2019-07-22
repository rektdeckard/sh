#!/bin/bash
# This script will prompt the user for a directory name, create the directory, move to it and print the directory, create several empty files, \
# verify that they exist, put some content into them, display their contents, then says goodbye and cleans up the files.

# Prompt for directory name and create it
echo "Enter directory name: "
read DIREC
pushd ./
mkdir /tmp/$DIREC
cd /tmp/$DIREC
pwd
echo ""

# Create some empty files and show them
for n in 1 2 3 4
    do
        touch $DIREC$n
done
ls -a
echo ""

# Puts some data into the files
echo "Put something into your first file: "
read DATA
echo $DATA > $DIREC\1
echo "$USER is a douche" > $DIREC\2
echo""

#Reads the files back before cleaning up the whole thing
cat $DIREC?
echo ""
rm -rf /tmp/$DIREC
echo "$DIREC and its contents have been deleted. Goodybe!"
popd
pwd
