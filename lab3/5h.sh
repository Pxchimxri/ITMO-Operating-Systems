#!/bin/bash

operation="+"
result=1

(tail -f pipe) |
while true; do
read LINE;

case $LINE in
QUIT)
echo "Finished"
killall tail
killall n5g.sh
exit
;;

"+")
operation="+"
;;

"*")
operation="*"
;;

[0-9]*)
if [[ $operation == "+" ]];
then
let result=$result+$LINE
echo "New result $result"
else
let result=$result*$LINE
echo "New result $result"
fi
;;

*)
echo "Error"
killall tail
killall 5g.sh
exit
;;

esac

done
