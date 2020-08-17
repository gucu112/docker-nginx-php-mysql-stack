#!/bin/bash

# Install required PHP packages
sudo apt --yes install \
    php-cli \
    php-bcmath \
    php-json \
    php-mbstring \
    php-mysql \
    php-tokenizer \
    php-xdebug \
    php-xml \
    php-zip

# Install Composer globally
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'e0012edf3e80b6978849f5eff0d4b4e4c79ff1609dd1e613307e16318854d24ae64f26d17af3ef0bf7cfb710ca74755a') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
php -r "unlink('composer-setup.php');"

# Install additional packages
sudo apt-get install
