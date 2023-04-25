#!/usr/bin/bash

file1=ca_500.csv
file2=us_500.csv

echo "Question  : "
#Question 5:
echo -n "1. Number of records is "
echo $(wc -l $file1)

echo -n "2. Number of records is "
echo $(wc -l $file2)

echo "Question 6:"
#Question 6:
echo "Column headers for $file1 : "
head -n 1 $file1
echo "Column headers for $file2 : "
head -n 1 $file2

echo "Question 7 : "
#Question 7:
head -n 1 $file1 > ca_city_Montreal.csv
while read line
do
	city=$(echo $line | cut -d"," -f5)
	if [[ $city == "\"Montreal\"" ]] ; then
		echo $line >> ca_city_Montreal.csv
	fi
done < $file1

