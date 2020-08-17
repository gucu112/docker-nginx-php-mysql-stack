#!/bin/bash

# Function gets environment variables and returns it
function getEnvironmentVariables() {
    # Define local variables
    local dotEnvPath="$PWD/.env"

    # Make .env file readable
    sudo chmod +r "$dotEnvPath"

    # Check whether .env file is readable
    if [ ! -r "$dotEnvPath" ]; then
        echo 'Error! Either there is no .env file or no read permission.'
        exit 10
    fi

    # Show environment variables
    echo "USER_ID=$(id -u) GROUP_ID=$(id -g)" \
        $(grep -v '^#' "$dotEnvPath")
}

# Function loads environment variables
function loadEnvironment() {
    # Export environment variables
    echo 'Loading environment variables...'
    export $(getEnvironmentVariables)
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

# Function generates Dockerfiles based on template provided in build context directory
function generateDockerfiles() {
    # Define local variables
    local sedScriptsList=()

    # Generate sed scripts (extensions) based on .env file
    for envKeyValuePair in $(getEnvironmentVariables); do
        sedScriptsList+=($(echo $envKeyValuePair | awk -F'=' '{printf "%se \"s#\\$%s#%s#\"","\x2D",$1,$2}'))
    done

    # Evaluate sed for each build context directory and recreate Dockerfiles
    for templateFile in $(sudo find "$PWD/docker" -maxdepth 2 -type f -name 'Dockerfile.template'); do
        local buildContextDirectory=$(dirname "$templateFile")
        local destinationFile="$buildContextDirectory/Dockerfile"
        echo "Removing '${destinationFile/$PWD/.}'..."
        sudo -E rm -f "$destinationFile"
        echo "Generating Dockerfile for '${buildContextDirectory/$PWD/.}' build context directory..."
        eval "sed ${sedScriptsList[@]} $templateFile >> $destinationFile"
    done
}

# Get Docker command
function docker() {
    echo "$DOCKER"
}

# Get Docker Compose command
function dockerCompose() {
    echo "$DOCKER_COMPOSE"
}
