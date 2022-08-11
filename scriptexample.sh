#!/bin/bash

type_out () {
  message="$1"
  for i in $(seq 0 $(expr length "${message}")) ; do
    letter=${message:$i:1}
    echo -n "$letter"
    case $letter in
      [[:space:]])
        sleep $(( ( RANDOM % 10 ) / 8 ));;
    esac
    sleep $(( ( RANDOM % 10 ) / 10 ))
  done
  echo ""
}

resize -s 90 150
clear

name=$1
city=$2

if [ -z "$name" ]
	then
		type_out "Who are you? ... "
		read name
		clear
		sleep 1
    type_out "Hello $name."
else
	type_out "Thanks for providing your name, $name."
fi

if [ -z "$city" ]
	then
		city="Denver"
fi

echo ""
sleep 1
day="$(date +%a)"
day_number="$(date +%d)"
ending="th"

case $((day_number)) in
  1) ending="st";;
  2) ending="nd";;
  3) ending="rd";;
esac

type_out "It's $day the $day_number$ending,"

case $day in
	Sat|Sun) type_out "nice, the Weekend!";;
	Mon|Tue) type_out "lets start this week strong.";;
	Thu) type_out "it's almost the weekend.";;
	Wen) type_out "the week is coming along.";;
	Fri)
		if (($((day_number)) > 7 && $((day_number)) < 14)); then
			type_out "Happy Recharge Friday, Zendesk!"
		else
			type_out "Happy Friday!"
		fi;;
esac

echo ""
sleep 0.5
type_out "Here is your weather forecast, for $city: "
echo ""
sleep 0.5

curl wttr.in/$city?u

