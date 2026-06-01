#!/bin/bash
echo "systemd: started"
sudo mkdir -p /etc/systemd/logind.conf.d
sudo cp "$HOME/arch/systemd/ignore-power-key.conf" \
     /etc/systemd/logind.conf.d/ignore-power-key.conf
sudo systemctl restart systemd-logind

sudo mkdir -p /etc/systemd/network
sudo cp "$HOME/arch/systemd/20-wireless.network" \
     /etc/systemd/network/20-wireless.network
echo "systemd: finished"