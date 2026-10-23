## 2024-10-23 - Bash Loop Subprocess Overhead
**Learning:** In `validate-skills.sh`, using multiple subprocesses (`head`, `awk` twice, `wc`) inside a loop over skills files causes significant overhead (0.5s execution time for 17 skills), making validation slower than necessary.
**Action:** Consolidate text processing and file parsing into a single `awk` pass per file. By doing this, we avoid spawning multiple processes inside loops, significantly reducing execution time (from ~0.45s to ~0.15s, a ~3x speedup).
