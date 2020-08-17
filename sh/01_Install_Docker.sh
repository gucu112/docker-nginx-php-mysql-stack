#!/bin/bash

# Update software repositories
sudo apt-get update
# Uninstall old versions of Docker
sudo apt-get --yes remove docker docker-engine docker.io
# Install Docker
sudo apt-get --yes install docker.io
# Start Docker service
sudo systemctl start docker
# Enable Docker service
sudo systemctl enable docker
# Check Docker version
docker --version
