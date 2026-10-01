## 2026-10-01 - Bash Subprocess Optimization
**Learning:** Spawning multiple subprocesses (like head, awk, tr, wc) inside a loop is a significant performance bottleneck in bash scripts.
**Action:** Consolidate text processing into a single awk pass per file and use process substitution to parse results directly into bash variables.
