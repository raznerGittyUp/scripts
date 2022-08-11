#!/bin/bash

name=$1
if [ -z "$name" ]
	then
		echo "Who are you?"
		read name
else
	echo "Thanks for providing your name"
fi

echo "Hello $name"

date="$(date +%a)"
case $date in
	Sat|Sun) echo "Happy Weekend";;
	Thu|Fri) echo "It's almost the weekend";;
	Mon|Tue) echo "Lets start this week strong";;
esac

echo "On this day: $date"

