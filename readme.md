
cronjob:

0 * * * * /home/tenten/scripts/sql-hourly-backup.sh
0 9 * * * /home/tenten/scripts/sql-daily-backup.sh
0 0 1 * * /home/tenten/scripts/sql-monthly-backup.sh
