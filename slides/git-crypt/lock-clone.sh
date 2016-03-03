#!/bin/sh

. git-crypt/environment.sh

cd "$CLONE_DIR"
git-crypt lock
