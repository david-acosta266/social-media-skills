## 2026-09-12 - Bash subshell overhead in loops
**Learning:** In validate-skills.sh, using subshells and pipes (e.g. `$(basename "$dir")`, `$(head -n1)`, `$(wc -l ... | tr -d)`) inside a tight loop creates enormous overhead because it forks processes on every iteration.
**Action:** Replace external commands inside bash loops with shell builtins where possible (e.g. `${dir##*/}` for basename, `IFS= read -r line < file` for head -n1, `read -r count _ <<< "$(wc -l < file)"` for wc and tr). Also consolidate multiple awk invocations into a single script.
