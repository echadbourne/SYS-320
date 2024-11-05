#!/bin/bash

allLogs=""
file="/var/log/apache2/access.log"

function pageCount(){
allLogs=$(cat "$file" | cut -d' ' -f1,12 | sort | uniq -c )
}

function countingCurlAccess(){
curlAccess=$(echo "$allLogs"  | grep "curl" )
}

pageCount
countingCurlAccess
#echo "$allLogs"
echo "$curlAccess"
