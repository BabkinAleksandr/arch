#!/bin/bash

sudo cp "$HOME/arch/iwd/main.conf" /etc/iwd/main.conf

echo "[1/2] Stopping and disabling NetworkManager and wpa_supplicant..."
sudo systemctl stop NetworkManager wpa_supplicant 2>/dev/null || true
sudo systemctl disable NetworkManager wpa_supplicant 2>/dev/null || true

echo "[2/2] Enabling and starting iwd..."
sudo systemctl enable --now iwd

echo ""
echo "Done! Use 'impala' to connect to wifi."
echo "Reload sway: swaymsg reload"
