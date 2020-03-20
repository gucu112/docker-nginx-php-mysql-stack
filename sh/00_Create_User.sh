#!/bin/bash
# Create user and group
addgroup --gid 1000 --system php-data
adduser --uid 1000 --ingroup php-data --system php-data
# Set files chmod to 644
find /var/www/html/default -type f -exec chmod 644 {} \;
# Set directories chmod to 755
find /var/www/html/default -type d -exec chmod 755 {} \;
# Set files ownership to 'php-data' user and group
chown -R php-data:php-data /var/www/html/default
