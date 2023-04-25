#!/usr/bin/bash

filename=$1
fieldname=$2
fieldvalue=$3


#Part1
echo -n " Number of records is "
echo $(wc -l $filename)

#Part2
echo "Column headers for $filename : "
head -n 1 $filename

echo "Adding content to a file named $fieldname.csv"
head -n 1 $filename > $fieldname.csv
count=1
while (( $count<=100 ))
do
	i=$(head -n 1 $filename | cut -d"," -f$count)
	if [[ $i == "\"$fieldname\"" ]]; then
	       break
       else
		count=$((count+1))
	fi
done
echo $count
while read line
do
	c=$(echo $line | cut -d"," -f$count)
	if [[ $c == "\"$fieldvalue\"" ]] ; then
		echo $line >> $fieldname.csv
	fi
done < $filename

