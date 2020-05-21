#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Reload nginx inside container
echo 'Reloading nginx server...'
sudo -E $(docker) exec -it $NGINX_SERVER_CONTAINER_NAME nginx -s reload
echo 'Done.'
