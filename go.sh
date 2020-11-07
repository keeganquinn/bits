#!/usr/bin/env bash

# Run through Ansible playbooks in order.

set -e

ssh-add -l >/dev/null || ssh-add

rm -f files/*/nginx/*~

options=()
[ "$(uname -s)" == "Darwin" ] && options=(--ask-become-pass)

grep -E -q "^$(hostname -s)$" ansible.hosts || \
    ansible-playbook "${options[@]}" dot.yml

ansible-playbook deploy.yml
