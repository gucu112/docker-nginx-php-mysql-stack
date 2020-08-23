#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# If purge flag specified
if [ "$1" = '--purge' ]; then
    # Then stop Docker images and remove all containers and volumes
    echo 'Stopping docker containers...'
    echo 'Purging all docker containers and volumes...'
    $(dockerCompose) down --rmi all --volumes --remove-orphans
    echo 'Done.'
else
    # Else only stop Docker images
    echo 'Stopping docker containers...'
    $(dockerCompose) down
    echo 'Done.'
fi
