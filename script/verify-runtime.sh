#!/bin/sh
set -eu

nginx -V
openssl version

openssl list -tls-groups | grep -q 'X25519MLKEM768'
openssl list -tls-groups | grep -q 'SecP256r1MLKEM768'
