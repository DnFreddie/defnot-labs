#!/bin/bash

ssh node01

exit_code=$?

if [ $exit_code -eq 255 ]; then
    exit 0  
else
    exit 1 
fi
