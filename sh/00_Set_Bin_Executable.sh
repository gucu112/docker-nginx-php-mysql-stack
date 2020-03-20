#!/bin/bash
# Set executable permission for bash scripts
find ./sh -maxdepth 1 -type f -name '*.sh' -exec chmod +x {} \;
