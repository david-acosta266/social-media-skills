## 2024-09-26 - Eliminate subshells in bash loops for parsing
**Learning:** Process spawning overhead from tools like `awk` and `head` inside loops drastically degrades performance in bash scripts. Extracting YAML frontmatter line-by-line using pure bash string manipulation (e.g. `while read`, `${var#prefix}`) proved ~3-4x faster than executing multiple awk subshells.
**Action:** When validating or parsing files in bash scripts, prefer pure bash parameter expansion and `read` loops over spawning subshells like `awk`, `sed`, `head`, and `wc` inside loops, especially over large directories.
