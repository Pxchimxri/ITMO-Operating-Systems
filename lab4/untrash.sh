#!/bin/bash

home_path="/home/user"
trash_dir="$home_path/.trash"
trash_log="$home_path/.trash.log"

function untrash {
	path=$(dirname "$2")
	if [[ ! -d "$path" ]]
	then
		echo "dir $path doesn't exist, file will be untrash in $HOME"
	fi

	name=$(basename "$2")
	while [[ -f "$path/$name" ]]
	do
		read -p "file $name is already exist in the scope $path. please enter another name" name <&1
	done

	ln "$1" "$path/$name"
	rm "$1"

	grep -Ev "$1" "$trash_log" > tmp.log
	cat tmp.log > "$trash_log"
	rm tmp.log
}

if [[ "$#" -ne 1 ]]
then
	echo "One argument requires"
	exit
fi

if [[ "$1" == *"/"* ]]
then
	echo "Only name, without path requires got $1"
	exit
fi

if [[ ! -d "$trash_dir" ]]
then
	echo "hidden directory doesn't exist"
	exit
fi

if [[ ! -f "$trash_log" ]]
then
	echo "hidden file trash.log doesn't exist"
	exit
fi

if [[ ! -s "$trash_log" ]]
then
	echo "hidden file trash.log is empty"
	exit
fi

IFS=$'\n'
for line in $(grep -E "$1" "$trash_log")
do
	echo "$line"
	file_path=$(echo "$line" | awk '{print $1}')
	link_name=$(echo "$line" | awk '{print $2}')

	read -p "do you want to untrash file $file_path? Y/N : " ans <&1

	#c
	case "$ans" in
	[Yy]*)
		echo "we will try to untrash file to $file_path"
		untrash "$link_name" "$file_path"
		echo "cuccess"
	;;

	*)
		echo "file won't be untrashed"
		continue
	;;

	esac

done
