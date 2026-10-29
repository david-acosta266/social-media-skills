
## 2026-10-29 - Optimize bash loops by consolidating subprocesses
**Learning:** In bash scripts, spawning multiple subprocesses (like `head`, `awk`, `tr`, `wc`) inside a loop can be a major performance bottleneck, especially as the number of iterations grows.
**Action:** When extracting multiple pieces of information from a file within a loop, use a single pass of a tool like `awk` to extract all necessary data, and pass it back to bash using `read -r` with process substitution and a safe delimiter (like `IFS=$'\034'`).
