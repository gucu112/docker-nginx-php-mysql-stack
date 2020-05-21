#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Call mysql from inside container as dev user
echo 'Opening mysql inside container...'
sudo -E $(docker) exec -it $MYSQL_DATABASE_CONTAINER_NAME mysql --login-path=dev
