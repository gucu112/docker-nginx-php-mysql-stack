#!/bin/bash
# Call mysql from inside mysql-server container as dev user
sudo -E docker exec -it mysql-server mysql -u dev -p
