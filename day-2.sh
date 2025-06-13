#Curl Request
#!/bin/bash

URL="https://github.com/notHarshhaa/DevOps-Projects"
#echo "%{http_code}"

response=$(curl -s -w "%{http_code}" $URL)
http1_code=$(tail -n1 <<< "$response") #Get the last line
content =$(sed '$ d' <<< "$response") #Get all lines except the last one

echo "$http1_code"
if [ "$http1_code" -eq 200 ]; then
  echo "The URL is reachable."
else
  echo "The URL is not reachable. HTTP status code: $http1_code"
fi