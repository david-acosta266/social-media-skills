## 2026-11-01 - Fast Bash Text Processing
**Learning:** Spawning multiple subprocesses (`head`, `awk`, `tr`, `wc`) inside a bash loop has significant overhead.
**Action:** Use a single `awk` script per file to extract all required information in one pass. Use `read -r` with `IFS` to parse multiple values safely.
