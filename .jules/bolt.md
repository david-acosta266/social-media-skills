## 2026-11-07 - [Optimize validate-skills.sh execution time]
**Learning:** Parsing markdown files one by one with multiple subprocesses (`head`, `awk`, `tr`, `wc`) per file inside a loop is a significant performance bottleneck in bash scripts, especially as the number of files increases.
**Action:** Consolidate file parsing operations into a single `awk` script using a read loop per file to reduce subprocess overhead. Use process substitution and octal escape characters for safe variable extraction.
