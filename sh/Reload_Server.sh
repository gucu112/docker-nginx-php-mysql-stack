#!/bin/bash
# Reload nginx inside nginx-server container
sudo -E docker exec -it nginx-server nginx -s reload
