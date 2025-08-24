#!/bin/bash
set -e 
diff <(ansible-inventory --list --yaml) ~/answers/hosts.yml
