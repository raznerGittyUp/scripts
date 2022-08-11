#!/bin/bash

type_out () {
  message="$1"
  for i in $(seq 0 $(expr length "${message}")) ; do
    echo -n "${message:$i:1}"
    sleep 0.05
  done
  echo ""
}

clear

name=$1
if [ -z "$name" ]
	then
		type_out "Who are you? ... "
		read name
		clear
		sleep 1
    type_out "Hello $name"
else
	type_out "Thanks for providing your name, $name"
fi

echo ""
sleep 1
day="$(date +%a)"
day_number="$(date +%d)"
ending="th."

case $((day_number)) in
  1) ending="st.";;
  2) ending="nd.";;
  3) ending="rd.";;
esac

case $day in
	Sat|Sun) type_out "Happy Weekend";;
	Mon|Tue) type_out "Lets start this week strong";;
	Thu) type_out "It's almost the weekend";;
	Wen) type_out "The week is coming along";;
	Fri)
		if (($((day_number)) > 7 && $((day_number)) < 14)); then
			type_out "Happy Focus Friday, Zendesk!"
		else
			type_out "Happy Friday the $day_number$ending"
		fi;;
esac

type_out "On this day: $day the $day_number$ending"
sleep 2

