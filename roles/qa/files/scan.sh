#!/usr/bin/env bash

# Scan for updated libraries/dependencies on all qtk software packages.

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

set -e

PROJECTS=(
    "animamagica /srv/git/animamagica.git"
    "basslin.es /srv/git/basslin.es.git"
    "bln_player https://github.com/keeganquinn/bln_player.git"
    "qtk.io /srv/git/qtk.io.git"
    "sacredflame /srv/git/sacredflame.git")

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
    if [ -f "${work}/package-lock.json" ] \
           && ! (cd "${work}"; npm outdated) >/dev/null; then
        echo "${project[0]}: JS dependencies need update"
    fi
    if [ -f "${work}/Gemfile.lock" ] \
           && ! (cd "${work}"; bundle outdated --strict) >/dev/null; then
        echo "${project[0]}: Ruby dependencies need update"
    fi
    rm -rf "${work}"
done

echo "Ruby: 2.7.2 - check https://www.ruby-lang.org/"
echo "Redmine: 4.1.1 - check https://redmine.org/"
echo "Roundcube: 1.4.11 - check https://roundcube.net/"
echo "Nextcloud: check https://cloud.qtk.io/settings/admin/overview"

cleanup
