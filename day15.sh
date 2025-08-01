#!/bin/bash

log_dir = "/var/log"
Days_old = 7 

echo "Find and delete files older than $Days_old in $log_dir ...."

find "$log_dir" -type f -name "*.log" -mtime +"$Days_old" -exec rm -f {} \;

echo "Deleted the log files"