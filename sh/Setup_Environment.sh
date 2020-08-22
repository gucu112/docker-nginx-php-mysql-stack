#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

echo "Setting up structure for '$NGINX_SERVER_CONTAINER_NAME' container..."

# Create directories for nginx-server container
sudo -E mkdir -p \
    $PWD/var/log/nginx
sudo -E chown -R $(id -u):$(id -g) \
    $PWD/var/log/nginx

# Set public files and directories chmods and ownership
sudo -E find $PWD/$NGINX_SERVER_PUBLIC_DIRECTORY -type f -exec chmod 644 {} \;
sudo -E find $PWD/$NGINX_SERVER_PUBLIC_DIRECTORY -type d -exec chmod 755 {} \;
sudo -E chown -R $(id -u):$(id -g) $PWD/$NGINX_SERVER_PUBLIC_DIRECTORY

echo "Setting up structure for '$PHP_FPM_CONTAINER_NAME' container..."

# Create directories for php-fpm container
sudo -E mkdir -p \
    $PWD/var/run/php \
    $PWD/var/log/php
sudo -E chown -R $(id -u):$(id -g) \
    $PWD/var/run/php \
    $PWD/var/log/php

# Create socket file and set ownership
sudo -E touch $PWD/var/run/php/default.sock
sudo -E chown $(id -u):$(id -g) $PWD/var/run/php/default.sock

echo "Setting up structure for '$MYSQL_DATABASE_CONTAINER_NAME' container..."

# Create directories for mysql-database container
sudo -E mkdir -p \
    $PWD/var/data/mysql \
    $PWD/var/log/mysql
sudo -E chown -R 27:27 \
    $PWD/var/data/mysql \
    $PWD/var/log/mysql

echo 'Done.'
