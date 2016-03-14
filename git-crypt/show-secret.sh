#!/bin/sh

. git-crypt/environment.sh

cd "$CLONE_DIR"
find host_vars -name 'secrets.yml' -exec cat {} +
