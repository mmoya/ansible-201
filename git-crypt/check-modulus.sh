#!/bin/sh

remote_cert_modulus() {
    openssl s_client -no_ign_eof -connect "$1:443" </dev/null 2>/dev/null \
        | sed '/^-----BEGIN CERTIFICATE/,/^-----END CERTIFICATE/!d' \
        | openssl x509 -noout -modulus
}

local_key_modulus() {
    openssl rsa -noout -modulus -in "$1"
}

DOMAIN="ansible-workshop.mmoya.org"
KEYFILE="git-crypt/cert.key"

test "`remote_cert_modulus $DOMAIN`" = "`local_key_modulus $KEYFILE`" \
    && echo "PASS" \
    || echo "FAIL"
