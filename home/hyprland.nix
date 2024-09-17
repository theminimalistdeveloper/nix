{ pkgs, lib, ... }: {
wayland.windowManager = {
    hyprland = {
      enable = true;
      settings = {
        "$mod" = "SUPER";
        exec-once = [
          "swaybg -i ~/Pictures/background.jpg"
          "waybar"
          "brave"
          "kitty"
        ];
        bind = [
          "SUPER, x, exec, hyprctl keyword general:layout \"dwindle\""
          "SUPER SHIFT, x, exec, hyprctl keyword general:layout \"master\""

          "$mod, T, exec, kitty"
          "$mod, B, exec, brave"
          "$mod, C, killactive,"
          "$mod, E, exit,"
          "$mod, SPACE, exec, wofi --show drun"
          "$mod, P, pseudo, # dwindle"
          "$mod, S, togglesplit, # dwindle"

          # Move focus with mod + arrow keys
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"

          # Move focus with mod + arrow keys
          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, l, movewindow, r"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, j, movewindow, d"

          # Switch workspaces with mod + [0-9]
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"

          # Move active window to a workspace with mod + SHIFT + [0-9]
          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6"
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"
          "$mod SHIFT, 9, movetoworkspace, 9"
          "$mod SHIFT, 0, movetoworkspace, 10"

          # Example special workspace (scratchpad)
          "$mod, S, togglespecialworkspace, magic"
          "$mod SHIFT, S, movetoworkspace, special:magic"

          # Media Keys
          # Volume up
         ", code:123, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%+"
         # Volume down
         ", code:122, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%-"
         # Mute
         ", code:134, exec, wpct set-mute @DEFAULT_AUDIO_SINK@ 'toggle'"
         # Brightness up
         ", code:233, exec, brightnessctl s +5%"
         # Brightness down
         ", code:232, exec, brightnessctl s 5%-"
         # Display 
         ", code:235, exec, "
         # Print Screen 
         ", code:107, exec, "
         # Launch
         ", code:157, exec, "
         # No symbol F11
         ", code:248, exec, "
         # Favorites
         ", code:164, exec, "
        ];

        dwindle = {
          pseudotile = true;
          preserve_split = true;
        };

        env = [
          "XCURSOR_SIZE,32"
        ];

        master = {
          new_status = "master";
          orientation = "center";
          always_center_master = true;
        };

        misc = {
          force_default_wallpaper = 0;
          disable_hyprland_logo = true;
        };

        input = {
          kb_layout = "us";
          kb_variant = "alt-intl";
          kb_model = "thinkpad";
          # kb_options =
          # kb_rules =

          follow_mouse = 1;
          sensitivity = 0;

          touchpad = {
            natural_scroll = true;
          };
        };

        gestures = {
          workspace_swipe = true;
        };

        windowrulev2 = [
          "workspace 1,class:^(kitty)$,title:^(kitty)$"
          "workspace 2,title:(.*)( - Brave)$"
          "workspace 4,class:^(Cider)$,title:^(Cider)$"
          "suppressevent maximize, class:.*"
        ];

        general = { 
          gaps_in = 5;
          gaps_out = 10;
          border_size = 0;
        };

        decoration = {
          rounding = 3;
          active_opacity = 0.9;
          inactive_opacity = 0.7;
          blur = {
            passes = 3;
            enabled = true;
            size = 8;
            special = true;
            popups = true;
            xray = true;
            ignore_opacity = true;
          };
        };
      };
    };
  };
}
