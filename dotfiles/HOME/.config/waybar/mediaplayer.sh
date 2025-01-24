#!/bin/bash

# Check if Spotify is running
if ! pgrep -x "spotify" > /dev/null; then
  exit 0
fi

# Get the currently playing song information
artist=$(playerctl -p spotify metadata artist 2>/dev/null)
title=$(playerctl -p spotify metadata title 2>/dev/null)

# Check if data is retrieved
if [[ -z "$artist" || -z "$title" ]]; then
  echo '{"text": "No song playing", "class": "stopped"}'
  exit 0
fi

# Combine artist and title
song_info="${artist} - ${title}"

# Truncate if too long
max_length=40
if [[ ${#song_info} -gt $max_length ]]; then
  song_info="${song_info:0:$max_length}…"
fi

# Output in JSON format
echo "{\"text\": \"$song_info\", \"class\": \"playing\"}"
