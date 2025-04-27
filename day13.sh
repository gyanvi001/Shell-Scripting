#Script to print even number between 1 to 100

#!/bin/bash

# Loop through numbers 1 to 100
for i in {1..100}
do
#Check if the number is even 
if[$((i%2==0))]; then
echo "$i is even"
else
echo "$i is odd"
fi
done
