#!/usr/bin/env bash
# T1110.001 - 20 failed SSH logins from a single source.
# Usage: ./ssh_bruteforce.sh <target_ip> [user]
set -u

TARGET="${1:?Usage: $0 <target_ip> [user]}"
USER="${2:-fakeuser}"

for i in $(seq 1 20); do
  sshpass -p "badpass$i" ssh -o StrictHostKeyChecking=no \
    -o PreferredAuthentications=password "$USER@$TARGET" true 2>/dev/null
done

echo "[*] Sent 20 failed SSH logins to $TARGET as $USER"
echo "[*] Verify: grep 'Failed password' /var/log/auth.log"
