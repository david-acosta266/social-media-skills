## 2024-06-25 - Shell subprocess overhead
**Learning:** Shell loops which parse strings sequentially using several subprocess executions (e.g., awk, tr, wc) scale poorly. A simple loop validating 17 text files took ~0.50 seconds.
**Action:** When repeatedly iterating over string processing operations in Bash, replace `awk`, `tr`, `head`, and `basename` calls with native Bash string manipulations (`${var#prefix}`, `${var%suffix}`) and a single internal `read` loop to slash overhead significantly (achieved a 80% runtime reduction).
