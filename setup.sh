#!/bin/bash
set -e
echo "=== Arch setup ==="
bash ~/arch/packages/packages.sh
bash ~/arch/systemd/systemd.sh
bash ~/arch/iwd/iwd.sh
echo "=== Done ==="