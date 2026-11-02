## 2023-10-27 - Optimize validate-skills.sh execution time
**Learning:** Shell scripts validating many files can become slow when spawning multiple subprocesses (awk, head, wc, tr) inside a loop for each file.
**Action:** Consolidate text processing into a single `awk` pass per file, and use bash `read` with process substitution to efficiently parse the output, minimizing subprocess overhead.
