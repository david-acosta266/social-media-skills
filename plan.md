1. **Optimize `validate-skills.sh`**
   - The current script iterates over each skill in `skills/` and uses `head`, `awk` (twice), `tr`, `printf`, and `wc` as separate subprocesses for *each* file.
   - We will replace these multiple subprocess calls per file with a single `awk` script that parses the YAML frontmatter and counts the lines simultaneously.
   - This optimization avoids spawning multiple subprocesses in a loop, reducing execution time significantly.
   - We will use `replace_with_git_merge_diff` to modify the script.

2. **Run tests**
   - Run `./validate-skills.sh` to ensure it still works correctly and all output matches the original format.

3. **Complete pre-commit steps to ensure proper testing, verification, review, and reflection are done.**
   - Run `pre_commit_instructions` tool to make sure all pre commit steps are complete.

4. **Submit the PR**
   - Submit PR with title '⚡ Bolt: [performance improvement]' and description with '💡 What', '🎯 Why', '📊 Impact', and '🔬 Measurement'.
