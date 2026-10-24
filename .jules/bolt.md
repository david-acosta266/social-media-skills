
## 2026-10-24 - Prevent globbing vulnerability when optimizing string parsing in bash
**Learning:** When reading values into unquoted variables from external files or processes (e.g. from an awk sub-process into a bash variable using read), explicitly wrapping the bash variable usage in single quotes when passing it downstream is critical. Failure to do so (e.g., using double quotes internally which leads to unquoted expansion) exposes the script to unexpected filename expansion (globbing) if the parsed string contains characters like '*'.
**Action:** When refactoring to read variables directly in bash to skip subshells, always enclose the variable expansion in single quotes (e.g. err "name '$yaml_name'") to prevent unexpected globbing unless shell expansion is explicitly desired.
