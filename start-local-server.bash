#!//usr/bin/env bash

NETWORK_NAME="local-debug"

if ! docker network inspect "$NETWORK_NAME" >/dev/null 2>&1; then
    echo "Creating docker network: $NETWORK_NAME"
    docker network create --driver bridge "$NETWORK_NAME"
else
    echo "Docker network already exists: $NETWORK_NAME"
fi

docker compose -f compose.local.yml --env-file .env.local up -d