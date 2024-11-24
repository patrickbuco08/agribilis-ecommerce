#!/bin/sh

SCRIPT_DIR=$(dirname "$(realpath "$0")")

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$SCRIPT_DIR/agribilis.local.key" \
    -out "$SCRIPT_DIR/agribilis.local.crt" \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=OrgUnit/CN=localhost"

echo "Certificate and key generated in $SCRIPT_DIR"