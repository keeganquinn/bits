#!/usr/bin/env bash

# Scan for updated libraries/dependencies on all qtk software packages.

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

set -e

PROJECTS=(
    "animamagica /srv/git/animamagica.git"
    "basslin.es /srv/git/basslin.es.git"
    "cwnmyr https://github.com/keeganquinn/cwnmyr.git"
    "partystarter /srv/git/partystarter.git")

scratch=$(mktemp -d)
chmod 0700 "${scratch}"
cleanup() {
    rm -rf "${scratch}"
    exit
}
trap cleanup INT TERM

for pspec in "${PROJECTS[@]}"; do
    IFS=" " read -r -a project <<< "${pspec}"
    work="${scratch:?}/${project[0]}"

    git clone -q "${project[1]}" "${work}"
    if ! yarn outdated --cwd "${work}" >/dev/null; then
        echo "${project[0]}: JS dependencies need update"
    fi
    if ! (cd "${work}"; bundle outdated --strict) >/dev/null; then
        echo "${project[0]}: Ruby dependencies need update"
    fi
    rm -rf "${work}"
done

cleanup
