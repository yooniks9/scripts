#!/bin/bash
fulldate=$(date +"%c")
while read PROCESS; do
if ps -Af | grep $PROCESS | grep -v grep | awk '{print$2}' |  xargs sudo kill -9 ; then
  echo "$fulldate - [found] sick process killed" >> /srv/logs/health-check.log
fi
done < /srv/scripts/blacklist