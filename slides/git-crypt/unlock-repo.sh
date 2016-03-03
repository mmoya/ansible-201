#!/bin/sh

. git-crypt/environment.sh

cd "$REPO_DIR"
git-crypt unlock "$KEYS_DIR/repo.key"
