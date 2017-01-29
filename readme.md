### edit the script, update your database variables

```
# Operating system variables (*required)
 user="linux_username"

# Database variables (*required)
 db_user="db_user"
 db_password="db_password"
 db_host="localhost"
 db_name="db_name"
```
### make it executable 

```
# chmod +x *.sh
```

### add into cronjob

```
# crontab -e
```

```
0 * * * * /home/linux_username/scripts/sql-hourly-backup.sh > /dev/null 2>&1
0 9 * * * /home/linux_username/scripts/sql-daily-backup.sh > /dev/null 2>&1
0 0 1 * * /home/linux_username/scripts/sql-monthly-backup.sh > /dev/null 2>&1
```
