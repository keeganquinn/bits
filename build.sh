#!/usr/bin/env bash

# Automated build script. Intended for continuous integration use.

set -ex

export PATH="$HOME/.local/bin:/usr/local/sbin:/usr/sbin:$PATH"

find . -name '*.html' -print0 | xargs -0 -n1 -t tidy -eq
find . -name '*.sh' -print0 | xargs -0 -n1 -t shellcheck

ansible-lint deploy.yml dot.yml

named-checkconf bind/named.conf.master
named-checkconf bind/named.conf.slave

named-checkzone basslin.es. bind/generic
named-checkzone qtk.io. bind/qtk.io
named-checkzone 22.11.10.in-addr.arpa. bind/ip4-ptp-22
named-checkzone 23.11.10.in-addr.arpa. bind/ip4-ptp-23

exit 0
