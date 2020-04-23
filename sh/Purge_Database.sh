#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Load Stop_Docker.sh script
loadScript Stop_Docker.sh

# Remove database files
echo 'Removing database files...'
sudo -E rm -rf $PWD/var/data/mysql/*
