## 2024-05-24 - Bash Loop Process Forks Bottleneck
**Learning:** Running multiple subprocesses (`head`, `awk`, `wc`) inside a loop over files is a major performance bottleneck in bash scripts, causing heavy fork overhead.
**Action:** Consolidate multiple file parsing operations into a single `awk` pass using process substitution and a safe delimiter (`IFS=$'\x1c'`) to safely read multiple variables without `eval`.
