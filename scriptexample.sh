#!/bin/bash

type_out () {
  message="$1"
  for (( i=0; i<${#message}; i++ )); do
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
	  user=$(whoami)
		type_out "Who are you ... $user ?  What name would you like to go by?"
		read name
		clear
		sleep 1
    type_out "Hello $name."
else
	type_out "Thanks for providing your name, $name."
fi

echo ""
sleep 1
day="$(date +%a)"
day_number="$(date +%d)"

case $((day_number)) in
  1) ending="st";;
  2) ending="nd";;
  3) ending="rd";;
  *) ending="th";;
esac

type_out "It's $day the $day_number$ending,"

case $day in
	Sat|Sun) type_out "nice, the Weekend!";;
	Mon|Tue) type_out "lets start this week strong.";;
	Thu) type_out "almost the weekend.";;
	Wen) type_out "the week is coming along.";;
	Fri)
		if (($((day_number)) > 7 && $((day_number)) < 14)); then
			type_out "Happy Recharge Friday, Zendesk!"
		else
			type_out "Happy Friday!"
		fi;;
esac


if [ -z "$city" ]
	then
		city="Denver"
		echo ""
    sleep 0.5
    type_out "$name, would you like the weather forecast for $city?"
    read ans
    echo ""
    sleep 0.5
    clear

    case $ans in
      [Yy]* ) curl wttr.in/$city?u ;;
      * ) type_out "Let me know if you change your mind about wanting to know the forecast." ;;
    esac
else
  type_out "I see that you also supplied your location $name."
  type_out "Let me check the $city weather report for you."
  echo ""
	curl wttr.in/$city?u
fi

type_out "Should I send you somewhere fun, $name?"
read ans

case $ans in
  [Yy]* ) case $OSTYPE in
            msys ) start chrome http://nipball.com ;;
            * ) open http://nipball.com ;;
          esac;;
  * ) type_out "Ok, I guess I'll just go without you." ;;
esac

