#!/bin/sh

set -e

rbenv="${HOME}/.rbenv/bin/rbenv"

export RAILS_ENV=production

"${rbenv}" exec bundle install
"${rbenv}" sudo foreman export systemd /etc/systemd/system \
           -a mastodon -u deploy -e /etc/rails/mastodon.env

sudo systemctl daemon-reload

touch setk_mastodon.stamp
