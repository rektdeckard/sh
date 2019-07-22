#!/bin/bash
# Arxiv Home Directory Backup
# created 2018.11.18
# author Tobias Fried <friedtm@gmail.com>

# Performs a regular, full backup of user's specified files and directories to tarball.
# Items to be synced are listed in:
# /home/<user>/Dropbox/Backups/<user>/<user>-backuplist.txt

# Select backup suffix format. Here uses the <user>-YYYY.MM.DD format.
suffix="-`date +%Y.%m.%d-%H:%M`"

# Location of Backup Files and File List
backupDirectory="$HOME/Dropbox/Backups/$USER"
backupList="$backupDirectory/$USER-backuplist.txt"

# Full Backup
tar -cJpf $backupDirectory/$USER$suffix.tar.xz -T $backupList

