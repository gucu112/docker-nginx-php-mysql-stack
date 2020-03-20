#!/bin/bash
# Call mysql from inside mysql-server container as root user and execute script
sudo -E docker exec -i mysql-server mysql -u root -pdefault < ./var/data/sql/Initial_DB_Script.sql
