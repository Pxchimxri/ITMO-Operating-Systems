#!/bin/bash

if [[ $# -ne 1 ]]
then
	echo "One parameter needed: array size"
	exit
fi

arr=()
step=0

while [[ true ]]
do
	if [[ ${#arr[@]} -gt $1 ]]
	then
		exit
	fi

	(( step++ ))
	arr+=( 1 2 3 4 5 6 7 8 9 10 )
done
