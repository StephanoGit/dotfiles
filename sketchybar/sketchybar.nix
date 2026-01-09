{ ... }:
{
  services.sketchybar = {
    enable = true;

    config = ''
      #!/bin/bash

      source ~/.config/sketchybar/colors.sh

      PLUGIN_DIR="~/.config/sketchybar/plugins"

      sketchybar --bar position=top height=40 color=$BAR_COLOR

      default=(
        padding_left=5
        padding_right=5
        icon.font="SF Pro:Bold:17.0"
        label.font="JetBrainsMonoNL NFM:Bold:17.0"
        icon.color=$WHITE
        label.color=$WHITE
        icon.padding_left=10
        icon.padding_right=4
        label.padding_left=4
        label.padding_right=10
        background.color=$ITEM_BG_COLOR
        background.corner_radius=5
        background.height=24 
        updates=on
      )
      sketchybar --default "''${default[@]}"

      sketchybar --add event aerospace_workspace_change
      sketchybar --add event aerospace_monitor_change
      sketchybar --add event aerospace_focus_change

      for sid in $(aerospace list-workspaces --all); do
        sketchybar --add item space.$sid left \
          --subscribe space.$sid aerospace_workspace_change aerospace_focus_change \
          --set space.$sid \
          display="$(
            v=$(aerospace list-windows --workspace "$sid" --format "%{monitor-appkit-nsscreen-screens-id}" | cut -c1)
            echo "''${v:-1}"
          )" \
          drawing=off \
          background.color=$ITEM_BG_COLOR \
          background.corner_radius=5 \
          background.drawing=on \
          background.height=25 \
          icon="$sid" \
          icon.padding_left=10 \
          label.font="sketchybar-app-font:Regular:16.0" \
          label.padding_right=20 \
          label.padding_left=0 \
          label.y_offset=-1 \
          click_script="aerospace workspace $sid" \
          script="~/.config/sketchybar/plugins/aerospace.sh $sid"
      done

      # Load Icons on startup
      for mid in $(aerospace list-monitors | cut -c1); do
        for sid in $(aerospace list-workspaces --monitor $mid --empty no); do
        apps=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

        sketchybar --set space.$sid drawing=on

        icon_strip=" "
        if [ "''${apps}" != "" ]; then
          while read -r app; do
            icon_strip+=" $(~/.config/sketchybar/plugins/icon_map_fn.sh "$app")"
          done <<<"''${apps}"
        else
          icon_strip=""
        fi
        sketchybar --set space.$sid label="$icon_strip"
        done
      done

      sketchybar --add item space_separator left \
        --set space_separator icon="" \
        icon.font="JetBrainsMonoNL NFM:Bold:17.0" \
        icon.padding_left=4 \
        label.drawing=off \
        background.drawing=off \
        script="$PLUGIN_DIR/space_windows.sh" \
        --subscribe space_separator aerospace_workspace_change front_app_switched space_windows_change aerospace_monitor_change

      # Front app!!
      sketchybar --add item front_app left \
        --set front_app icon.drawing=off \
          label.padding_left=10 \
          background.drawing=off \
          script="$PLUGIN_DIR/front_app.sh" \
        --subscribe front_app front_app_switched

      ##### Adding Right Items #####

      sketchybar --add item clock right \
        --set clock update_freq=10 script="$PLUGIN_DIR/clock.sh" \
        --add item volume right \
        --set volume script="$PLUGIN_DIR/volume.sh" \
        --subscribe volume volume_change \
        --add item battery right \
        --set battery update_freq=120 script="$PLUGIN_DIR/battery.sh" \
        --subscribe battery system_woke power_source_change \
        --add item bluetooth right \
        --set bluetooth update_freq=5 script="$PLUGIN_DIR/bluetooth.sh" \
          label.drawing=off \
          icon.padding_right=10 \
        --subscribe bluetooth system_woke \
        --add item wifi right \
        --set wifi update_freq=2 script="$PLUGIN_DIR/wifi.sh" \
          label.drawing=off \
          icon.padding_right=10 \
        --subscribe wifi system_woke \
        label.font="SF Pro:Bold:13.0" \
        icon.color=$WHITE \
        label.color=$WHITE

      sketchybar --update    
    '';
  };
}
