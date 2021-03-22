#!/bin/bash
# https://stackoverflow.com/a/38732187/1935918

set -e

# install missing gems & node_modules
# bundle check || bundle install --jobs 20 --retry 5

if [ -f /app/tmp/pids/server.pid ]; then
  rm -f /app/tmp/pids/server.pid
fi

exec "$@"