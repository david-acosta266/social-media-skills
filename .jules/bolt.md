
## 2026-09-19 - Bash Loop Subprocess Bottleneck
**Learning:** Spawning multiple processes (`head`, `awk`, `wc`) inside a bash loop for file parsing is a significant performance bottleneck. In `validate-skills.sh`, replacing multiple command substitutions per skill with a single `awk` process substitution (using `IFS=$'\x1c' read`) resulted in roughly a 3x speedup.
**Action:** Always prefer a single `awk` pass combined with safe delimiter reading when parsing files within a bash loop to minimize subprocess overhead.
