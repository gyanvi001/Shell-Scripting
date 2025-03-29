#Create a shell script which will help to generate cpu load alert for our system.
#How CPU load is calculated?
#What is CPU core?
#How Load average is calculated?

#!/bin/bash
echo "CPU Load Alert"
echo "================"
#(-bn1) Runs top in batch mode (-b), capturing a single snapshot (-n1) of system resource usage.
load = 'top -bn1 | grep load |awk '{printf "%.2f%%\t\t\n", $(NF-2)}'| cut -d '%' -f1'
echo $load
if [[ ${load%.*} > 1 ]]; #Checks if the integer part of load is greater than 1 before executing the condition
then
  echo "CPU load is high"
  echo "================"
  echo "CPU load is $load"
  echo "================"
  echo "Please check your system"
else
  echo "CPU load is normal"
  echo "================"
  echo "CPU load is $load"
  echo "================"
fi