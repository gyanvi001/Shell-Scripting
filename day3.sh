#!/bin/bash

backup_dirs=("/etc" "/home")
dest_dir="/root/backup_today"
mkdir -p "$dest_dir"
backup_date=$(date +%b-%d-%Y)

echo "Starting backup of: ${backup_dirs[@]}"

for i in "${backup_dirs[@]}"; do
    backup_filename=$(basename $i)-$backup_date.tar.gz
    sudo tar -Pczf /tmp/$backup_filename "$i"

    if [ $? -eq 0 ]; then
        echo "Backup of $i completed successfully."
    else
        echo "Backup of $i failed."
    fi

    cp "/tmp/$backup_filename" "$dest_dir"
    if [ $? -eq 0 ]; then
        echo "Backup of $i copied to $dest_dir successfully."
    else
        echo "Backup of $i failed to copy to $dest_dir."
    fi
done

sudo rm /tmp/*.gz
echo "All temporary backup files have been removed. Backup completed."
