#!/usr/bin/env bash
# Revert the lab simulations. Run after testing.
set -eu

read -rp "Backdoor username to remove [sysbackup]: " USER
USER="${USER:-sysbackup}"

sudo userdel -r "$USER" 2>/dev/null || echo "[!] $USER not found"
crontab -l 2>/dev/null | grep -v "/dev/tcp" | crontab - || true

echo "[*] Cleanup complete"
