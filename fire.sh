#!/usr/bin/env bash

# Run through Ansible playbooks in order.

set -e

ssh-add -l >/dev/null || ssh-add

read -rs -p 'Vault password: ' vault_password
echo


scratch=$(mktemp -d)
chmod 0700 "${scratch}"
cleanup() {
    rm -rf "${scratch}"
    stty echo
    exit
}
trap cleanup INT TERM

export ANSIBLE_VAULT_PASSWORD_FILE="${scratch}/vault_password"
echo "${vault_password}" > "${ANSIBLE_VAULT_PASSWORD_FILE}"


ansible-galaxy install -r requirements.yml

ansible-playbook dot.yml

ansible-playbook deploy.yml


cleanup
