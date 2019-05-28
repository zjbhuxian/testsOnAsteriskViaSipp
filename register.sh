#!/bin/sh

#===========================================================================
# Create register data
# created by zhou at 2019.5.26
# Usage:
# 	./register.sh start_ext num csv_file
#===========================================================================

printUsage()
{
	echo "Usage:
		./register.sh start_ext num csv_file:"
}

var_num=$#

testValidToRun()
{
	if [ $var_num -ne 3 ]; then
		echo 
		printUsage
		echo 
		exit 1
	fi
}

testValidToRun
start_ext=$1
num=$2
end_ext=$(($start_ext + $num -1))
FILE=$3

while [ $start_ext -le $end_ext ]
do
	echo "$start_ext;[authentication username=$start_ext password=$start_ext]" >> $FILE
	start_ext=$(($start_ext + 1))
done

