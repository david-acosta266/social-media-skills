## 2026-10-20 - [Optimize validate-skills.sh by reducing subprocesses]
**Learning:** Parsing text in bash loops by spawning multiple subprocesses (e.g., `head`, `awk`, `tr`, `wc` per file) causes significant overhead due to constant process creation.
**Action:** Consolidate text processing into a single `awk` pass combined with `read -r` to significantly reduce execution time.
