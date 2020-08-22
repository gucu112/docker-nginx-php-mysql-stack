#!/bin/bash

############
# Functions
############

function getEnvironmentVariables() {
    # Define local variables
    local dotEnvPath="$PWD/.env"

    # Check whether .env file is readable
    if [ ! -r "$dotEnvPath" ]; then
        echo 'Error! Either there is no .env file or no read permission.'
        exit 10
    fi

    # Show environment variables
    echo "USER_ID=$(id -u) GROUP_ID=$(id -g)" \
        $(grep -v '^#' "$dotEnvPath")
}

function loadScript() {
    # Check whether script name provided
    if [ -z "$1" ]; then
        echo 'Error! No arguments supplied. Please specify script name.'
        exit 1
    fi

    # Define local variables
    local shDirectory="$(dirname "$0")"
    local scriptPath="$shDirectory/$1"

    # Check whether particular script is executable
    if [ ! -x "$scriptPath" ]; then
        echo 'Error! Either there is no file or no executable permission.'
        exit 10
    fi

    # Load particular script with rest of the arguments
    echo "Loading '$scriptPath' script..."
    . "$scriptPath" "$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9"
}

function createFileFromTemplate() {
    # Check whether template path provided
    if [ -z "$1" ]; then
        echo 'Error! No arguments supplied. Please specify template path.'
        exit 1
    fi

    # Check whether destination path provided
    if [ -z "$2" ]; then
        echo 'Error! No arguments supplied. Please specify destination path.'
        exit 1
    fi

    # Define local variables
    local destinationPath="$2"
    local templatePath="$1"
    local sedScriptsList=()

    # Generate sed scripts (extensions) based on environment variables
    for envKeyValuePair in $(getEnvironmentVariables); do
        sedScriptsList+=($(echo $envKeyValuePair | awk -F'=' '{printf "%se \"s#\\$%s#%s#\"","\x2D",$1,$2}'))
    done

    # Remove destination file if exists
    sudo -E rm -f "$destinationFile"

    # Evaluate sed for given template and generate desination file
    eval "sed ${sedScriptsList[@]} $templatePath >> $destinationPath"
}

function generateDockerfiles() {
    # Create Dockerfile using template (and replace environment variables) for each build context directory
    for templateFile in $(sudo find "$PWD/docker" -maxdepth 2 -type f -name 'Dockerfile.template'); do
        local buildContextDirectory=$(dirname "$templateFile")
        local destinationFile="$buildContextDirectory/Dockerfile"
        echo "Generating Dockerfile for '${buildContextDirectory/$PWD/.}' build context directory..."
        createFileFromTemplate "$templateFile" "$destinationFile"
    done
}

function generateContainersConfiguration() {
    # Define local variables
    local configurationFiles=(nginx/config/nginx.conf mysql/config/mysql.cnf)

    # Create configuration file using template for each file specified above
    for configurationFile in ${configurationFiles[@]}; do
        local destinationFile="$PWD/docker/$configurationFile"
        local templateFile="$destinationFile.template"
        local buildContextDirectory=$(dirname "$templateFile")
        echo "Generating '${destinationFile/$PWD/.}' configuration file..."
        createFileFromTemplate "$templateFile" "$destinationFile"
    done
}

############
# Wrappers
############

function docker() { echo "$DOCKER_COMMAND"; }

function dockerCompose() { echo "$DOCKER_COMPOSE_COMMAND"; }

############
# Hooks
############

if [ ! -e "$PWD/.env" ]; then
    echo 'Copying dotenv file...'
    cp "$PWD/.env.example" "$PWD/.env"
    echo 'Granting read permission...'
    sudo chmod +r "$PWD/.env"
    echo 'Done.'
fi

if [ "$(find ./sh -maxdepth 1 -type f -executable | wc -l)" -lt "$(ls ./sh | wc -l)" ]; then
    echo 'Making scripts executable...'
    sudo find "$PWD/sh" -maxdepth 1 -type f -name '*.sh' -exec chmod +x {} \;
    echo 'Done.'
fi

if [ -z "$DOCKER_COMMAND" ] && [ -z "$DOCKER_COMPOSE_COMMAND" ]; then
    echo 'Loading environment variables...'
    export $(getEnvironmentVariables)
    echo 'Done.'
fi
