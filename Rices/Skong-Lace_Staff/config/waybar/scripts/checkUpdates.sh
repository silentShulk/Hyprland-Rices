#!/usr/bin/env bash

# JSON escape function for tooltips
json_escape() {
  local string="$1"
  string="${string//\\/\\\\}"
  string="${string//\"/\\\"}"
  string="${string//$'\t'/\\t}"
  string="${string//$'\n'/\\n}"
  string="${string//$'\r'/\\r}"
  printf '%s\n' "$string"
}

# Fetch raw list of updates
raw_list=$({
  checkupdates 2>/dev/null || true
  yay -Qua 2>/dev/null || true
})

# Count non-empty lines to avoid counting trailing newlines as updates
updates=$(echo "$raw_list" | sed '/^$/d' | wc -l)

if [[ "$updates" == "0" ]]; then
  echo '{"text": "", "tooltip": "", "class": ""}'
else
  # Format the list with bullets (non-empty lines only)
  formatted_list=$(echo "$raw_list" | sed '/^$/d' | sed 's/^/• /')
  tooltip="Available updates:\n$formatted_list"
  tooltip_escaped=$(json_escape "$tooltip")
  echo '{"text": "  '"$updates"' ", "tooltip": "'"$tooltip_escaped"'", "class": "red"}'
fi
