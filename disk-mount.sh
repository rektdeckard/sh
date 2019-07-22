#!/bin/bash
## Mount external disks daily.

# Check if mounted

if [[ ! $(findmnt -rno TARGET /dev/sdb2) == "/disks/NASty" ]];

  # Mount
  then sudo mount /dev/sdb2 /disks/NASty/
  else echo "Not found."	  
fi
