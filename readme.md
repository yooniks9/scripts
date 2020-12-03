### edit the script, update your database variables

```
# Database variables (*required)
 db_user="db_user"
 db_password="db_password"
 db_host="127.0.0.1"
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
0 * * * * /home/ubuntu/scripts/sql-hourly-backup.sh > /dev/null 2>&1
0 9 * * * /home/ubuntu/scripts/sql-daily-backup.sh > /dev/null 2>&1
0 0 1 * * /home/ubuntu/scripts/sql-monthly-backup.sh > /dev/null 2>&1
```

### add into cronjob (root) run every 5 mins

```
# sudo crontab -e
```

```
*/5 * * * * /home/ubuntu/scripts/check-services.sh > /dev/null 2>&1
```