## 2026-10-16 - Avoiding Subprocesses Inside Loops
**Learning:** In bash scripts, spawning multiple subprocesses (like `head`, `awk`, `tr`, `wc`) inside a loop over files significantly degrades performance.
**Action:** Consolidate text processing and data extraction into a single `awk` pass per file, and use `IFS=$'\034' read -r ... < <(awk ...)` to read the multiple outputs back into bash variables efficiently and safely.
