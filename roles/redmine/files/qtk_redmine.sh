#!/bin/sh

rbenv="${HOME}/.rbenv/bin/rbenv"

export RAILS_ENV=production
export REDMINE_LANG=en

"${rbenv}" exec bundle install
"${rbenv}" exec bundle exec rake generate_secret_token
"${rbenv}" exec bundle exec rake assets:precompile
"${rbenv}" exec bundle exec rake db:migrate
"${rbenv}" exec bundle exec rake redmine:load_default_data
"${rbenv}" sudo foreman export systemd /etc/systemd/system \
           -a redmine -u deploy -e /etc/rails/redmine.env
