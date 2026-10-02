## 2024-10-02 - Optimize validate-skills.sh subprocess creation
**Learning:** In bash scripts, spawning multiple subprocesses (like `basename`, `head`, `awk`, `tr`, `wc`) inside loops can significantly degrade performance due to process creation overhead.
**Action:** Consolidate text processing and metric gathering into a single `awk` pass per file (using process substitution and `read`) to dramatically reduce subprocess execution and improve overall script speed.
