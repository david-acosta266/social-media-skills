
## 2026-11-08 - Optimize validate-skills.sh parsing
**Learning:** The bash script spawned multiple subprocesses per file (head, awk [x3], printf [x2], tr [x4], and wc) inside a loop across many directories, which is a major performance bottleneck for process forking (especially on environments like Windows/WSL).
**Action:** Consolidate all file reading and text manipulation into a single awk pass to significantly improve performance. Use ASCII File Separator FS character (decimal 28) \034 to safely separate output fields from awk to read.
