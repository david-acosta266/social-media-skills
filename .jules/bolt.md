## 2024-05-24 - Validate Skills Script Performance
**Learning:** Shell scripts that invoke external programs (`awk`, `basename`, `head`, `wc`) multiple times in a loop over many files can suffer significant performance overhead from process creation. Parsing a yaml-like file iteratively in pure bash using `read` is surprisingly fast and avoids the overhead of spanning 17 * 3 = 51 processes.
**Action:** When validating or parsing many small files in bash, prefer built-in parameter expansion (`${var##*/}`) and pure bash read loops over pipeline-heavy commands.
