#!/bin/bash

start_to_say () {
  sleep 0.03
  clear
  sleep 0.03
  lines=$(( RANDOM % 20 ))
  for (( i=0; i<lines; i++)); do
    echo ""
  done
  say "$1"
}

say () {
  echo -n "        "
  lines=$(( RANDOM % 10 ))
  for (( i=0; i<lines; i++)); do
    echo -n " "
  done
  type_out "$1"
}

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

printf '\e[8;50;130t'
#printf '\e[9;1t'

name=$1
city=$2

if [ -z "$name" ]; then
  user=$(whoami)
  if [ -f "name.txt" ]; then
    value=$(<./name.txt)
    start_to_say "$user your back again, should I still call you $value?"
    read ans
    case $ans in
      [Yy]* ) name=$value ;;
      * ) say "What should I call you then?" && read name;;
    esac
  else
    start_to_say "Who are you ... $user ?  What name would you like to go by?"
    read name
  fi

  start_to_say "Hello $name."
else
  start_to_say "Thanks for providing your name, $name."
fi

if [ -f "name.txt" ]; then rm name.txt fi
fi
echo $name >> name.txt

day="$(date +%a)"
day_number="$(date +%d)"

case $((day_number)) in
  1) ending="st";;
  2) ending="nd";;
  3) ending="rd";;
  *) ending="th";;
esac

say "It's $day the $day_number$ending,"

case $day in
	Sat|Sun) say "nice, the Weekend!";;
	Mon|Tue) say "lets start this week strong.";;
	Thu) say "almost the weekend.";;
	Wen) say "the week is coming along.";;
	Fri)
		if (($((day_number)) > 7 && $((day_number)) < 14)); then
			say "Happy Recharge Friday, Zendesk!"
		else
			say "Happy Friday!"
		fi;;
esac


if [ -z "$city" ]; then
	city="Denver"
	echo ""
  sleep 0.5
  say "$name, would you like the weather forecast for $city?"
  read ans
  echo ""

  case $ans in
    [Yy]* ) curl wttr.in/$city?u ;;
    * ) start_to_say "Let me know if you change your mind about wanting to know the forecast." ;;
  esac
else
  start_to_say "I see that you also supplied your location $name."
  say "Let me check the $city weather report for you."
  echo ""
	curl wttr.in/$city?u
fi

say "Should I send you somewhere fun, $name?"
read ans

case $ans in
  [Yy]* ) echo "Awesome, $name, check your browser!" ; case $OSTYPE in
            msys ) start chrome http://nipball.com ;;
            * ) open http://nipball.com ;;
          esac;;
  * ) start_to_say "Ok, I guess I'll just go without you." ;;
esac

