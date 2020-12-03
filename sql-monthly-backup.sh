#!/bin/bash
# # MySQL/MariaDB Backup monthlu Scripts (MAX:6 backups/year) By: Roy Tan @ Yooniks Co., ltd | Dec 3, 2020
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
echo "[monthly] backup $db_name is completed on $fulldate" >> $logs/MySQL-monthly-backup.log

# Clean up files longer than 180 days [ 180 x 1440 = 259200 ]  (command)
find $path/*.sql -type f -mmin +259200 -exec rm {} \;
