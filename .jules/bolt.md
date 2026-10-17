
## 2026-10-17 - Optimize subprocesses inside loops
**Learning:** In bash scripts, especially when parsing multiple files in a loop (like `validate-skills.sh`), spawning multiple subprocesses like `head`, `awk`, `tr`, and `wc` per file significantly increases script execution time due to process overhead.
**Action:** Consolidate text processing and metadata extraction into a single `awk` pass per file. Return multiple values by printing them with a custom delimiter (like `\034`) and reading them directly into bash variables using `IFS=$'\034' read -r ... < <(awk ...)`. This drastically reduces the number of subprocesses and speeds up execution.
