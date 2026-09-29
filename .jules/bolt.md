## 2026-09-29 - [Optimize bash scripts avoiding subprocesses inside loops]
**Learning:** [In shell scripts processing many files, spawning multiple subprocesses like `head`, `awk`, `tr`, `wc` inside loops is a major bottleneck.]
**Action:** [Consolidate text parsing and counting into a single `awk` pass or use bash-native string manipulation.]
