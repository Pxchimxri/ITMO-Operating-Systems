#!/bin/bash

> report1.log

arr=()
step=0

while [[ true ]]
do
	if [[ $(( ${step} % 100000 )) -eq 0 ]]
	then
		echo ${#arr[@]} >> report1.log
	fi

	(( step++ ))
	arr+=( 1 2 3 4 5 6 7 8 9 10 )
done
