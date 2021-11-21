#!/bin/sh

cd /opt/app

#rm -fr package-lock.json Gemfile.lock yarn.lock;

gem install bundler;

bundle check || bundle install;

bundle exec rake db:migrate;

yarn install --check-files;

rm -fr tmp/pids/server.pid && bundle exec rails s -p 3003 -b 0.0.0.0;