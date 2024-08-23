#!/bin/bash
ssh_try=$(ssh node_01)
if [ $? -ne 0 ]; then
    exit 0
else
    exit 1 
fi

