#!/usr/bin/env bash

# Reinstall all Ruby gems on a server. For operations use when a dist-upgrade
# invalidates vendored gems with native extensions.

set -ex

for app in /srv/rails/*; do
    echo "${app}"
    rm -rf "${app}/shared/bundle/ruby"

    (
        cd "${app}/current" || return
        bundle install --path "${app}/shared/bundle" \
               --jobs 4 --without development test --deployment
    )
done

exit 0
