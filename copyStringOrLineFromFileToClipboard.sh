#!/usr/bin/env bash

NEWLINE=$'\n'
TABULATOR=$'\t'

HELP_HEADER="This script is made mainly for easy copying commands from small, 2-line scripts in order to paste it easily to terminal and modify if needed.${NEWLINE}"\
"It allows also to copy the strings from args."

HELP_STRING="Options to choose:${NEWLINE}"\
"${TABULATOR}-f / --file arg: copies second line of the file to clipboard. The arg must be a valid path to the file.${NEWLINE}"\
"${TABULATOR}-s / --string args...: copies args to clipboard.${NEWLINE}"\
"${TABULATOR}-h / --help: shows help on how to use the script.${NEWLINE}"

if [[ $1 == "-h" || $1 == "--help" ]]
then
	echo "${NEWLINE}"\
	"$HELP_HEADER"\
	"${NEWLINE}"\
	"${NEWLINE}"\
	"$HELP_STRING"
elif [[ $# -lt 2 ]]
then
	echo "If you're not seeking for script help, you need to pass at least two arguments: an operation key and next args.${NEWLINE}$HELP_STRING"
else
	if [[ $1 == "-f" || $1 == "--file" ]]
	then
		if [[ -f $2 ]]
		then
			sed -n '2p' $2 | xclip -selection clipboard
		else
			echo "$2 isn't leading to a regular file. Please enter a proper path to a valid file."
		fi
	elif [[ $1 == "-s" || $1 == "--string" ]]
	then
		STRING_TO_BE_COPIED=""
		for argument in ${@:2}
		do 
			STRING_TO_BE_COPIED=$STRING_TO_BE_COPIED" "$argument
		done
		echo $STRING_TO_BE_COPIED | xclip -selection clipboard
	else
		echo "You haven't entered valid operation key. Please enter proper operation key with its arguments.${NEWLINE}$HELP_STRING"
	fi
fi
