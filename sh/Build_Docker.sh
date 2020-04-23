#!/bin/bash

# Import shared code
. "$(dirname "$0")/Common_Code.sh"

# Load Run_Docker.sh script with build param
loadScript Run_Docker.sh --build
