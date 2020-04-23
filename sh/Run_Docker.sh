#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Load Stop_Docker.sh script
loadScript Stop_Docker.sh

# If build flag specified
if [ "$1" = '--build' ]; then
    # Then build and start Docker images in background
    echo 'Building docker containers...'
    echo 'Starting docker containers...'
    sudo -E $(dockerCompose) up --build --detach
    echo 'Done.'
else
    # Else only start Docker images in background
    echo 'Starting docker containers...'
    sudo -E $(dockerCompose) up --detach
    echo 'Done.'
fi

# Load Setup_Environment.sh script
loadScript Setup_Environment.sh
