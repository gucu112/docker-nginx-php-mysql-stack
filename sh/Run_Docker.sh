#!/bin/bash
# Stop Docker images and remove not defined containers
sudo -E docker-compose down --remove-orphans

# Start Docker images in background
sudo -E docker-compose up --detach
