#!/bin/bash

PID=$(pgrep -n -f "nice_guy.sh")

if [ -z "$PID" ]; then
    echo "No process found matching 'nice_guy.sh'."
    exit 1
fi

NICE_VALUE=$(ps -o nice= -p "$PID")

if [ "$NICE_VALUE" -eq 19 ]; then
    echo "The nice value of the process is 19."
    exit 0
else
    echo "The nice value of the process is not 19. It is $NICE_VALUE."
    exit 1 
fi

