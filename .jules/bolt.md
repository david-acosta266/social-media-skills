## 2024-05-15 - Optimize validation script with single awk pass
**Learning:** Shell scripts validating many files using multiple subprocesses (`head`, `awk`, `tr`, `wc`) inside a loop can be a significant performance bottleneck.
**Action:** Consolidate text parsing into a single `awk` pass per file. Use process substitution with `read -r` and a safe delimiter (e.g., `IFS=$'\034'`) to extract multiple variables safely and efficiently.
