#!/bin/bash
set -e
ansible-playbook ~/answers/01-verify.yml -i ~/hosts.yml || { exit 1; }

