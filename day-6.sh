
#!/bin/bash

#Database Configuration
DB_USER = "root"
DB_PASS = "devops"
DB_NAME = "MySQL"
BACKUP_DIR = "/var/backups/mysql"
TimeStamp = $(date + "%Y%m%d%H%M%S")
BACKUP_FILE = "$BACKUP_DIR/$DB_NAME-$TimeStamp.sql"

#Create backup directory if it doesn't exist
mkdir -p $BACKUP_DIR

#Backup MySQL database
mysqldump -u "$DB_USER" -p "$DB_PASS"  "$DB_NAME" > $BACKUP_FILE
if [ $? -eq 0 ]; then
    echo "MySQL backup successful: $BACKUP_FILE"
else
    echo "MySQL backup failed"
    exit 1
fi

#Compress the backup file
gzip "$BACKUP_FILE"

#Remove the old backups 
find $BACKUP_DIR -type -f -name "*.sql.gz" -mtime +60 -exec rm {} \;
if [ $? -eq 0 ]; then
    echo "Old backups removed successfully"
else
    echo "Failed to remove old backups"
    exit 1
fi

#Log the backup process
echo "Backup Completed: $BACKUP_FILE" >> "$BACKUP_DIR/backup.log"

