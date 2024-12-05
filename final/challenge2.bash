#! /bin/bash

# Challenge 2:
# Write a script that contains indicators of compromise
# Takes two inputs: log file and ioc file
# Should only output IP. date/time, page accessed
# Save to an output file called report.txt

logFile="access.log"

IOCFile="IOC.txt"

result=$(cat "$logFile" | egrep -i -f "$IOCFile" | cut -d ' ' -f 4,1,7 | tr -d '[')

echo "$result" >> report.txt

cat "report.txt" | sort -n | uniq
