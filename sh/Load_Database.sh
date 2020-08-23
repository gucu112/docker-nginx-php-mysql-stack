#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Call mysql from inside container as root user and execute initial script
echo 'Loading initial database script...'
$(docker) exec -i $MYSQL_DATABASE_CONTAINER_NAME mysql <$PWD/$MYSQL_DATABASE_INITIAL_SCRIPT
