#!/bin/sh

name=task-backup-$(date +'%Y-%m-%d').tar.gz
backupdir=~/u/_backups/taskwarrior

cd ~/.task
tar czf $name *
mkdir -p $backupdir
mv $name $backupdir
