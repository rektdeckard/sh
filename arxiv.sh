#!/bin/bash
# Arxiv Home Directory Backup
# created 2018.11.18
# author Tobias Fried <friedtm@gmail.com>

# Performs a regular, incremental backup of user's specified files and directories to tarball.
# Items to be synced are listed in:
# /home/<user>/Dropbox/Backups/<user>/<user>-backuplist.txt

# Select backup suffix format. Here uses the <user>-YYYY.MM.DD format.
suffix="-`date +%Y.%m.%d-%H:%M`"

# Location of Backup Files and File List
backupDirectory="$HOME/Dropbox/Backups/$USER"
backupList="$backupDirectory/$USER-backuplist.txt"
snapshotFile="$backupDirectory/$USER$suffix.snapshot.db"

# Incremental Backup
echo -n "Would you like to archive to $backupDirectory on `date +%Y.%m.%d` at `date +%H:%M:%S`? (y/n): "
read affirm
case $affirm in
    y|Y|yes|Yes|YES)
# TODO check if other backups exist        
        pushd .
        sudo tar -g/$snapshotFile -cJpvf $backupDirectory/$USER$suffix.tar.xz -T $backupList
        popd ;;
    n|N|no|No|NO)
        echo "Archive cancelled." ;;
    *)
        echo "Invalid response." ;;
esac
