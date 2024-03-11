#!/bin/sh

if [ $# -eq 0 ] || [ -z "$1" ] || [ -z "$2" ]
then
	echo "!!! One or more aruguments not specified !!!"
	echo "Pass the arguments in the order: "
	echo "   1. Path of the file including its name."
	echo "   2. String to append into file."
	exit 1
fi 

writefile=$1
writestr=$2

if [ -e "$writefile" ]
then
        echo "${writefile} file exists, and resetting the file to NULL"
	cat /dev/null > ${writefile}
else
	echo "${writefile} file not exists, creating one!"
	mkdir -p "$(dirname $writefile)" && touch "$writefile"
fi
if [ -d "$(dirname $writefile)" ]
then
	echo "${writefile} writing to file is successful"
	echo "${writestr}" | tee ${writefile}
else
	echo "===***File creation or writing to a file failed***==="
	exit 1
fi
exit 0