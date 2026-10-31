## 2026-10-31 - Optimize bash scripts by consolidating text processing
**Learning:** Spawning multiple subprocesses (like `head`, `awk`, `tr`, `wc`) inside a loop for file parsing significantly slows down execution in bash scripts due to high overhead.
**Action:** Consolidate text processing and metric extraction into a single `awk` pass per file to dramatically improve performance without sacrificing readability.
