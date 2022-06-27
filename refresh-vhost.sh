#!/bin/bash
set -o allexport
source .env
set +o allexport

docker compose up -d

NGINX_IP=$(docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' deloitte1-nginx)

echo "Updating /etc/hosts to add #NGINX_ALIAS"

if grep -Fxq "$NGINX_ALIAS" /etc/hosts; then
    echo "$NGINX_ALIAS already exists in /etc/hosts! Delete it first before running this"
else
    echo "$NGINX_IP      $NGINX_ALIAS" >> /etc/hosts  
    echo "/etc/hosts updated"
fi