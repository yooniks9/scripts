#!/bin/bash
# MySQL/MariaDB Backup Daily Scripts (MAX:15 backups) By: Roy Tan @ Yooniks Co., ltd | Dec 3, 2020

# Database variables (*required)
db_user="db_user"
db_password="db_password"
db_host="127.0.0.1"
db_name="db_name"

# Backup path (DO NOT CHANGE)
path="/home/$USER/SQLbackup/$db_name-daily"
logs="/home/$USER/logs"

# System time variables (DO NOT CHANGE)
day=$(date +"%m.%d.%Y")
fulldate=$(date +"%c")
date=$(date +"%m.%d.%Y-%H:%M")

# Create directory (command)
mkdir -p $path
mkdir -p $logs

# Dump database into SQL file (command)
mysqldump -u$db_user -p$db_password -h$db_host $db_name --skip-lock-tables > $path/$db_name-$day.sql

# Record logs (command)
echo "[daily] backup $db_name is completed on $fulldate" >> $logs/MySQL-daily-backup.log

# Clean up files longer than 15 days [ 15 x 1440 = 21600 ] (command)
find $path/*.sql -type f -mmin +21600  -exec rm {} \;
