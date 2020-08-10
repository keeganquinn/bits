#!/usr/bin/env bash

# Run through Ansible playbooks in order.

set -e

ssh-add -l >/dev/null || ssh-add

rm -f files/*/nginx/*~

grep -E -q "^$(hostname)$" ansible.hosts || ansible-playbook dot.yml

ansible-playbook deploy.yml
