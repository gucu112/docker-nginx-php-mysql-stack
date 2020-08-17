#!/bin/bash

# Download MySQL repostiory package
wget -c https://repo.mysql.com//mysql-apt-config_0.8.15-1_all.deb -P /tmp/
# Install MySQL repostiory package
sudo dpkg -i /tmp/mysql-apt-config_0.8.15-1_all.deb
# Update software repositories
sudo apt-get update
# Install MySQL
sudo apt-get --yes install mysql-server
# Configure MySQL
sudo mysql_secure_installation
# Start Docker service
sudo systemctl start mysql
# Enable Docker service
sudo systemctl enable mysql
# Check MySQL version
mysql --version
