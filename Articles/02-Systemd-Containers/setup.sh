#!/bin/bash
mv /answers/quadlet /home/ubuntu 
chown -R ubuntu:ubuntu /home/ubuntu 
podman build -t try-me /home/ubuntu/quadlet
