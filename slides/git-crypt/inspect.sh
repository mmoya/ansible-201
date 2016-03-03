#!/bin/sh

. git-crypt/environment.sh

cd "$REPO_DIR"

git config -l | grep git-crypt
tree .git/git-crypt
