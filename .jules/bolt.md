## 2026-10-22 - Bash Loop Subprocess Sprawl
**Learning:** Spawning multiple subprocesses (`head`, `awk`, `tr`, `wc`) inside a file-processing bash loop drastically inflates execution time due to the fork/exec overhead.
**Action:** Consolidate multiple text extractions and line counting into a single POSIX `awk` pass that emits all required fields separated by a non-printable delimiter (like `\034`), which can then be safely parsed in bash via `read -r`.
