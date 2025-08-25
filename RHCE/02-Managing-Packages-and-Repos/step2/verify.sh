#!/bin/bash
set -e
ansible-playbook ~/answers/02-verify.yml -i ~/hosts.yml || { exit 1; }

