#!/bin/bash
NICE_VALUE=$(ps -o nice= -p $(pgrep -n -f "nice_guy.sh"))
if [ "$NICE_VALUE" -eq 19 ]; then
    echo "The nice value of the process is 19."
    exit 0

else
    echo "The nice value of the process is not 20. It is $NICE_VALUE."
    exit 1 
fi




