#!/bin/bash

DBUSER="root"
DBPASS="CHANGEME!!!"
DBHOST="127.0.0.1"
#OUTPUT="/Users/yooniks/DBs"

#rm "$OUTPUTDIR/*gz" > /dev/null 2>&1

databases=`mysql -u $DBUSER -p$DBPASS -h$DBHOST -e "SHOW DATABASES;" | tr -d "| " | grep -v Database`

for db in $databases; do
    if [[ "$db" != "information_schema" ]] && [[ "$db" != "performance_schema" ]] && [[ "$db" != "mysql" ]] && [[ "$db" != _* ]] ; then
        echo "Dumping database: $db"
        mysqldump -u $DBUSER -p$DBPASS -h$DBHOST --databases $db > `date +%Y%m%d`.$db.sql
       # gzip $OUTPUT/`date +%Y%m%d`.$db.sql
    fi
done
