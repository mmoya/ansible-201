#!/bin/sh

. git-crypt/environment.sh

cd "$REPO_DIR"

mkdir -p host_vars/host1 tls
echo "var1: value1"  >host_vars/host1/secrets.yml
echo "var2: value2" >>host_vars/host1/secrets.yml
git add host_vars
git ci -m 'Added secrets'
