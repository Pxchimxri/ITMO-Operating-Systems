#!/bin/bash

path="/home/user"
restore="$path/restore"

last_backup=$(find "$path" -type d -name "Backup*" | sort | tail -1)

if [[ -z "$last_backup" ]]
then
	echo "there are no backups in $path"
	exit
fi

if [[ -d "$restore" ]]
then
	rm  -fr "$restore/*"
else
	mkdir "$restore" 2>/dev/null && echo "$restore folder is created"
fi

for file in $(find "$last_backup" -type f | grep -Ev "*\.[[:digit:]]{4}-[[:digit:]]{2}-[[:digit:]]{2}")
do
	if [[ -n "$file" ]]
	then
		name=$(basename "$file")
		cp "$file" "$restore/$name"
	fi
done

ls "$restore"
