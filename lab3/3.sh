#!/bin/bash
crontab -l > current 2>/dev/null
echo "*/5 * * * 0 /home/user/lab1/lab3/1.sh" >> current
crontab current
rm current
