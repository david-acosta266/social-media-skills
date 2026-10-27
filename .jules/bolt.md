
## 2026-10-27 - [Optimize validate-skills.sh script]
**Learning:** In bash scripts, avoiding multiple subprocess calls (like `head`, `awk`, `tr`, `wc`) inside loops and instead combining them into a single `awk` pass significantly reduces execution time by over 60%.
**Action:** Consolidate multiple string processing commands into a single `awk` command with a `while` loop or a single process pass to retrieve all variables separated by a non-printable character (`\034`), then parse it natively using `IFS=$'\034' read -r`.
