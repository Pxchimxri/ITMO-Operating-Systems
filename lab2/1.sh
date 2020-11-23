#!/bin/bash
ps --no-headers -aU user | wc -l
ps --no-headers -aU user | awk  '{print $1 ":" $4}'

