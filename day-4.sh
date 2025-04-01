#Script to check the disk utilization
#Save this script as disk-monitor.sh in your home/vagrant/disk-monitor.sh directory
#!/bin/bash
while true
do
date >> /var/log/fs-monitor.txt
df -h >> /var/log/fs-monitor.txt
sleep 120
done


#Service file in /etc/systemd/system/fs-monitor.service
[Unit]
Description=Disk Utilization Monitor

[Service]
Type=simple
User=root
Group=root
TimeoutStartSec=0
Restart=on-failure
RestartSec=30
#ExecStartPre=
ExecStart=/home/vagrant/disk-monitor.sh
SyslogIdentifier=DiskUtilization
#ExecStop=

[Install]
WantedBy=multi-user.target