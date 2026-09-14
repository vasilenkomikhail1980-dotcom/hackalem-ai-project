# Noda

Noda is a reproducible Ethereum Sepolia node stack built with Docker Compose.

It runs both layers required by post-Merge Ethereum:

- **Geth** — execution client
- **Prysm** — consensus client

The clients communicate through the authenticated Engine API using a locally generated JWT secret.

## Why this project exists

Running an Ethereum node is often harder than it looks:

- two different clients must work together;
- Engine API authentication must be configured correctly;
- RPC and health endpoints should not be exposed unnecessarily;
- blockchain data and secrets should stay outside the repository;
- the setup should be reproducible on another machine.

Noda packages these pieces into a small, transparent node stack that can be recreated from a clean repository.

## What was tested

The original prototype was built and tested locally on macOS with Docker, Geth and Prysm.

The prototype successfully exposed:

- Ethereum JSON-RPC through Geth;
- Prysm beacon-node health API;
- authenticated communication between execution and consensus layers through the Engine API.

This repository is a cleaned and reproducible reconstruction of that working prototype.

It intentionally does **not** contain blockchain databases, JWT secrets, private keys, logs, or local machine state.

## Architecture

Ethereum Sepolia  
├── Prysm — Consensus Layer  
├── Geth — Execution Layer  
└── Engine API — JWT / 8551

Prysm API: `127.0.0.1:3500`  
Geth RPC: `127.0.0.1:8545`

## Quick start

1. Generate JWT secret:

`./scripts/generate-jwt.sh`

2. Start the node:

`docker compose up -d`

3. Check health:

`./scripts/healthcheck.sh`

4. Stop the node:

`docker compose down`

## Security

RPC interfaces are bound to localhost by default.

Secrets, private keys, logs and blockchain databases are excluded from Git.

## Status

Reconstructed from the original working Noda prototype and prepared for HackAlem AI 2026.
