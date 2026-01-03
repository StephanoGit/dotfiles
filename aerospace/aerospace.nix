{ pkgs, system, ... }:
{

  services.aerospace = {
    enable = true;

    settings = {
      after-startup-command = [
        "exec-and-forget borders active_color=0xffe1e3e4 inactive_color=0xff494d64 width=5.0"
      ];

      # Notify Sketchybar about workspace change
      exec-on-workspace-change = [
        "/bin/bash"
        "-c"
        "sketchybar --trigger aerospace_workspace_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE PREV_WORKSPACE=$AEROSPACE_PREV_WORKSPACE"
      ];

      # Notify Sketchybar about focus change
      on-focus-changed = [
        "exec-and-forget sketchybar --trigger aerospace_focus_change FOCUSED_WORKSPACE=$AEROSPACE_FOCUSED_WORKSPACE"
      ];

      enable-normalization-flatten-containers = true;
      enable-normalization-opposite-orientation-for-nested-containers = true;

      accordion-padding = 300;

      default-root-container-layout = "tiles";
      default-root-container-orientation = "auto";

      on-focused-monitor-changed = [ "move-mouse monitor-lazy-center" ];

      automatically-unhide-macos-hidden-apps = false;
      on-window-detected = [
        {
          "if".app-name-regex-substring = "finder";
          run = "layout floating";
        }
      ];
      key-mapping = {
        preset = "qwerty";
      };

      gaps = {
        inner.horizontal = 10;
        inner.vertical = 10;
        outer.left = 8;
        outer.bottom = 8;
        outer.top = [
          { monitor."built-in" = 16; }
          48
        ];
        outer.right = 8;
      };

      mode.main.binding = {
        alt-slash = "layout tiles horizontal vertical";
        alt-comma = "layout accordion horizontal vertical";

        alt-h = "focus left";
        alt-j = "focus down";
        alt-k = "focus up";
        alt-l = "focus right";

        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        alt-minus = "resize smart -50";
        alt-equal = "resize smart +50";

        alt-left = "workspace prev";
        alt-right = "workspace next";

        alt-1 = "workspace 1";
        alt-2 = "workspace 2";
        alt-3 = "workspace 3";
        alt-4 = "workspace 4";
        alt-5 = "workspace 5";

        alt-shift-1 = "move-node-to-workspace 1 --focus-follows-window";
        alt-shift-2 = "move-node-to-workspace 2 --focus-follows-window";
        alt-shift-3 = "move-node-to-workspace 3 --focus-follows-window";
        alt-shift-4 = "move-node-to-workspace 4 --focus-follows-window";
        alt-shift-5 = "move-node-to-workspace 5 --focus-follows-window";

        alt-tab = "workspace-back-and-forth";

        alt-shift-tab = [
          "move-workspace-to-monitor --wrap-around next"
          "exec-and-forget sketchybar --trigger aerospace_monitor_change TARGET_MONITOR=$(aerospace list-monitors --focused --format ''%{monitor-appkit-nsscreen-screens-id}') FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)"
        ];

        alt-shift-semicolon = "mode service";
        alt-shift-enter = "mode apps";

      };

      workspace-to-monitor-force-assignment = {
        "1" = "main";
        "2" = "main";
        "3" = "main";
        "4" = [
          "secondary"
          "main"
        ];
        "5" = [
          "secondary"
          "main"
        ];
      };

      mode.service.binding = {
        esc = [
          "reload-config"
          "mode main"
        ];
        r = [
          "flatten-workspace-tree"
          "mode main"
        ];
        f = [
          "layout floating tiling"
          "mode main"
        ];
        backspace = [
          "close-all-windows-but-current"
          "mode main"
        ];

        alt-shift-h = [
          "join-with left"
          "mode main"
        ];
        alt-shift-j = [
          "join-with down"
          "mode main"
        ];
        alt-shift-k = [
          "join-with up"
          "mode main"
        ];
        alt-shift-l = [
          "join-with right"
          "mode main"
        ];

        down = "volume down";
        up = "volume up";
        shift-down = [
          "volume set 0"
          "mode main"
        ];
      };
    };
  };
}
