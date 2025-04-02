#!/bin/bash

#Define colors
RESET="\033[0m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
MAGENTA="\033[35m"
CYAN="\033[36m"

#MySQL credentials
MYSQL_USER="root"
MYSQL_PASS="devops"
MYSQL_HOST="localhost"

#Run MySQL SHOW PROCESSLIST command
RESULT=$(mysql -u$MYSQL_USER -p$MYSQL_PASS -h$MYSQL_HOST -e "SHOW PROCESSLIST;" 2>/dev/null)

#Check if the command was successful
if [[ $? -ne 0 ]]; then
    echo -e "${RED}Error: Unable to connect to MySQL server.${RESET}"
    exit 1
fi

# Process and colorize the output
echo -e "${CYAN}-------MySQL Process List--------${RESET}"
echo -e "$RESULT" | while IFS= read -r line; do
    if [[ $line == *"Id"* && $line == *"Command"* ]]; then
        # Header line
        echo -e "${YELLOW}$line${RESET}"
    else
        # Data rows
        echo "$line" | awk -v reset="$RESET" -v green="$GREEN" -v cyan="$CYAN" -v magenta="$MAGENTA" -v yellow="$YELLOW" '
            {
                printf cyan $1 reset "\t" green $2 reset "\t" magenta $3 reset "\t" yellow $4 reset "\t";
                for (i=5; i<=NF; i++) printf $i " ";
                    printf "\n";
            }'
        fi
done
                
        

