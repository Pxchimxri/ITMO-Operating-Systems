#!/bin/bash

#if [[ $# -ne 3 ]]
#then
#	echo "Three parameters expected: report_file, ram_file, swap_file to added information about experiment"
#	exit
#fi

report_file="report2.txt"
ram_file="ram2.log"
swap_file="swap2.log"
time_file="time2.log"

> "$report_file"
> "$ram_file"
> "$swap_file"
> "$time_file"

while [[ true ]]
do
	top -b -n 1 > cur_top
	skript_info=$(cat cur_top | grep "mem[2]*.bash" | awk '$8 == "R" {print $0}')

	if [[ -n "$skript_info" ]]
	then
		cur_time=$(date +%X)

		echo "Time: $cur_time">> "$report_file"
		echo "Informattion about memory:" >> "$report_file"
		awk '$1 == "MiB" || $1 == "PID" {print $0}' cur_top >> "$report_file"
		awk '$2 == "Mem" {print $6}' cur_top >> "$ram_file"
		awk '$2 == "Swap:" {print $5}' cur_top >> "$swap_file"
		echo "$cur_time" >> "$time_file"
		echo "Information about mem.bash:" >> "$report_file"
		echo "$skript_info" >> "$report_file"
		echo "Information about first five processes:" >> "$report_file"
		cat cur_top | head -n 12 | tail -n 6 >> "$report_file"
		echo >> "$report_file"
		rm cur_top
	else
		rm cur_top
		echo "Last info in dmesg: " >> "$report_file"
		dmesg | grep "mem.bash" | tail -n 2 >> "$report_file"
		exit
	fi
	sleep 1
done
