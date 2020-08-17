#!/bin/bash

# Mount shared folder and set chown and chmod to all files and directories
mount -t vboxsf -o uid=$(id -u),gid=$(id -g),dmask=002,fmask=003 shared /mnt/shared
