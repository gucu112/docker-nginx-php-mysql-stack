#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Restart MySQL container
echo 'Reloading MySQL database...'
$(docker) restart $MYSQL_DATABASE_CONTAINER_NAME &>/dev/null
echo 'Done.'
