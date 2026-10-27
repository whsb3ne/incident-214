#!/usr/bin/env bash
# Checks that every challenge is still solvable as designed.
# Never prints a flag, so it is safe to run in public CI.
set -euo pipefail
cd "$(dirname "$0")/.."

fail() { echo "FAIL: $*" >&2; exit 1; }
pass() { echo "ok   $*"; }

flag_re='^MKU\{[a-z0-9_.]+\}$'

# Challenge 1: the string in the brief decodes to a well-formed flag
c1=$(grep -oE '^[A-Za-z0-9+/]{20,}={0,2}$' challenges/01-encoded-message/README.md | head -1)
[[ -n "$c1" ]] || fail "challenge 1: encoded string not found"
base64 -d <<<"$c1" | grep -qE "$flag_re" || fail "challenge 1: string does not decode to MKU{...}"
pass "challenge 1 decodes to a valid flag"

# Challenge 2: the flag lives only in a hidden file
tmp=$(mktemp -d); trap 'rm -rf "$tmp"' EXIT
tar -xzf challenges/02-missing-evidence/incident-evidence.tar.gz -C "$tmp"
ev="$tmp/incident-evidence"
[[ -d "$ev" ]] || fail "challenge 2: archive must contain incident-evidence/"
! ls "$ev" | grep -q '^\.' || fail "challenge 2: plain ls should not show hidden files"
! grep -qE 'MKU\{' "$ev"/* || fail "challenge 2: flag visible in a non-hidden file"
hidden=$(grep -lE 'MKU\{[a-z0-9_]+\}' "$ev"/.[!.]* || true)
[[ $(wc -l <<<"$hidden") -eq 1 && -n "$hidden" ]] || fail "challenge 2: expected exactly one hidden file with the flag"
pass "challenge 2 flag is hidden from plain ls and found by ls -la"

# Challenge 3: well-formed log, exactly one external IP, and two events at 02:14
log=challenges/03-who-logged-in/auth.log
line_re='^[0-2][0-9]:[0-5][0-9]:[0-5][0-9] user=[a-z]+ ip=[0-9.]+ event=[a-z_]+ result=(success|failure)$'
bad=$(grep -cvE "$line_re" "$log" || true)
[[ "$bad" -eq 0 ]] || fail "challenge 3: $bad malformed log line(s)"
external=$(grep -oE 'ip=[0-9.]+' "$log" | sort -u | grep -vc 'ip=192\.168\.' || true)
[[ "$external" -eq 1 ]] || fail "challenge 3: expected exactly one external IP, found $external"
[[ $(grep -c '^02:14:' "$log") -eq 2 ]] || fail "challenge 3: expected two events during 02:14"
grep -qE 'MKU\{' "$log" && fail "challenge 3: flag must not appear in the log"
pass "challenge 3 log is well-formed with one anomalous IP"

# Nothing outside challenge 2's archive may contain a flag
leaks=$(git ls-files | grep -v '\.tar\.gz$' | grep -v '^scripts/' | grep -v '^writeups/' | xargs grep -lE 'MKU\{[a-z0-9_.]*[a-z0-9][a-z0-9_.]*\}' 2>/dev/null \
  | grep -v '^challenges/03-who-logged-in/README.md$' || true)
[[ -z "$leaks" ]] || fail "flag-shaped text found in: $leaks"
pass "no flags leaked in tracked files"

echo "All challenges valid."
