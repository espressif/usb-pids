#!/bin/bash

# Check a file in this repo for sanity. Used for CI to quickly highlight
# errors that aren't easy to spot in a diff (e.g. 0xB101 instead of 0x8101)
# Written in Bash because of reasons.

#Check command line args. We need two.
if [ -z "$2" ]; then
	echo "Simple pid file sanity checker thing"
	echo "Usage: $0 file_to_check starting_pid"
	exit 1
fi

#Read into file descriptor 6.
exec 6< $1

#skip header
while read l <&6 && ! [ "$l" = 'PID    | Product name' ]; do
	:
done

#See if the lines a. have a '| desc' bit that is not zero, and if they
#start with the next PID in order.
pid=$(($2))
# https://stackoverflow.com/questions/4165135/how-to-use-while-read-bash-to-read-the-last-line-in-a-file-if-there-s-no-new
DONE=false
until $DONE; do
	read l <&6 || DONE=true
	if [ -n "$l" ]; then
		#Split the line into pid and desc
		rpid="${l% |*}"
		desc="${l#*| }"

		#Check if there is a description. This also errors out when there is no | char.
		if [ -z "$desc" ]; then
			echo "Malformed line: '$l'"
			exit 1
		fi

		# Check PID validity
		expect=`printf "0x%04X" $pid`
		if [ "$rpid" != "$expect" ]; then
			echo "Malformed line: '$l'"
			echo "Expected pid $expect, got pid $rpid"
			exit 1
		fi
		#OK, next PID.
		pid=$((pid+1));
	fi
done

#See if we parsed any lines at all.
if [ "$pid" = $(($2)) ]; then
	echo "Error: No entries in file?"
	exit 1;
fi

#All OK.
exit 0

