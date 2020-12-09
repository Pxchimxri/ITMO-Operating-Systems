#!/bin/bash

shopt -s dotglob nullglob

file="$PWD/$1"

home_path="/home/user"
trash_dir="$home_path/.trash"
trash_log="$home_path/.trash.log"

if [[ "$#" -ne 1 ]]
then
	echo "One argument requires"
	exit
fi

if [[ ! -f "$1" ]]
then
	echo "file $1 doesn't exist"
	exit
fi

if [[ ! -d "$trash_dir" ]]
then
	mkdir "$trash_dir" 2>/dev/null && echo "directory trash created"
fi

if [[ ! -f "$trash_log" ]]
then
	touch "$trash_log" 2>/dev/null && echo "trash.log created"
fi

num=$(ls "$trash_dir" | tail -1)
((num++))

ln "$file" "$trash_dir/$num"
rm "$file"

echo "$file $trash_dir/$num" >> "$trash_log"
