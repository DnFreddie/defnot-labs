#!/bin/bash
set -e

CONFIG="$HOME/ansible.cfg"
INVENTORY="$HOME/ansible/inventory"
ROLES="$HOME/ansible/roles"
CHANGES="$(ansible-config dump --only-changed)"

[ -f "$CONFIG" ] && [ -f "$INVENTORY" ]

grep -E "INVENTORY_PATH|DEFAULT_HOST_LIST" <<< "$CHANGES" | grep -qF "$INVENTORY"

grep "DEFAULT_ROLES_PATH" <<< "$CHANGES" | grep -qF "$ROLES"
