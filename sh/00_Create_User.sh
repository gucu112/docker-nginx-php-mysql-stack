#!/bin/bash

# Define variables
local userName=default-user
local groupName=default-group

# Create user and group
addgroup --gid $(id -g) --system $groupName
adduser --uid $(id -u) --ingroup $groupName --system $userName
