## 2024-10-28 - Optimize Bash Script with Single AWK Pass
**Learning:** In bash scripts processing many files, spawning multiple subprocesses (like `head`, `awk`, `tr`, `wc`) inside loops is a huge performance bottleneck.
**Action:** Consolidate text processing and metadata gathering into a single `awk` pass per file. Use POSIX-compliant octal escapes (`IFS=$'\034' read -r ...`) to safely map the single stdout block back to bash variables, skipping slow fork/exec overhead.
