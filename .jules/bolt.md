## 2024-05-14 - Bash Subprocess Optimization
**Learning:** In bash scripts that loop over directories, spawning multiple subshells and binary processes (like `awk`, `tr`, `printf`) per iteration can cause significant performance overhead.
**Action:** Consolidate data extraction and parsing logic into a single background process (e.g., a single `awk` pass) per iteration. Use process substitution with `read` and a safe delimiter (like `\x1c`) to load multiple variables efficiently without spawning extra subshells.
