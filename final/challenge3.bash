#! /bin/bash

# Challenge 3:
# Write a script that takes the report.txt from the previous challenge
# and turns it into an HTML report. This should then be moved to
# the /var/www/html directory
# You should be able to reach it from your browser

# Hint:
# You can achieve this by printing <html>, <body>, <table> tags to the beginning of the file
# and the closing tags to the end
# Loops will be iunh the middle, reading from report .txt and printing <tr><td> content </tr></td> accordingly


file="report.txt"

report=$(cat "$file")

echo -e "<html>\n<body>\n<table>" >> report.html
echo "$report" | while read -r line;
do
	ip=$(echo "$line" | cut -d " " -f 1)
	date=$(echo "$line" | cut -d " " -f 2)
	page=$(echo "$line" | cut -d " " -f 3)
	echo "<tr>" >> report.html
	echo "<td> $ip </td> " >> report.html
	echo "<td> $date </td>" >> report.html
	echo "<td> $page </td>" >> report.html
	echo "</tr>" >> report.html

done

echo -e "</table>\n</body>\n</html>">> report.html

#mv report.html ~/var/www/html/
