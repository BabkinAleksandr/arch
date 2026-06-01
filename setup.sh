#!/bin/bash
set -e

echo "=== Arch setup ==="

# Install packages
echo "packages: started"
mapfile -t packages < ./packages/packages.txt
sudo pacman -S --noconfirm "${packages[@]}"
echo "packages: finished"

# systemd config
echo "systemd: started"
sudo mkdir -p /etc/systemd/logind.conf.d
sudo cp ./systemd/ignore-power-key.conf /etc/systemd/logind.conf.d/ignore-power-key.conf
sudo systemctl restart systemd-logind
sudo mkdir -p /etc/systemd/network
sudo cp ./systemd/20-wireless.network /etc/systemd/network/20-wireless.network
echo "systemd: finished"

# iwd config
echo "iwd: started"
sudo cp ./iwd/main.conf /etc/iwd/main.conf
sudo systemctl enable --now iwd
echo "iwd: finished"

# Enable sddm
echo "sddm: started"
sudo systemctl enable sddm
echo "sddm: finished"

# Switch to iwd (replace NetworkManager)
echo "switch-to-iwd: started"
sudo systemctl stop NetworkManager wpa_supplicant 2>/dev/null || true
sudo systemctl disable NetworkManager wpa_supplicant 2>/dev/null || true
echo "switch-to-iwd: finished"

echo "=== Done - reboot now ==="
