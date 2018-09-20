#!/bin/sh
# Operating system variables (*required)
user="ubuntu"

# Create logs directory
mkdir -p /home/$user/logs
logs="/home/$user/logs"

# System time variables (DO NOT CHANGE)
fulldate=$(date +"%c")

#check nginx status
ps auxw | grep /usr/sbin/nginx | grep -v grep > /dev/null

if [ $? != 0 ]
then
        /etc/init.d/nginx restart > /dev/null
        echo "[nginx] service is down: $fulldate" >> $logs/nginx-breakdown.log
fi
