#!/bin/bash

# Define variables
local userName=default-user
local groupName=default-group

# Create user and group
addgroup --gid 1000 --system $groupName
adduser --uid 1000 --ingroup $groupName --system $userName
