
## 2026-11-05 - Bash Subprocess Overhead in Loops
**Learning:** In bash scripts, spawning multiple subprocesses (like `head`, `awk`, `tr`, `wc`) inside a loop over many files creates significant overhead. Consolidating these into a single `awk` pass per file dramatically improves execution time (e.g., ~0.47s to ~0.16s for 17 files).
**Action:** When parsing files in bash loops, replace multiple standard unix utility calls with a single `awk` script that extracts all necessary data at once and returns it via `IFS` and `read -r`.
