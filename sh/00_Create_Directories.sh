# nginx
sudo -E mkdir -p \
    $PWD/var/log/nginx
sudo -E chown -R 1000:1000 \
    $PWD/var/log/nginx

# php-fpm
sudo -E mkdir -p \
    $PWD/var/run/php/socket \
    $PWD/var/log/php
sudo -E chown -R 1000:1000 \
    $PWD/var/run/php \
    $PWD/var/log/php

# mysql-server
sudo -E mkdir -p \
    $PWD/var/data/mysql \
    $PWD/var/log/mysql
sudo -E chown -R 27:27 \
    $PWD/var/data/mysql \
    $PWD/var/log/mysql
