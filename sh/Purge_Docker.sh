#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Load Stop_Docker.sh script with purge param
loadScript Stop_Docker.sh --purge
