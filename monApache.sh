#!/bin/sh
# Operating system variables (*required)
user="ubuntu"

# Create logs directory
mkdir -p /home/$user/logs
logs="/home/$user/logs"

# System time variables (DO NOT CHANGE)
fulldate=$(date +"%c")

#check apache status
ps auxw | grep /usr/sbin/apache2 | grep -v grep > /dev/null

if [ $? != 0 ]
then
        /etc/init.d/apache2 restart > /dev/null
        echo "[apache2] service is down: $fulldate" >> $logs/apache-breakdown.log
fi
