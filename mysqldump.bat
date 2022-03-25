@echo off
REM This is Windows automation mysqldump batch scripts. save as .bat and run with task scheduler

REM Setting timestamp
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"

REM Dump SQL
C:\xampp\mysql\bin\mysqldump.exe -uroot  --databases gofish > C:\Users\yufeng\Documents\sqldump\gofish_%fullstamp%.sql

REM move files older than 14 days to another folder
ROBOCOPY C:\Users\yufeng\Documents\sqldump C:\Users\yufeng\Documents\sqldel /mov /minage:14

REM delete files older than 14 days
del C:\Users\yufeng\Documents\sqldel /q
