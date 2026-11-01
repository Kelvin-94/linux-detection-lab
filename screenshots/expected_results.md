# Expected Results (synthetic samples)

Output each rule should produce when the `screenshots/sample_*.log` files are
indexed with the matching sourcetypes (`linux_secure`, `auditd`). Values below
were derived from the synthetic samples — they are illustrative expected
output, **not** screenshots from a live Splunk deployment.

## detections/ssh_bruteforce.spl (over sample_linux_secure.log)

| src_ip | failures | users_failed | first_seen | last_seen |
|---|---|---|---|---|
| 203.0.113.7 | 22 | 3 | 2026-09-24 14:30:01 | 2026-09-24 14:37:01 |

22 >= 20 → the rule fires. The single accepted login from 192.168.1.20 never
appears (no failed-password events for it).

## detections/backdoor_account.spl (over sample_auditd.log)

| _time | host | comm | exe | cmd |
|---|---|---|---|---|
| 2026-09-24 14:35:10 | labhost | useradd | /usr/sbin/useradd | |
| 2026-09-24 14:35:40 | labhost | usermod | /usr/sbin/usermod | |

`cmd` is empty here because raw SYSCALL records carry the command in
`comm`/`exe`; USER_CMD records (available when sudo audit plugins are
configured) also populate `cmd`.

## detections/cron_persistence.spl (over sample_auditd.log)

| _time | host | comm | exe | name |
|---|---|---|---|---|
| 2026-09-24 14:39:40 | labhost | crontab | /usr/bin/crontab | /var/spool/cron/kelvin |

## Windows equivalents

No synthetic Windows samples are included; the 4625/4720/4732 searches require
`wineventlog` data from a Windows forwarder.
