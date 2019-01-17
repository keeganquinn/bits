#!/usr/bin/env bash

# Scan for updated libraries/dependencies on all qtk software packages.

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

set -e

scratch=$(mktemp -d)
chmod 0700 "${scratch}"
cleanup() {
    rm -rf "${scratch}"
    exit
}
trap cleanup INT TERM


# animamagica
git clone -q /srv/data/git/animamagica.git "${scratch}/animamagica"
if ! yarn outdated --cwd "${scratch}/animamagica" >/dev/null; then
    echo 'Anima Magica JS dependencies need update!'
    echo
fi
if ! (cd "${scratch}/animamagica"; bundle outdated) >/dev/null; then
    echo 'Anima Magica Ruby dependencies need update!'
    echo
fi
rm -rf "${scratch}/animamagica"


# basslin.es
git clone -q /srv/data/git/basslin.es.git "${scratch}/basslin.es"
if ! yarn outdated --cwd "${scratch}/basslin.es" >/dev/null; then
    echo 'basslin.es JS dependencies need update!'
    echo
fi
if ! (cd "${scratch}/basslin.es"; bundle outdated) >/dev/null; then
    echo 'basslin.es Ruby dependencies need update!'
    echo
fi
rm -rf "${scratch}/basslin.es"


# cwnmyr
git clone -q https://github.com/keeganquinn/cwnmyr.git "${scratch}/cwnmyr"
if ! yarn outdated --cwd "${scratch}/cwnmyr" >/dev/null; then
    echo 'cwnmyr JS dependencies need update!'
    echo
fi
if ! (cd "${scratch}/cwnmyr"; bundle outdated) >/dev/null; then
    echo 'cwnmyr Ruby dependencies need update!'
    echo
fi
rm -rf "${scratch}/cwnmyr"


# partystarter
git clone -q /srv/data/git/partystarter.git "${scratch}/partystarter"
if ! yarn outdated --cwd "${scratch}/partystarter" >/dev/null; then
    echo 'PartyStarter JS dependencies need update!'
    echo
fi
if ! (cd "${scratch}/partystarter"; bundle outdated) >/dev/null; then
    echo 'PartyStarter Ruby dependencies need update!'
    echo
fi
rm -rf "${scratch}/partystarter"

cleanup
