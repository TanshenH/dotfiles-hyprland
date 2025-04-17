#!/bin/bash

# Set the directory where your video wallpapers are located
WALLPAPER_DIR="$HOME/Videos/wallpapers"

# Use find to list all video files, then use basename to strip the path and show only the filename
SELECTED_WALLPAPER=$(find "$WALLPAPER_DIR" -type f -iname "*.mp4" |
  sed 's|.*/||' | rofi -dmenu -p "Select Video Wallpaper" -i)

# If a wallpaper was selected, set it as wallpaper using mpvpaper

#Kill swww for best experience
if pidof swww >/dev/null; then
  pkill swww
fi

if pidof mpv >/dev/null; then
  pkill mpv
fi

if ps -a | grep mpv >/dev/null; then
  pkill mpv
fi

if [[ -n "$SELECTED_WALLPAPER" ]]; then
  # Find the full path of the selected video
  VIDEO_PATH="$WALLPAPER_DIR/$SELECTED_WALLPAPER"

  # Play the selected wallpaper using mpvpaper
  mpvpaper -o "loop" eDP-1 "$VIDEO_PATH" --no-cuda
else
  echo "No wallpaper selected."
fi
