#!/bin/sh

. git-crypt/environment.sh

mkdir -p "$KEYS_DIR"
git-crypt keygen "$KEYS_DIR/repo.key"
