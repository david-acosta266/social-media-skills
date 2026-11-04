## 2024-11-04 - Validate Skills Script Optimization
**Learning:** Shell loops spawning multiple subprocesses (`head`, `awk`, `tr`, `wc`) inside the loop are extremely slow. In `validate-skills.sh`, doing multiple text processing steps per file caused the script to take ~0.45s.
**Action:** Consolidate text processing into a single `awk` pass per file. Using `awk` to extract frontmatter data, description, and line counts at once reduced execution time from ~0.45s to ~0.14s (a 68% improvement).
