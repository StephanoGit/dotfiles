#!/usr/bin/env bash

source ~/.config/sketchybar/colors.sh

# if [ -n "$FOCUSED_WORKSPACE" ]; then
#     current_focused="$FOCUSED_WORKSPACE"
# else
#     current_focused=$(aerospace list-workspaces --focused)
# fi

if [ "$1" = "$current_focused" ]; then
    sketchybar --set $NAME background.color=$RED_COLOR_W background.drawing=on
else
    sketchybar --set $NAME background.color=$ITEM_BG_COLOR background.drawing=on
fi
