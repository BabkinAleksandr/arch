#!/bin/bash
echo "packages: started"
mapfile -t packages < ~/arch/packages/packages.txt
sudo pacman -S --noconfirm "${packages[@]}"
echo "packages: finished"