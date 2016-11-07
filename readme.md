請編輯，換上db資訊

```
# Operating system variables (*required)
 user=`"linux_username"`

# Database variables (*required)
 db_user=`"db_user"`
 db_password=`"db_password"`
 db_host=`"localhost"`
 db_name=`"db_name"`
```

```
# crontab -e
```
### 加上 cronjob
```
0 * * * * /home/tenten/scripts/sql-hourly-backup.sh
0 9 * * * /home/tenten/scripts/sql-daily-backup.sh
0 0 1 * * /home/tenten/scripts/sql-monthly-backup.sh
```