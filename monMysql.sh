#!/bin/sh
# Operating system variables (*required)
user="ubuntu"

# Create logs directory
mkdir -p /home/$user/logs
logs="/home/$user/logs"

# System time variables (DO NOT CHANGE)
fulldate=$(date +"%c")

#check mysql status
ps auxw | grep /usr/sbin/mysqld | grep -v grep > /dev/null

if [ $? != 0 ]
then
        /etc/init.d/mysql restart > /dev/null
        echo "[mysql] service is down: $fulldate" >> $logs/mysql-breakdown.log
fi
