#! /bin/bash
clear

# filling courses.txt
bash courses.bash

courseFile="courses.txt"

function displayCoursesofInst(){

echo -n "Please Input an Instructor Full Name: "
read instName

echo ""
echo "Courses of $instName :"
cat "$courseFile" | grep "$instName" | cut -d';' -f1,2 | \
sed 's/;/ | /g'
echo ""

}

function courseCountofInsts(){

echo ""
echo "Course-Instructor Distribution"
cat "$courseFile" | cut -d';' -f7 | \
grep -v "/" | grep -v "\.\.\." | \
sort -n | uniq -c | sort -n -r 
echo ""

}

function CourseLocations(){
	
	echo -n "Please Input a location: "
	read locationname
	echo ""
	echo "Courses in $locationname"
	cat "$courseFile" | grep "$locationname" | \
	cut -d ';' -f1,2,5,6,7 | sort | \
	sed 's/;/ | /g'
	echo ""
}

function Availability(){
	echo -n "Please input a subject name: "
	read subject
	echo ""
	echo "Available courses in $subject:"
	cat "$courseFile" | grep "$subject" | \
	cut -d ';' -f1,2,3,4,5,6,7,8,10 | sort | \
	sed 's/;/ | /g'
	echo ""
}

while :
do
	echo ""
	echo "Please select and option:"
	echo "[1] Display courses of an instructor"
	echo "[2] Display course count of instructors"
	echo "[3] Display courses in a location"
	echo "[4] Display available courses in a subject"
	echo "[5] Exit"

	read userInput
	echo ""

	if [[ "$userInput" == "5" ]]; then
		echo "Goodbye"
		break

	elif [[ "$userInput" == "1" ]]; then
		displayCoursesofInst

	elif [[ "$userInput" == "2" ]]; then
		courseCountofInsts

	elif [[ "$userInput" == "3" ]]; then
		CourseLocations

	elif [[ "$userInput" == "4" ]]; then
		Availability

	else
		echo "Please select a valid option"
	fi
done
