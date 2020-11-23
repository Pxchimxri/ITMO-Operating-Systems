#!/bin/bash
for pid in $(ps --no-headers  -ef | awk '{print $2}')
do
fileStatus="/proc/"$pid"/status"
fileSched="/proc/"$pid"/sched"
ppid=$(grep -is "ppid" "$fileStatus" | grep -o "[0-9]\+")
sumExecRuntime=$(grep -is "se\.sum_exec_runtime" "$fileSched" | awk '{print $3}')
nrSwitches=$(grep -is "nr_switches" "$fileSched" | awk '{print $3}')
if [[ -z $ppid ]]
then continue
fi
average_runtime=$(echo "scale=4; $sumExecRuntime/$nrSwitches" | bc)
echo "$pid $ppid $average_runtime"
done | sort -nk2 | awk '{print "PID="$1" : PPID="$2" : ART="$3""}' > 4.txt
