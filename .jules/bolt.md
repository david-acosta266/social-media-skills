## 2026-10-18 - Bash Subprocess Optimization
**Learning:** Shell scripts processing multiple files in a loop are severely bottlenecked by creating numerous subprocesses (e.g., `head`, `awk`, `tr`, `wc`) for each file.
**Action:** Consolidate multiple string parsing and formatting operations per file into a single `awk` execution. Using process substitution and `read -r` with a custom IFS (`\034`) allows safely passing multiple parsed variables directly back into bash without evaluating output safely.
