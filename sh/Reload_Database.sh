#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Restart MySQL container
echo 'Reloading MySQL database...'
sudo -E $(docker) restart $MYSQL_DATABASE_CONTAINER_NAME &>/dev/null
echo 'Done.'
