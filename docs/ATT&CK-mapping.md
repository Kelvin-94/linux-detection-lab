# MITRE ATT&CK Mapping

| Simulation | Technique ID | Name | Detection trigger |
|---|---|---|---|
| SSH brute force | T1110.001 | Brute Force: Password Guessing | >=20 failures / 10 min / src_ip |
| UID-0 account | T1136.001 | Create Account: Local Account | auditd watch on /etc/passwd |
| Cron persistence | T1053.003 | Scheduled Task/Job: Cron | auditd watch on cron paths |

## Splunk ES Risk-Based Alerting scores

| Detection | Risk score |
|---|---|
| Brute force | 30 |
| Backdoor account | 80 |
| Reverse-shell cron | 90 |

Combine the three rules into a single risk object per host to drive incident
prioritization in Splunk ES.
