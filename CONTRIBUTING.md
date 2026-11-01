# Contributing

Thanks for helping grow this lab. Keep contributions focused, reproducible,
and safe-by-default.

## What to contribute

- **New simulations** (`simulations/`): one technique per script, mapped to a
  MITRE ATT&CK technique ID in the header comment.
- **New detections** (`detections/`): one `.spl` file per technique.
- **Sample data** (`screenshots/`): synthetic logs + expected output, clearly
  labeled. Real-environment PNGs from your own lab are welcome.
- **Docs**: ATT&CK mappings, tuning notes, deployment guidance.

## Rules for simulations

1. Header comment must state the ATT&CK technique ID and usage.
2. Use `set -eu` (or `set -u` where failures are expected, e.g. brute force).
3. Destructive or persistent changes must be revertable — every simulation
   needs a matching cleanup path in `simulations/cleanup.sh` or its own docs.
4. Authorized test environments only. PRs that lower the safety bar will be
   rejected.

## Rules for detections

1. One technique per file, named after the simulation it detects.
2. Document the assumed sourcetype(s) and any required auditd/TA setup in a
   comment or in `docs/`.
3. Files must pass `./scripts/lint_spl.sh` (CI enforces this).
4. Prefer CIM-friendly field names where practical; note deviations.

## Style

- Bash: shellcheck-clean, quoted variables, no unconditional root actions.
- SPL: lowercase keywords, one line per pipe stage where readable.
- Commits: short imperative subject lines.

## CI

Every push and PR runs:

- `shellcheck` over all shell scripts.
- `scripts/lint_spl.sh` sanity checks over all `.spl` files (non-empty,
  starts a search, balanced quotes/parentheses). It is a sanity checker, not
  a full SPL parser — semantic validation still happens in your Splunk.

## Submitting

Open a PR against `main` with a clear description: what technique it covers,
how you tested it, and any cleanup steps. Link the simulation to its
detection so the mapping table stays in sync.
