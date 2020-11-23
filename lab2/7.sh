#!/bin/bash
echo "" > n7.txt
IFS=$'\n'

for var in $(ps --no-headers -ef | awk '{print $2 " " $8}')
do
pid=$(echo $var | awk '{print $1}')
mem=$(cat /proc/$pid/io 2>/dev/null | grep "read_bytes" | awk '{print $2}')
path=$(echo $var | awk '{print $2}')
echo "$pid $path $mem" >> n7.txt
done

sleep 10

echo "" > current.txt
for var in $(ps --no-headers -ef | awk '{print $2 " " $8}')
do
pid=$(echo $var | awk '{print $1}')
mem=$(cat /proc/$pid/io 2>/dev/null | grep "read_bytes" | awk '{print $2}')
path=$(echo $var | awk '{print $2}')
echo "$pid $path $mem" >> current.txt
done

for var in $(cat current.txt)
do
curpid=$(echo $var | awk '{print $1}')
mem=$(echo $var | awk '{print $3}')
path=$(echo $var | awk '{print $2}')
prevmem=$(cat n7.txt | awk -v pid="$curpid" '{if ($1 == pid) print $3}')
if [[ $prevmem == "" ]]
then
continue
fi

res=$(echo "$mem - $prevmem" | bc)
echo "$curpid:$path:$res"

done | sort -n -r -k 3 | head -n 3

rm n7.txt current.txt


