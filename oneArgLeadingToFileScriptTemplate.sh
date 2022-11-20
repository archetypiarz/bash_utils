#!/usr/bin/env bash
if [[ $# -lt 1 ]]
then
	echo "No argument has been typed. Please enter a path leading to the valid file."
elif [[ -f $1 ]]
then
	#Here place your operation with a file
	echo "$1 is a regular, valid file."
else
	echo "$1 isn't leading to a regular file. Please enter a proper path to a valid file."
fi


