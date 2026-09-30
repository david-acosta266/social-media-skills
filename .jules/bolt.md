## 2026-09-30 - [Optimize validate-skills parsing]
**Learning:** Multiple subprocesses (`head`, `awk`, `tr`, `wc`) inside a loop in a bash script severely degrade performance.
**Action:** Consolidate text processing and file metric collection into a single `awk` command pass per file, and securely read the combined result into bash variables using `IFS=$'\034' read -r -d ''`.
