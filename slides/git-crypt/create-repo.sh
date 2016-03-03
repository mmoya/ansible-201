#!/bin/sh

. git-crypt/environment.sh

rm -fr "$REPO_DIR"

mkdir -p "$REPO_DIR"
cd "$REPO_DIR"

git init
echo "Happy hacking in the workshop!" >README
git add README
git ci -m 'Initial commit'
