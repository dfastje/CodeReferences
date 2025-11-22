#!/usr/bin/env bash
set -e

# Simple script: copy and rename SSL files to system locations.
# Usage: ./ssl-management.sh [SOURCE_DIR]
# Note: No auto-detection. Set SRC_DIR in the script before running,
# or pass SOURCE_DIR as the first argument.

SRC_DIR="/home/ramwithabow/Downloads/dfastje.work-ssl-bundle"
CERT_SRC="$SRC_DIR/domain.cert.pem"
KEY_SRC="$SRC_DIR/private.key.pem"

CERT_DST="/etc/ssl/certs/dfastjework.crt"
KEY_DST="/etc/ssl/private/dfastjework.key"

mkdir -p /etc/ssl/certs /etc/ssl/private/
cp "$CERT_SRC" "$CERT_DST"
cp "$KEY_SRC" "$KEY_DST"
chown root:root "$CERT_DST" "$KEY_DST"
chmod 0644 "$CERT_DST"
chmod 0600 "$KEY_DST"

exit 0
