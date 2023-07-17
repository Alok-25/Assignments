#!/bin/bash

open -a "Safari"
pids=( $(ps -ef | grep "Safari" | awk '{ print $2 }') )
length=${#pids[@]}

min=0
max=$length
ran=$(jot -r 1 $min $max)
retries=10
endtime=$(( $(date +%s) + 60 ))

while [[ $(date +%s) -le $endtime ]]; do
    
    min=0
    max=$length
    ran=$(jot -r 1 $min $max)
    ran=$((ran - 1))
    pkill ${pids[ran]}
    sleep 5

    # Restart the process immediately
    echo "Restarting the process..."
    open -a "Safari" &
    new_pid=$!
    pids+=($new_pid)
    length=$((length + 1))
done

