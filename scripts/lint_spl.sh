#!/usr/bin/env bash
# Basic sanity checks for .spl detection files. Not a full SPL parser.
# Checks: file is non-empty, first non-comment line starts a search,
# double quotes and parentheses are balanced.
# Usage: ./lint_spl.sh detections/*.spl
set -u

if [ "$#" -eq 0 ]; then
  echo "Usage: $0 <file.spl> [...]" >&2
  exit 2
fi

fail=0

for f in "$@"; do
  ok=1

  if [ ! -s "$f" ]; then
    echo "FAIL $f: file is empty"
    fail=1
    continue
  fi

  # Strip // comments and blank lines before checking.
  code="$(sed -e 's#^[[:space:]]*//.*$##' "$f" | sed -e '/^[[:space:]]*$/d')"

  if [ -z "$code" ]; then
    echo "FAIL $f: no non-comment content"
    fail=1
    continue
  fi

  first="$(printf '%s\n' "$code" | head -n 1)"
  case "$first" in
    index=*|sourcetype=*|\|*|search\ *) : ;;
    *)
      echo "FAIL $f: first line does not start a search (got: $first)"
      fail=1
      ok=0
      ;;
  esac

  dq="$(printf '%s' "$code" | tr -cd '"' | wc -c | tr -d ' ')"
  if [ $((dq % 2)) -ne 0 ]; then
    echo "FAIL $f: unbalanced double quotes"
    fail=1
    ok=0
  fi

  opens="$(printf '%s' "$code" | tr -cd '(' | wc -c | tr -d ' ')"
  closes="$(printf '%s' "$code" | tr -cd ')' | wc -c | tr -d ' ')"
  if [ "$opens" != "$closes" ]; then
    echo "FAIL $f: unbalanced parentheses ($opens open vs $closes close)"
    fail=1
    ok=0
  fi

  if [ "$ok" -eq 1 ]; then
    echo "OK   $f"
  fi
done

if [ "$fail" -ne 0 ]; then
  echo "SPL lint: FAILURES FOUND"
fi
exit "$fail"
