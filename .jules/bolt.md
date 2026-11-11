
## 2026-11-11 - Optimize validate-skills.sh subprocess overhead
**Learning:** Spawning multiple subprocesses (e.g., `head`, `awk`, `tr`, `wc`) inside a bash loop is a major performance anti-pattern. Native bash string manipulation and combining multiple extraction tasks into a single `awk` process per file significantly reduces the overhead.
**Action:** When writing or optimizing bash scripts that process many files, avoid subprocesses inside loops. Consolidate text processing into a single `awk` pass or use built-in bash features (e.g., parameter expansion) where possible.
