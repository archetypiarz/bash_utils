#!/usr/bin/env bash

# Had some troubles with using that escaped string both in echo and in sed. Finally decided to use two variables.
BASH_SHEBANG_ESCAPED="#!\/usr\/bin\/env bash"
BASH_SHEBANG="#!/usr/bin/env bash"

if [[ $# -lt 1 ]]
then
	echo "No argument has been typed. Please enter a path leading to the valid file."
elif [[ -f $1 ]]
then
	if ! [[ -s $1 ]]
	then
		echo "File is empty. Using echo instead of sed."
		echo ${BASH_SHEBANG} > $1
	else
		FILE_FIRST_LINE=$(sed -n '1p' $1)
		if [[ $FILE_FIRST_LINE == $BASH_SHEBANG ]]
		then
			echo "There is a shebang in this file already."
		else
			sed -i "1s/^/${BASH_SHEBANG_ESCAPED}\n/" $1
		fi
	fi
else
	echo "$1 isn't leading to a regular file. Please enter a proper path to a valid file."
fi
