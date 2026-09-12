#!/bin/sh
set -eu

echo "Checking Geth RPC..."
GETH_RESPONSE=$(curl -fsS -X POST http://127.0.0.1:8545 \
  -H "Content-Type: application/json" \
  --data '{"jsonrpc":"2.0","method":"eth_blockNumber","params":[],"id":1}')

echo "$GETH_RESPONSE" | grep -q '"result"' || {
  echo "ERROR: Geth RPC returned no result"
  exit 1
}

echo "Geth RPC OK"

echo "Checking Prysm beacon health..."
PRYSM_CODE=$(curl -s -o /dev/null -w '%{http_code}' \
  http://127.0.0.1:3500/eth/v1/node/health)

if [ "$PRYSM_CODE" != "200" ]; then
  echo "ERROR: Prysm health returned HTTP $PRYSM_CODE"
  exit 1
fi

echo "Prysm health OK"
echo "Node healthcheck passed"
