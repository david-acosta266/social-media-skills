## 2026-08-30 - Bash loop optimization
**Learning:** Shell scripts containing loops heavily benefit from replacing external commands (like `basename`, `head`, and `tr`) with built-in bash functionalities (like parameter expansion and `read`). Additionally, combining multiple `awk` invocations into a single execution prevents excess process spawning.
**Action:** Next time I optimize bash scripts, I will proactively search for loops that invoke subshells and external tools, replacing them with bash built-ins and consolidated commands to significantly reduce execution time.
