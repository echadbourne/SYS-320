#! /bin/bash

logFile="/var/log/apache2/access.log"

function displayAllLogs(){
	cat "$logFile"
}

function displayOnlyIPs(){
    cat "$logFile" | cut -d ' ' -f 1 | sort -n | uniq -c
}

function displayOnlyPages(){
# like displayOnlyIPs - but only pages
	cat "$logFile" | cut -d ' ' -f 7 | sort -n | uniq -c

}

function histogram(){

	local visitsPerDay=$(cat "$logFile" | cut -d " " -f 4,1 | tr -d '['  | sort \
                              | uniq)
	# This is for debugging, print here to see what it does to continue:
	# echo "$visitsPerDay"

        :> newtemp.txt  # what :> does is in slides
	echo "$visitsPerDay" | while read -r line;
	do
		local withoutHours=$(echo "$line" | cut -d " " -f 2 \
                                     | cut -d ":" -f 1)
		local IP=$(echo "$line" | cut -d  " " -f 1)
          
		local newLine="$IP $withoutHours"
		echo "$IP $withoutHours" >> newtemp.txt
	done 
	cat "newtemp.txt" | sort -n | uniq -c
}

# function: frequentVisitors: 
function frequentVisitors(){
	:> visitFile.txt
	local visits=$(histogram)
	#echo "$visits"
	echo "$visits" | while read -r string;
	do
		local visitNumber=$(echo "$string" | cut -d " " -f 1)
		local IP=$(echo "$string" | cut -d " " -f 2)
		local date=$(echo "$string" | cut -d " " -f 3)
		if (( "$visitNumber" >= "10" )); then
			echo "$visitNumber $IP $date" >> visitFile.txt
		else
			echo " "
			break
		fi
	done 
	cat "visitFile.txt"
	echo " "

}

function suspiciousVisitors(){
	#read ioc.txt file
	iocfile="/home/champuser/SYS-320/week11/IOC.txt"
	#cat "$iocfile"
	:> susfile.txt
	local result=$(cat "$logFile" | egrep -i -f "$iocfile" | cut -d " " -f 1)
	echo "$result"  >> susfile.txt
	cat "susfile.txt" | sort -n | uniq -c
}
# Manually make a list of indicators of attack (ioc.txt)
# filter the records with this indicators of attack
# only display the unique count of IP addresses.  
# Hint: there are examples in slides

# Keep in mind that I have selected long way of doing things to 
# demonstrate loops, functions, etc. If you can do things simpler,
# it is welcomed.

while :
do
	echo "PLease select an option:"
	echo "[1] Display all Logs"
	echo "[2] Display only IPS"
	echo "[3] Display only pages"
	echo "[4] Histogram"
	echo "[5] Frequent Visitors"
	echo "[6] Suspicious Visitors"
	echo "[7] Quit"

	read userInput
	echo ""

	if [[ "$userInput" == "7" ]]; then
		echo "Goodbye"		
		break

	elif [[ "$userInput" == "1" ]]; then
		echo "Displaying all logs:"
		displayAllLogs

	elif [[ "$userInput" == "2" ]]; then
		echo "Displaying only IPS:"
		displayOnlyIPs

	elif [[ "$userInput" == "3" ]]; then
		echo "Displaying only Pages:"
		displayOnlyPages

	elif [[ "$userInput" == "4" ]]; then
		echo "Histogram:"
		histogram

	elif [[ "$userInput" == "5" ]]; then
		echo "Frequent Visitors:"
		frequentVisitors
        # Display frequent visitors
	# Display suspicious visitors
	elif [[ "$userInput" == "6" ]]; then
		echo "Suspicious Visitors:"
		suspiciousVisitors
	# Display a message, if an invalid input is given
	else
		echo "Please select a valid option"
	fi
done

