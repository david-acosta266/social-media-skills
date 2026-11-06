## 2026-11-06 - Optimize validate-skills.sh with single awk pass
**Learning:** Invoking multiple subshells and text processing utilities (`head`, `awk`, `tr`, `wc`) inside a loop over files is a common bash anti-pattern that slows down script execution.
**Action:** Consolidate into a single `awk` pass per file to reduce process spawning overhead.
