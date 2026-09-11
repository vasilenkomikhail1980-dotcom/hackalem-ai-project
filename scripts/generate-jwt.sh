#!/bin/sh
set -eu

mkdir -p jwt

if [ -f jwt/jwt.hex ]; then
  echo "jwt/jwt.hex already exists"
  exit 0
fi

openssl rand -hex 32 | tr -d '\n' > jwt/jwt.hex
chmod 600 jwt/jwt.hex

echo "Created jwt/jwt.hex"
