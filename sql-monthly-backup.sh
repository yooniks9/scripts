#!/bin/bash
# # MySQL/MariaDB Backup monthlu Scripts (MAX:6 backups/year) By: Roy Tan @ Tentencreative | Nov 7, 2016
# Operating system variables (*required)
 user="linux_username"

# Database variables (*required)
 db_user="db_user"
 db_password="db_password"
 db_host="localhost"
 db_name="db_name"

# Backup path (DO NOT CHANGE)
 path="/home/$user/SQLbackup/$db_name-monthly"
 logs="/home/$user/logs"

# System time variables (DO NOT CHANGE)
 day=$(date +"%m.%d.%Y")
 fulldate=$(date +"%c")
 date=$(date +"%m.%d.%Y-%H:%M")

# Create directory (command)
 mkdir -p $path
 mkdir -p $logs

# Dump database into SQL file (command)
 mysqldump -u$db_user -p$db_password -h$db_host $db_name > $path/$db_name-$day.sql

# Record logs (command)
 echo "[monthly] backup $db_name is completed on $fulldate" >> $logs/MySQL-monthly-backup.log

# Clean up files longer than 180 days [ 180 x 1440 = 259200 ]  (command)
 find $path/*.sql -type f -mmin +259200 -exec rm {} \;
