#!/bin/bash
# Mount shared folder and set chown and chmod to all files and directories
mount -t vboxsf -o uid=1000,gid=1000,dmask=002,fmask=003 shared /mnt/shared
