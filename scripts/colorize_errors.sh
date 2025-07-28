#!/bin/bash

notify() {
  # Strip ANSI and newline
  clean_msg=$(printf '%s' "$1" | perl -pe 's/\e\[[0-9;]*[mGKH]//g' | tr -d '\r\n')

  # Escape leading bracket for terminal-notifier via apprise
  [[ "$clean_msg" == \[* ]] && clean_msg="\\$clean_msg"

  apprise -t "Log Alert" -b "$clean_msg" macosx://
}

export -f notify

awk '
BEGIN {
  red_bold = "\033[1;31m";
  reset = "\033[0m";
  IGNORECASE = 1;
}
{
  line = $0;
  highlighted = $0;

  if (line ~ /ERROR|Exception|Traceback/) {
    gsub(/ERROR|Exception|Traceback/, red_bold "&" reset, highlighted);
    # Escape shell characters in line
    gsub(/["`\\]/, "\\\\&", line);
    cmd = "bash -c \"notify \\\"" line "\\\"\"";
    system(cmd);
  }

  print highlighted;
  fflush();
}
'
