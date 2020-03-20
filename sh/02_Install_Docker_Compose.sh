#!/bin/bash
# Update software repositories
apt-get update
# Install curl
apt-get --yes install curl
# Download Docker Compose
curl --location "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" \
    --output /usr/local/bin/docker-compose
# Allow execution of Docker Compose
sudo chmod +x /usr/local/bin/docker-compose
# Check Docker Compose version
docker-compose --version
