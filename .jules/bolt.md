## 2024-10-07 - Bash text processing
**Learning:** Using a single awk pass to process a file is much faster than running head, awk, tr, and wc separately. However, when formatting string output in awk, reading output into bash array requires care regarding the delimiters since awk could output newlines if parsing multiline blocks.
**Action:** Use a single awk script with a unique delimiter like `\034` to capture multiple outputs without running external tools like `tr`, `wc`, `awk` repeatedly in loop.
