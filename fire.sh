#!/usr/bin/env bash

# Run through Ansible playbooks in order.

set -e

scratch=$(mktemp -d)
chmod 0700 "${scratch}"
function cleanup {
    rm -rf "${scratch}"
    exit
}
trap cleanup INT TERM

read -rs -p 'Vault password: ' vault_password
echo

export ANSIBLE_VAULT_PASSWORD_FILE="${scratch}/vault_password"
echo "${vault_password}" > "${ANSIBLE_VAULT_PASSWORD_FILE}"


ansible-galaxy install -r requirements.yml

ansible-playbook dot.yml

ansible-playbook deploy.yml


cleanup
