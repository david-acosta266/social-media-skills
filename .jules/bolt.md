## 2026-10-15 - Optimize validate-skills.sh using single awk script
**Learning:** Shell scripts processing multiple files in a loop are significantly slowed down by spawning multiple subprocesses (like `head`, `awk`, `wc`, `tr`) per file. Replacing them with a single `awk` pass inside process substitution combined with `IFS=$'\034' read -r ...` improves performance significantly (~3x faster).
**Action:** When validating or parsing many files in bash loops, consolidate file reads and string manipulations into a single `awk` command or native bash operations to minimize subprocess overhead.
