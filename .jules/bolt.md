## 2026-10-10 - Bash Optimization in validate-skills.sh
**Learning:** Parsing multiple fields with separate `head`, `awk`, `tr`, and `wc` commands inside a loop spawns unnecessary subprocesses and slows down script execution significantly.
**Action:** Consolidate file parsing into a single `awk` pass when possible, extracting all necessary fields and reading them directly into bash variables using `read` with process substitution and a safe delimiter (e.g. `IFS=$'\034'`). Always double-check quoting when inserting variables back into the shell.
