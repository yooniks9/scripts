#!/bin/bash 

#get the current date
BACKUPTIME=`date +%d-%b-%Y`

#create a backup file using the current date in it's name
DESTINATION=/home/$USER/backup/html-$BACKUPTIME.tar.gz 

#the folder that contains the files that we want to backup
SOURCEFOLDER=/var/www/html 

#create the backup
tar -cpzf $DESTINATION $SOURCEFOLDER 

#change ownership
chown -R $USER:$USER $DESTINATION

# Clean up files longer than 10 days [ 10 x 1440 = 14400 ] (command)
find /home/$USER/backup/*.tar.gz -type f -mmin +14400 -exec rm {} \;
