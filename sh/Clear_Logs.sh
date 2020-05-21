#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Load Stop_Docker.sh script
loadScript Stop_Docker.sh

echo "Clearing logs for '$NGINX_SERVER_CONTAINER_NAME' container..."

# Clear logs for nginx-server container
sudo -E rm -rf $PWD/var/log/nginx/*

echo "Clearing logs for '$PHP_FPM_CONTAINER_NAME' container..."

# Clear logs for php-fpm container
sudo -E rm -rf $PWD/var/log/php/*

echo "Clearing logs for '$MYSQL_DATABASE_CONTAINER_NAME' container..."

# Clear logs for mysql-database container
sudo -E rm -rf $PWD/var/log/mysql/*

echo 'Done.'
