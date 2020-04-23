#!/bin/bash

# Function loads environment variables from './docker/.env' file
function loadEnvironment() {
    # Define local variables
    local dotEnvPath="$PWD/docker/.env"

    # Make .env file readable
    sudo chmod +r "$dotEnvPath"

    # Check whether .env file is readable
    if [ ! -r "$dotEnvPath" ]; then
        echo 'Error! Either there is no .env file or no read permission.'
        exit 10
    fi

    # Export environment variables
    echo 'Loading environment variables...'
    export $(grep -v '^#' "$dotEnvPath")
    echo 'Done.'
}

# Load environment variables if no docker nor docker-compose commands specified
if [ -z "$DOCKER" ] && [ -z "$DOCKER_COMPOSE" ]; then
    loadEnvironment
fi

# Function loads single script from './sh' directory
function loadScript() {
    # Check whether script name provided
    if [ -z "$1" ]; then
        echo 'Error! No arguments supplied. Please specify script name.'
        exit 1
    fi

    # Define local variables
    local shDirectory="$(dirname "$0")"
    local scriptPath="$shDirectory/$1"

    # Make scripts executable
    sudo find $shDirectory -maxdepth 1 -type f -name '*.sh' -exec chmod +x {} \;

    # Check whether particular script is executable
    if [ ! -x "$scriptPath" ]; then
        echo 'Error! Either there is no file or no executable permission.'
        exit 10
    fi

    # Load particular script with rest of the arguments
    echo "Loading '$scriptPath' script..."
    . "$scriptPath" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
}

# Get Docker command
function docker() {
    echo "$DOCKER"
}

# Get Docker Compose command
function dockerCompose() {
    echo "$DOCKER_COMPOSE"
}
