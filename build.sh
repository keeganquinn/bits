#!/usr/bin/env bash

# Automated build script. Intended for continuous integration use.

set -ex

find . -name '*.html' -print0 | xargs -0 -n1 -t tidy -eq

ansible-lint deploy.yml dot.yml

named-checkconf bind/named.conf.master
named-checkconf bind/named.conf.slave

named-checkzone basslin.es. bind/generic
named-checkzone 22.11.10.in-addr.arpa. bind/ip4-ptp-22
named-checkzone 23.11.10.in-addr.arpa. bind/ip4-ptp-23
named-checkzone quinn.tk. bind/quinn.tk

exit 0
