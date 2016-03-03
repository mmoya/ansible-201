#!/bin/sh

. git-crypt/environment.sh

rm -fr "$CLONE_DIR"

git clone "$REPO_DIR" "$CLONE_DIR"
