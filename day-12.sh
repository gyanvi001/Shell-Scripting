#!/bin/bash

#Check if service is down & send alert on slack
 Process_Name="nginx"

 while true; do
        if ! pgrep $Process_Name > /dev/null
        then
                echo "Process is down so starting it"
                systemctl start $Process_Name
        fi
        sleep 5
    done