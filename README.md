# Noda

Noda is a reproducible Ethereum Sepolia node stack built with Docker Compose.

It runs both layers required by Ethereum:

- **Geth** — execution client
- **Prysm** — consensus client

The clients communicate through the authenticated Engine API using a locally generated JWT secret.

## Background

Noda started as a hands-on Ethereum node experiment.

The original prototype was built and tested on macOS with Docker, Geth and Prysm. It exposed the Ethereum JSON-RPC interface and the Prysm beacon-node health API.

This repository reconstructs that working prototype as a clean public project without blockchain data or private secrets.

## Architecture

```text
              Ethereum Sepolia
                     |
        +------------+------------+
        |                         |
     Prysm                     Geth
 Consensus Layer          Execution Layer
        |                         |
        +------ Engine API -------+
                 JWT / 8551

Prysm API: 127.0.0.1:3500
Geth RPC:  127.0.0.1:8545
```

## Quick start

Generate JWT:

    ./scripts/generate-jwt.sh

Start the node:

    docker compose up -d

Check health:

    ./scripts/healthcheck.sh

Stop the node:

    docker compose down

## Security

JWT secrets, private keys, logs and blockchain databases are excluded from Git.

RPC interfaces are bound to localhost by default.

## Status

Reconstructed from the original working Noda prototype and prepared for HackAlem AI 2026.
