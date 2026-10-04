#!/usr/bin/env bash
# Validate every skill in skills/ against the Agent Skills spec.
# Checks: YAML frontmatter, required fields, name matches folder, description length,
# file size, and standard folder structure.

set -u

SKILLS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills"
PASS=0
WARN=0
FAIL=0
SKILL_COUNT=0

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
CYAN='\033[0;36m'
NC='\033[0m'

err()  { printf "  ${RED}x${NC} %s\n" "$1"; FAIL=$((FAIL+1)); }
warn() { printf "  ${YELLOW}!${NC} %s\n" "$1"; WARN=$((WARN+1)); }
ok()   { printf "  ${GREEN}v${NC} %s\n" "$1"; PASS=$((PASS+1)); }

printf "${CYAN}Validating skills in %s${NC}\n\n" "$SKILLS_DIR"

if [[ ! -d "$SKILLS_DIR" ]]; then
  printf "${RED}skills/ folder not found.${NC}\n"
  exit 1
fi

for skill_dir in "$SKILLS_DIR"/*/; do
  [[ -d "$skill_dir" ]] || continue
  SKILL_COUNT=$((SKILL_COUNT+1))
  skill_name="$(basename "$skill_dir")"
  skill_md="${skill_dir}SKILL.md"

  printf "${CYAN}%s${NC}\n" "$skill_name"

  # SKILL.md exists
  if [[ ! -f "$skill_md" ]]; then
    err "SKILL.md missing"
    continue
  fi

  # Folder name format
  if [[ ! "$skill_name" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
    err "folder name must be lowercase alphanumeric with hyphens"
  else
    ok "folder name valid"
  fi

  # Single awk pass to extract all required fields to speed up execution
  IFS=$'\034' read -r first_line yaml_name desc_block line_count < <(awk '
    BEGIN { in_desc=0; n=0; yaml_name=""; desc_block="" }
    NR==1 { first_line = $0 }
    /^---[ \t]*$/ { n++; if (n==2) in_desc=0 }
    n==1 && !/^---/ {
      if ($0 ~ /^name:/) {
        yaml_name = $0; sub(/^name:[ \t]*/, "", yaml_name); gsub(/["\047]/, "", yaml_name); gsub(/[ \t\r\n]+/, "", yaml_name)
      } else if ($0 ~ /^description:/) {
        in_desc=1; desc_line=$0; sub(/^description:[ \t]*/, "", desc_line)
        if (desc_line ~ /^>/ || desc_line ~ /^\|/) { }
        else { desc_block=desc_line; in_desc=0 }
      } else if (in_desc==1) {
        if ($0 ~ /^[a-zA-Z_-]+:/) in_desc=0
        else {
          desc_line=$0; sub(/^[ \t]+/, "", desc_line); sub(/[\r\n]+$/, "", desc_line)
          desc_block = desc_block == "" ? desc_line : desc_block " " desc_line
        }
      }
    }
    END { printf "%s\034%s\034%s\034%s\n", first_line, yaml_name, desc_block, NR }
  ' "$skill_md")

  # Frontmatter present
  if [[ "$first_line" != "---" ]]; then
    err "SKILL.md must start with YAML frontmatter (---)"
    continue
  fi

  # name field
  if [[ -z "$yaml_name" ]]; then
    err "name field missing from frontmatter"
  elif [[ "$yaml_name" != "$skill_name" ]]; then
    err "name '$yaml_name' does not match folder '$skill_name'"
  else
    ok "name matches folder"
  fi

  if [[ ${#yaml_name} -gt 64 ]]; then
    err "name exceeds 64 characters"
  fi

  # description field
  desc_len=${#desc_block}
  if [[ $desc_len -eq 0 ]]; then
    err "description field missing or empty"
  elif [[ $desc_len -gt 1024 ]]; then
    warn "description is $desc_len chars, consider trimming under 1024"
  else
    ok "description present ($desc_len chars)"
  fi

  # Trigger phrase hint
  if [[ "$desc_block" == *"when"* || "$desc_block" == *"Use"* || "$desc_block" == *"use"* ]]; then
    ok "description has trigger phrasing"
  else
    warn "description should include 'use' or 'when' trigger phrasing"
  fi

  # File size
  if [[ $line_count -gt 500 ]]; then
    warn "SKILL.md is $line_count lines, consider moving detail to references/"
  else
    ok "SKILL.md size OK ($line_count lines)"
  fi

  # Optional standard folders
  for sub in references scripts assets; do
    if [[ -d "${skill_dir}${sub}" ]]; then
      ok "has ${sub}/ folder"
    fi
  done

  printf "\n"
done

printf "${CYAN}Summary${NC}\n"
printf "  Skills checked: %d\n" "$SKILL_COUNT"
printf "  ${GREEN}Passed:${NC}   %d\n" "$PASS"
printf "  ${YELLOW}Warnings:${NC} %d\n" "$WARN"
printf "  ${RED}Failed:${NC}   %d\n" "$FAIL"

if [[ $FAIL -gt 0 ]]; then
  exit 1
fi
exit 0
