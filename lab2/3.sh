#!/bin/bash
ps --no-headers -eo pid,stime | sort -k 2 | tail -n -1 | awk '{print $1}'  
