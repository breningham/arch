#!/bin/sh

# Symlink distrobox shims
./distrobox-shims.sh

# Update the container and install packages
grep -h -v '^#' ./*.packages | xargs pacman -Syu --noconfirm
