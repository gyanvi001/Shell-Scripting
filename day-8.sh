#!/bin/bash

#Function to display usage
show_usage() {
 echo "Usage: $0 <city_name"
 echo "Example: $0 Delhi"
}

#Check if city is provided
CITY="$1"
if [ -z "$CITY" ]; then 
echo "Error: City name is not present"
show_usage
exit 1
fi

# Displaying a loading message
echo "Fetching weather details for $CITY.. "

#Check if city is provided
WEATHER =$(curl -s "https://wttr.in/${CITY}?format=3")

#Check if the response is valid
if [[ "$WEATHER" == *"Unknown location"* ]]; then 
  echo "Error: Unable to fetch weather details for '$CITY'. Please check the city name"
  exit 1
fi

#Display the weather details
echo "======================="
echo "   WEATHER REPORT       "
echo "========================"
echo "$WEATHER"
echo "========================"





