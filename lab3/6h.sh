#!/bin/bash
echo $$ > .pid

A=1
MODE=""

usr1()
{
MODE="+"
}

usr2()
{
MODE="*"
}

term()
{
MODE="TERM"
}

trap 'usr1' USR1
trap 'usr2' USR2
trap 'term' SIGTERM

while true; do
case $MODE in
"+")
let A=$A+2
echo "new result after addition $A"
;;

"*")
let A=$A*2
echo "new result after muultip. $A"
;;

TERM)
echo "Finished from other process by signal"
exit
;;

esac
sleep 1
done
