#!/usr/bin/env bash

# Update script. Intended for operations use.

set -e

scratch=$(mktemp -d)
cleanup() {
    rm -rf "${scratch}"
}
trap cleanup INT TERM


# Keep version/paths in sync with roles/redmine/tasks/main.yml

redmine_version="redmine-4.0.0"
curl -sS http://www.redmine.org/releases/"${redmine_version}".tar.gz | \
    tar xvfz - -C "${scratch}"

mkdir "${scratch}/${redmine_version}/.bundle"
(
    echo '---'
    echo 'BUNDLE_PATH: "vendor"'
    echo 'BUNDLE_DISABLE_SHARED_GEMS: "true"'
    echo 'BUNDLE_WITHOUT: "production"'
) > "${scratch}/${redmine_version}/.bundle/config"

cp roles/redmine/files/Gemfile.local roles/redmine/files/Gemfile.lock \
   "${scratch}/${redmine_version}/"
cp roles/redmine/files/database.yml \
   "${scratch}/${redmine_version}/config/"
cp roles/redmine/files/ruby-version \
   "${scratch}/${redmine_version}/.ruby-version"

(cd "${scratch}/${redmine_version}" && bundle update)
cp "${scratch}/${redmine_version}/Gemfile.lock" roles/redmine/files/


cleanup
