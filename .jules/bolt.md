## 2024-09-17 - Avoid multiple subshells/awk per file iteration in Bash loops
**Learning:** In `validate-skills.sh`, using `$(awk ...)` and `$(head ...)` multiple times inside a loop over many files creates significant overhead due to process forks. Pure Bash `while read` parsing for small text extraction (like YAML frontmatter) is considerably faster.
**Action:** When validating or parsing many small files in Bash, use built-in string manipulation and `read` instead of external processes like `awk` or `sed` to improve performance dramatically.
