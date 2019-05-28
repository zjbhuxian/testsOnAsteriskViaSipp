#!/bin/sh

#===========================================================================
# Create register data
# created by zhou at 2019.5.26
# Usage:
# 	./createData.sh start_ext num csv_file
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
num=$2
start_caller=$1
start_callee=$(($start + $num/2))
end_caller=$(($start_ext + $num/2 -1))
FILE=$3

echo "start_caller="$start_caller
echo "start_callee="$start_callee
echo "end_caller="$end_caller

while [ $start_caller -le $end_caller ]
do
	echo "$start_caller,$start_callee;[authentication username=$start_ext password=$start_ext]" >> $FILE
	start_ext=$(($start_ext + 1))
done

