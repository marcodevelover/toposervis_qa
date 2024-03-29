#!/bin/sh

set -ex;

cd /opt/app;

gem install bundler;

bundle check || bundle install;

bundle exec rake db:migrate;

yarn install --check-files;

rm -fr tmp/pids/server.pid && bundle exec rails s -p 3000 -b 0.0.0.0;