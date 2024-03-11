#!/bin/sh

if [ $# -eq 0 ] || [ -z "$1" ] || [ -z "$2" ]
then
	echo "!!! One or more aruguments not specified !!!"
	echo "Pass the arguments in the order: "
	echo "   1. Path of the directory."
	echo "   2. String to search over files."
	exit 1
fi 

filesdir=$1
searchstr=$2

if [ -d "$filesdir" ]
then
        echo "${filesdir} is present"
else
	echo "failed: ${filesdir} is not a directory"
	exit 1
fi

num_files=$(find "${filesdir}" -type f | wc -l)

num_occurence=$(grep -r "${searchstr}" "${filesdir}" | wc -l)
echo "The number of files are ${num_files} and the number of matching lines are ${num_occurence}"

exit 0