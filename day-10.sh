#!/bin/bash

BACKUP_DIR = "/path/to backup/dir"
DATE= $(date+"%Y-%m-%d")
MYSQL_USER = "root"
MYSQL_PASSWORD = "password"
MYSQL_HOST = "localhost"
DATABASES = $(mysql -u $MYSQL_USER -p$MYSQL_PASSWORD -h $MYSQL_HOST -e "SHOW DATABSES;" | grep -Ev "(Database|information_schema|performance_schema|mysql|sys)" )

#Create backup directory if it does'nt exist

mkdir -p $BACKUP_DIR/$DATE
#Backup all databses
for DB in $DATABASES:
do
   mysqldump --user=$MYSQL_USER --password=$MYSQL_PASSWORD --host=$MYSQL_HOST --databases $DATABASES > $BACKUP_DIR/$DATE/backup.sql

done


#Optional: Remove the backups older than 30 days
find $BACKUP_DIR -type d -mtime +7 -exec rm -rf {} \;

echo "Backup completed on $DATE"