#!/bin/sh
set -eu

echo "Checking Geth RPC..."
curl -s -X POST http://127.0.0.1:8545 \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}'
echo

echo "Checking Prysm beacon health..."
curl -s -o /dev/null -w "HTTP %{http_code}\n" \
  http://127.0.0.1:3500/eth/v1/node/health
