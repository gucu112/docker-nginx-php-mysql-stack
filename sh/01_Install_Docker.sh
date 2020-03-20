#!/bin/bash
# Update software repositories
apt-get update
# Uninstall old versions of Docker
apt-get --yes remove docker docker-engine docker.io
# Install Docker
apt-get --yes install docker.io
# Start Docker service
systemctl start docker
# Enable Docker service
systemctl enable docker
# Check Docker version
docker --version
