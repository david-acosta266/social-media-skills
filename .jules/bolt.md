## 2026-10-08 - Bash Subprocess Optimization
**Learning:** The validation script used multiple subprocesses (head, awk, tr, wc) per file within a loop, causing significant overhead (a ~65% speedup was observed when consolidating them into a single awk process).
**Action:** When validating markdown files or processing text in bash loops, consolidate multiple extraction commands into a single awk script to avoid subprocess overhead.
