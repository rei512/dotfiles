#!/bin/bash

# Run `checkupdates` and save the output
output=$(checkupdates 2>/dev/null)

# Check if output is empty
if [ -z "$output" ]; then
  lines=0
else
  lines=$(echo "$output" | wc -l)
fi

# Replace newlines with \n for JSON compatibility
formatted_output=$(echo "$output" | sed ':a;N;$!ba;s/\n/\\n/g')

# If there are updates, prepare the tooltip content
if [ "$lines" -gt 0 ]; then
  echo "{\"text\":\"$lines\",\"tooltip\":\"$formatted_output\"}"
else
  echo "{\"text\":\"0\",\"tooltip\":\"System is up to date.\"}"
fi
