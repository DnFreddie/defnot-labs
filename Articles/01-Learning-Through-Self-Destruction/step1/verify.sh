#!/bin/bash

ssh node01

exit_code=$?

if [ $exit_code -eq 255 ]; then
    exit 0  # Exit with code 1 if the exit code is 255
else
    exit 1 
fi
