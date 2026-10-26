## 2026-10-26 - Bash Subprocess Overhead in Loop
**Learning:** Running multiple subprocesses (head, awk, tr, wc) inside a loop across multiple files creates a significant performance bottleneck in bash scripts.
**Action:** Always combine file reading and parsing logic into a single awk pass or use bash built-ins when iterating over many files.
