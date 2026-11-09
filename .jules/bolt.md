## 2026-11-09 - Bash Loop Optimization
**Learning:** Spawning multiple subprocesses (like `head`, `awk`, `tr`, `wc`) inside a bash loop over many files creates significant overhead. In the skills validator, this caused the script to be much slower than necessary.
**Action:** Consolidate text processing and metric extraction into a single `awk` pass per file to avoid spawning unnecessary subprocesses in loops. Use POSIX-compliant safe delimiters (like `\034`) to safely return multiple values from `awk` to bash.
