#!/bin/bash

# Get player status and metadata using playerctl
status=$(playerctl status 2>/dev/null || echo "No players found")
if [ "$status" = "Stopped" ] || [ "$status" = "No players found" ]; then
  echo ""                          # Empty for fixed icon only ("▶ ")
  echo "No music or video playing" # Tooltip
  echo "media-idle"                # CSS class for idle styling
  echo "#29e8db"                   # Cyan background for idle
  exit 0
fi

# Fetch metadata
artist=$(playerctl metadata artist 2>/dev/null || echo "")
full_title=$(playerctl metadata title 2>/dev/null || echo "Unknown Title")
album=$(playerctl metadata album 2>/dev/null || echo "")

# Detect and clean up web sources (e.g., YouTube)
source_name=""
is_youtube=false
if [[ -z "$artist" && "$full_title" =~ " - YouTube"$ ]]; then
  source_name="Youtube"
  is_youtube=true
  full_title="${full_title% - YouTube}" # Strip suffix
elif [[ -z "$artist" && "$full_title" =~ " - Spotify"$ ]]; then
  source_name="Spotify"
  full_title="${full_title% - Spotify}"
elif [[ -z "$artist" ]]; then
  source_name="Web Player" # Fallback for other browsers
fi

# Prioritize native artist; enhance for YouTube if empty
if [ -z "$artist" ]; then
  if [ "$is_youtube" = true ] && command -v yt-dlp >/dev/null 2>&1; then
    url=$(playerctl metadata xesam:url 2>/dev/null || echo "")
    if [[ "$url" =~ youtube.com/watch\?v= ]]; then
      fetched_artist=$(yt-dlp --print uploader "$url" 2>/dev/null || echo "")
      artist="$fetched_artist"
    fi
  fi
  # Final fallback to source_name if still empty
  artist=${artist:-$source_name}
fi

# Parse core_title: Strip leading year prefix like "(1996) " if present, keep the rest
core_title="$full_title"
if [[ "$full_title" =~ ^\([0-9]{4}\)\ (.*)$ ]]; then
  core_title="${BASH_REMATCH[1]}" # Capture group 1: everything after "(YYYY) "
fi

# Clean artist: Trim common suffixes like " - Topic"
artist=$(echo "$artist" | sed 's/ - Topic$//' | xargs) # Trim & strip

# Output for Waybar: Source for dynamic part + media tooltip
echo "($source_name)"            # Line 1: For "▶ ($Youtube)" on play
echo "${core_title} - ${artist}" # Line 2: Hover media details
echo "media-playing"             # Line 3: CSS class for playing state
echo "#1e1e2e"                   # Line 4: Background color (dark base)
