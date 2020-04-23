# Set base docker image version
# Updated: 2020-03-03
FROM php:7.4.3-fpm

# Create user and group
RUN addgroup --gid 1000 \
    --system php-data
RUN adduser --uid 1000 \
    --ingroup php-data \
    --system php-data

# Setup run directories
RUN mkdir -p /run
RUN chown -R php-data:php-data /run
RUN ln -s /run /var/run

# Create PID file and socket directory
RUN touch /var/run/php.pid
RUN mkdir /var/run/php

# Install packages and modules
RUN apt-get update && apt-get install -y \
    libmcrypt-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev && \
    docker-php-ext-install intl && \
    docker-php-ext-install sockets && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install opcache && \
    docker-php-ext-install zip && \
    docker-php-source delete

# Remove default configuration
RUN rm /usr/local/etc/php-fpm.d/www.conf
RUN rm /usr/local/etc/php-fpm.d/docker.conf
RUN rm /usr/local/etc/php-fpm.d/zz-docker.conf

# Copy over configuration files
COPY ./php.ini /usr/local/etc/php/php.ini
COPY ./php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./www.conf /usr/local/etc/php-fpm.d/www.conf

# Create logging directory and files
RUN mkdir -p /var/log/php
RUN touch /var/log/php/error.log
RUN touch /var/log/php/fpm.debug.log
RUN touch /var/log/php/fpm.slow.log
RUN touch /var/log/php/fpm.access.log

# Set permissions and ownerships
RUN chmod 755 /var/run/php
RUN chown -R php-data:php-data \
    /var/log/php \
    /var/run/php \
    /var/run/php.pid

# Specify entrypoint, user, working directory and default command
ENTRYPOINT [ "docker-php-entrypoint" ]
USER php-data
WORKDIR /var/www/html/default
CMD [ "php-fpm", "--nodaemonize" ]
