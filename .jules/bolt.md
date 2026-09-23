## 2024-06-12 - Bash Script Optimization
**Learning:** Using multiple external tools like `head`, `awk`, `tr`, and `wc` inside a bash `for` loop across many files creates severe performance bottlenecks due to excessive process forks.
**Action:** Consolidate file parsing operations into a single `awk` process per file loop iteration and replace tools like `basename` with native bash parameter expansion (e.g. `${dir##*/}`).
