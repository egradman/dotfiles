#!/usr/bin/env bash

# Collect labels and commands
LABELS=()
COMMANDS=()
COLORS=(cyan magenta yellow green blue red)

# Read lines from the input script (ignoring the shebang)
tail -n +2 "$0" | while IFS= read -r line; do
  # Skip empty lines and comments
  [[ -z "$line" || "$line" =~ ^# ]] && continue

  # Extract label and command
  label="${line%%:*}"
  cmd="${line#*: }"

  LABELS+=("$label")
  COMMANDS+=("$cmd 2>&1")
done

# Join arrays into comma-separated strings
labels_csv=$(IFS=,; echo "${LABELS[*]}")
colors_csv=$(IFS=,; echo "${COLORS[*]:0:${#LABELS[@]}}")

# Run concurrently
exec npx concurrently \
  --color always \
  -c "$colors_csv" \
  -n "$labels_csv" \
  "${COMMANDS[@]}" \
  | colorize_errors.sh | less -R +F
