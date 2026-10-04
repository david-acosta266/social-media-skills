## 2023-10-04 - Optimize bash scripts by avoiding multiple subprocesses in loops
**Learning:** Using multiple subprocesses (head, awk, tr, wc) inside a loop over many files creates significant overhead. In bash, consolidating these operations into a single awk pass dramatically speeds up execution (reduced time from ~0.455s to ~0.146s in this validation script).
**Action:** Combine file reads and string manipulations into a single awk execution when processing files in a loop, and safely extract the values using read with process substitution and a safe delimiter like \034.
