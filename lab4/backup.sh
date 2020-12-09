#!/bin/bash

today=$(date +"%Y-%m-%d")
path="/home/user"
source="$path/source"

if [[ ! -d "$source" ]]
then
	echo "source dir isn't exist"
	exit
fi

last_backup=$(find "$path" -type d -name "Backup*" | sort | tail -1)
report="$path/backup-report"

if [[ -z "$last_backup" || $(basename "last_backup") < "Backup-"$(date -d "$today - 7 days" +"%Y-%m-%d") ]]
then
	last_backup="$path/Backup-$today"

	mkdir "$last_backup"
	echo "New backup: $last_backup $today" >> "$report"

	cp -R "$source/." "$last_backup"
	for file in $(ls "$source")
	do
		echo $(basename "$file") >> "$report"
	done
else
	echo "New backup: $last_backup $today" >> "$report"

	> changed.txt
	> added.txt

	for file in $(ls "$source")
	do
		name=$(basename "$file")
		last_version=$(find "$last_backup" -name "$name")
		if [[ -n "$last_version" ]]
		then
			if [[ ! $(stat -c %s "$last_version") -eq $(stat -c %s "$source/$name") ]]
			then
				mv "$last_version" "$last_version.$today"
				echo "$name $name.$today" >> changed.txt
			fi
		else
			echo "$name" >> added.txt
		fi

		cp "$source/$name" "$last_backup"
	done

	if [[ -s added.txt ]]
	then
		cat added.txt >> "$report"
	fi

	if [[ -s changed.txt ]]
	then
		cat changed.txt >> "$report"
	fi

	rm changed.txt
	rm added.txt
fi

less "$report"
