#!/bin/bash
source ~/.config/sketchybar/colors.sh

# Get Bluetooth power state
BT_STATE=$(blueutil -p)

# Initialize variables
ICON=""
LABEL=""
COLOR=$BLUE_COLOR_W

if [ "$BT_STATE" = "1" ]; then
  # Bluetooth is on
  ICON="󰂯"
  
  # Get connected devices
  CONNECTED=$(blueutil --connected)
  
  if [ -n "$CONNECTED" ]; then
    # Count connected devices
    COUNT=$(echo "$CONNECTED" | grep -c "address:")
    
    if [ "$COUNT" -gt 0 ]; then
      # Get first connected device name
      DEVICE_NAME=$(echo "$CONNECTED" | grep "name:" | head -1 | sed 's/.*name: //' | sed 's/,.*//')
      
      if [ "$COUNT" -eq 1 ]; then
        LABEL="$COUNT device"
      else
        LABEL="$COUNT devices"
      fi
      
      ICON="󰂱"
      COLOR=$BLUE_COLOR_W # Blue color for connected
    else
      LABEL="On"
    fi
  else
    LABEL="On"
  fi
else
  # Bluetooth is off
  ICON="󰂲"
  LABEL="Off"
  COLOR=$ITEM_BG_COLOR  # Gray color for off
fi

# Update Sketchybar
sketchybar --set "$NAME" \
  icon="$ICON" \
  label="$LABEL" \
  background.color=$COLOR \
