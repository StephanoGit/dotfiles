#!/bin/bash
source ~/.config/sketchybar/colors.sh

# Get WiFi power state
WIFI_STATE=$(networksetup -getairportpower en0 | awk '{print $4}')

# Initialize variables
ICON=""
# LABEL=""
COLOR=$BLUE_COLOR_W

if [ "$WIFI_STATE" = "On" ]; then
  # WiFi is on
  ICON="󰖩"
  
  # Get current network SSID
  SSID=$(system_profiler SPAirPortDataType 2>/dev/null | awk '/Current Network Information:/{getline; print}' | head -1 | sed 's/^[[:space:]]*//;s/:$//')
  
  if [ -n "$SSID" ]; then
    # Connected to a network
    # LABEL="$SSID"
    ICON="󰖩"
    COLOR=$BLUE_COLOR_W # Blue color for connected
  else
    # WiFi on but not connected
    # LABEL="Searching"
    ICON="󱚵"
    COLOR=$YELLOW_COLOR_W
  fi
else
  # WiFi is off
  ICON="󰖪"
  # LABEL="Off"
  COLOR=$ITEM_BG_COLOR  # Gray color for off
fi

# Update Sketchybar
sketchybar --set "$NAME" \
  icon="$ICON" \
  background.color=$COLOR
