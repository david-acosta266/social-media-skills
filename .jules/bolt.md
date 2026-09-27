## 2024-05-24 - Bash script subshell overhead
**Learning:** The validation script `validate-skills.sh` iterates over many files, and calling multiple external tools (awk, tr) for each file created significant process-forking overhead. Replacing these with native bash read loops and parameter expansion made the script over 2x faster.
**Action:** Favor bash native string manipulation and `while read` loops over multiple `awk`/`grep`/`tr` subshells when repeatedly processing many small files in validation scripts.
