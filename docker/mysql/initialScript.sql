-- Drop dev user if exists
DROP USER IF EXISTS 'dev'@'%';

-- Create dev user and grant all privileges
CREATE USER 'dev'@'%' IDENTIFIED BY 'dev';
GRANT ALL PRIVILEGES ON * . * TO 'dev'@'%';
FLUSH PRIVILEGES;

-- Create default_db if not exists
CREATE DATABASE IF NOT EXISTS default_db;

-- Output success status
\! echo 'Done.';
