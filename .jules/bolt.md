
## 2026-10-30 - Consolidate subprocesses in bash scripts
**Learning:** Shell scripts spawning multiple subprocesses (`head`, `awk`, `tr`, `wc`) inside a loop for each file cause significant I/O and process overhead, especially as the number of files scales up.
**Action:** Consolidate text processing and metric gathering into a single pass per file using `awk` and read the results securely into variables via process substitution with a non-printable delimiter (e.g., `IFS=$'\034'`).
