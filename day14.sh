#list the active services in Linux

# This script lists the active services in Linux using systemctl
#!/bin/bash

# Description: List all active services using systemctl

echo "===== Active Services ====="
systemctl list-units --type=service --state=active
echo "==========================="

# Ask the user to enter the service name
read -p "Enter the service name to check its status: " service

# Check the status of the service
echo "Checking status of $service.service ..."
systemctl status "$service"