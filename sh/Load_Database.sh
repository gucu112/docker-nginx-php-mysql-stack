#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Call mysql from inside container as root user and execute initial script
echo 'Loading initial database script...'
# TODO: Get rid of user and password in command
sudo -E $(docker) exec -i $MYSQL_DATABASE_CONTAINER_NAME mysql -u root -pdefault <$PWD/$MYSQL_DATABASE_INITIAL_SCRIPT
