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

day="$(date +%a)"
day_number="$(date +%d)"
ending="th."

case $((day_number)) in
  1) ending="st.";;
  2) ending="nd.";;
  3) ending="rd.";;
esac

case $day in
	Sat|Sun) echo "Happy Weekend";;
	Mon|Tue) echo "Lets start this week strong";;
	Thu) echo "It's almost the weekend";;
	Wen) echo "The week is coming along";;
	Fri)
		if (($((day_number)) > 7 && $((day_number)) < 14)); then
			echo "Happy Focus Friday, Zendesk!"
		else
			echo "Happy Friday the $day_number$ending"
		fi;;
esac

echo "On this day: $day the $day_number$ending"

