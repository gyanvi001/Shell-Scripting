#!bin/bash
log_dir = "/var/log"
Days_old = 7

echo " Find and delete the log files older than seven days $log_dir"
find "$log_dir" -type f -name ".*log" -mtime +"$Days_old" -exec rm -f {} \;
echo "Deleted the log files"

# Process Monitoring
# Write a script to display the top 10 memory-consuming processes.

#!bin/bash

echo "Top 10 process to sort the process"
ps aux --sort=%mem | head -n 11

#Write a script to check if a given file exists and is writable.





