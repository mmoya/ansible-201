#!/bin/sh

. git-crypt/environment.sh

cd "$REPO_DIR"

echo "host_vars/**/secrets.yml filter=git-crypt diff=git-crypt" >.gitattributes
echo "tls/*.key filter=git-crypt diff=git-crypt" >>.gitattributes
git add .gitattributes
git ci -m 'Configure encryption for host_vars secrets and tls/*.key files'
