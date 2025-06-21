#!/bin/bash

#Step 1:- Set db parameters
DB_user = "root"
DB_pass = "login601"
DB_name = "mysql"
Bacup_Dir = "/backup/db"
Upgrade_Script = "/tmp/upgrade.sh"

#Step 2:- Craete backup directory
echo "Creating backup directory..."
mkdir -p "$Bacup_Dir"
Backup_File = "$Bacup_Dir/$(date+%Y-%m-%d).sql
mysqldump -u "$DB_user" -p"DB_pass" "$DB_name" > "$Backup_File"


if [ $? -eq 0 ]; then
    echo "Backup of $DB_name completed successfully."
else
    echo "Backup of $DB_name failed."
fi


echo "Running the upgrade script..."
chmod +x "$Upgrade_Script"
mysql -u "$DB_user" -p"$DB_pass" < "$Upgrade_Script"

#Upgrade_Script.Tells the shell to read the contents of the file stored inUpgrade_Script and pipe it into the MySQL client.