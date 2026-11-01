# Launch Post (LinkedIn)

Ready-to-post copy for announcing this repository, plus the accompanying
overview image: [`assets/lab-overview.png`](assets/lab-overview.png)
(1200×627, rendered at 2× for retina).

## Post (main)

> Most detection rules fail in the same place: they were never attacked.
>
> I built a small purple-team lab that fixes that for three techniques I kept
> seeing in incident reports — and open-sourced the whole thing.
>
> **Linux Detection Lab** simulates the attack, ships the detection, and maps
> both to MITRE ATT&CK:
>
> 🔹 **Password guessing** — 20+ failed SSH logins from a single source (T1110.001)
> 🔹 **Hidden local admin** — a UID-0 account that blends into `root` (T1136.001)
> 🔹 **Scheduled-task persistence** — a cron job with a reverse-shell payload (T1053.003)
>
> For each one you get:
>
> • A bash simulation script you can run against a test host
> • A ready-to-import Splunk search (`.spl`) with a real threshold and tuning notes
> • auditd watch rules that generate the telemetry the detection needs
> • Synthetic sample logs + expected output, so you can exercise the rules
>   before you even have a lab host
>
> Two things I care about more than the rules themselves:
>
> **1. Detections are only as good as their telemetry.** The UID-0 rule is
> useless without an auditd watch on `/etc/passwd`. Every detection here names
> its dependency instead of assuming one.
>
> **2. Day-one honesty.** These rules are v1.0.0 and linted in CI, but they have
> not been tuned against production noise. Internet-facing SSH hosts will need a
> higher threshold or a scanner allowlist. That's documented, not hidden.
>
> CI runs shellcheck and an SPL sanity check on every push. Contributions
> welcome — especially real-environment screenshots and new ATT&CK techniques.
>
> Repo: https://github.com/Kelvin-94/linux-detection-lab
>
> #DetectionEngineering #BlueTeam #PurpleTeam #Splunk #MITREATTACK #ThreatDetection #LinuxSecurity #SIEM

## Post (short variant)

> Shipped a purple-team lab: three Linux attack simulations — SSH brute force,
> a UID-0 backdoor account, and reverse-shell cron persistence — each paired
> with a Splunk detection, auditd rules, and ATT&CK mapping.
>
> Telemetry first, rules second, and tuning limits documented honestly.
>
> https://github.com/Kelvin-94/linux-detection-lab
>
> #DetectionEngineering #BlueTeam #Splunk #MITREATTACK

## First comment (optional, keeps the main post tight)

> Repo layout: `simulations/` (bash), `detections/` (Splunk SPL),
> `auditd/` (watch rules), `screenshots/` (synthetic sample logs + expected
> output), `docs/ATT&CK-mapping.md`. Everything runs in an isolated test VM —
> never against hosts you don't own.

## Pinned-profile blurb (Featured section)

> Purple-team lab for Linux detection engineering. Attack simulations for
> T1110.001, T1136.001 and T1053.003, each paired with a Splunk detection,
> auditd telemetry rules, and an ATT&CK mapping — with CI linting.

## Repo description (GitHub "About" field)

Purple-team Linux detection lab: SSH brute-force, UID-0 backdoor account, and
cron persistence simulations mapped to MITRE ATT&CK, with ready-to-import
Splunk detections and CI linting.

## Suggested topics

`blue-team` `purple-team` `detection-engineering` `splunk` `mitre-attack`
`auditd` `threat-detection` `security-lab`
