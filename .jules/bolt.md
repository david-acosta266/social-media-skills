## 2026-10-13 - Bash subprocess spawning overhead
**Learning:** In bash scripts, especially in loops processing many files, spawning multiple subprocesses like `head`, `awk`, `tr`, and `wc` for each file introduces significant overhead due to process fork and initialization.
**Action:** Consolidate text processing and file metrics collection into a single `awk` pass per file. Use process substitution with `read -r` and a safe delimiter (like `IFS=$'\034'`) to efficiently ingest the results without spawning subshells or risking command injection via `eval`.
