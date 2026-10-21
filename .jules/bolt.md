## 2026-10-21 - Bash Subprocess Optimization
**Learning:** In bash scripts, spawning multiple subprocesses (like `head`, `awk`, `tr`, `wc`) inside a loop over many files creates significant overhead.
**Action:** Consolidate multiple text processing steps into a single `awk` pass per file. Use `IFS=$'\034' read -r var1 var2 < <(awk '...' file)` to cleanly parse multiple outputs back into bash variables without spawning subshells.
