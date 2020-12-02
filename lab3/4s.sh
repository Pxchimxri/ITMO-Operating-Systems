#!/bin/bash
nice -n 19 /home/user/lab1/lab3/4.sh &

/home/user/lab1/lab3/4.sh &

/home/user/lab1/lab3/4.sh &

sleep 5 && kill $! &
