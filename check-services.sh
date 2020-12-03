#!/bin/sh
# Operating system variables (*required)
user="ubuntu"

# Create logs directory
logs="/home/$user/logs"
mkdir -p $logs

# System time variables (DO NOT CHANGE)
fulldate=$(date +"%c")

# Check apache status
ps auxw | grep /usr/sbin/apache2 | grep -v grep > /dev/null

if [ $? != 0 ]
then
        /etc/init.d/apache2 restart > /dev/null
        echo "[apache2] service is down: $fulldate" >> $logs/services-status.log
fi

# Check docker services
ps auxw | grep /usr/bin/docker | grep -v grep > /dev/null

if [ $? != 0 ]
then
	/etc/init.d/docker restart > /dev/null
	echo "[docker] service is down: $fulldate" >> $logs/services-status.log
fi

# Wake up Docker (sometime it auto went idle)
/usr/bin/docker ps -a > /dev/null
