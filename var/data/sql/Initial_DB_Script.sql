CREATE USER 'dev'@'localhost' IDENTIFIED BY 'dev';

GRANT ALL PRIVILEGES ON * . * TO 'dev'@'localhost';

CREATE DATABASE default_db;

FLUSH PRIVILEGES;
