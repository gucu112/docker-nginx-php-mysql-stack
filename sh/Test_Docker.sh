#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Test docker configuration through docker-compose config
echo 'Testing docker containers...'
sudo -E $(dockerCompose) config --quiet && echo -e "\e[32mTest passed successfully.\e[0m"
echo 'Done.'
