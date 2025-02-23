#!/bin/bash
# deploy.sh

# Build and start production container
docker compose -f compose.prod.yaml build
docker compose -f compose.prod.yaml up -d
