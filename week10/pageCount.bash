#!/bin/bash

allLogs=""
file="/var/log/apache2/access.log"

function pageCount(){
allLogs=$(cat "$file" | cut -d' ' -f7 | sort | uniq -c )
}

pageCount
echo "$allLogs"
