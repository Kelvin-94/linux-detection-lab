# Screenshots & Sample Output

Everything in this folder is **synthetic sample data for documentation and
testing** — it is not captured from a live Splunk deployment or a live target.

| File | What it is |
|---|---|
| `sample_linux_secure.log` | Synthetic sshd auth log: 22 failed passwords from 203.0.113.7 (TEST-NET-3) + 1 accepted login |
| `sample_auditd.log` | Synthetic auditd records: `useradd` (UID 0), `usermod`, `crontab` writing a spool file |
| `expected_results.md` | The table output each detection should produce over these samples |

## Using the samples

Index the files with the matching sourcetypes to exercise the rules without a
lab host:

```
index=linux sourcetype=linux_secure  ← sample_linux_secure.log
index=linux sourcetype=auditd        ← sample_auditd.log
```

## Adding real screenshots

Captured output from your own lab is welcome:

1. Run the detection in your Splunk, export the results view as a PNG.
2. Name it after the rule, e.g. `ssh_bruteforce.png`.
3. Open a PR and note the Splunk version + sourcetypes used.

Note: real auditd `PROCTITLE` values are hex-encoded, so
`detections/backdoor_account.spl` matches the plaintext `comm`/`exe`/`cmd`
fields instead of `proctitle`.
