{ ... }: {
  programs.waybar = {
    enable = true;
    settings = [{
      height = 25;
      spacing = 0;
      modules-left = [
        "custom/media"
          "hyprland/window"
      ];
      modules-center = [
        "hyprland/workspaces"
      ];
      modules-right = [
        "pulseaudio"
        "network"
        "backlight"
        "battery"
        "clock"
      ];
      "hyprland/workspaces" = {
        disable-scroll = true;
        all-outputs = true;
        warp-on-scroll = false;
        format = "{icon}";
        format-icons = {
          "1" = "";
          "2"= "";
          "3"= "󰝚";
          "4"= "4";
          "5"= "5";
          "6"= "6";
          "7"= "7";
          "8"= "8";
          "9"= "9";
          urgent = "";
          focused = "";
          default = "";
        };
      };

      clock = {
        format-alt = "{:%Y-%m-%d}";
      };
      backlight = {
        format = "{icon}";
        format-icons = ["" "" "" "" "" "" "" "" ""];
      };
      battery = {
        states = {
          warning = 20;
          critical = 10;
        };
        format = "{icon}";
        format-full = "{icon}";
        format-charging = "󰂄";
        format-plugged = "";
        format-alt = "{icon}";
        format-icons = ["󰁺" "󰁼" "󰁾" "󰂀" "󰂂"];
      };
      network = {
        format-wifi = "";
        format-ethernet = "󰈁";
        tooltip-format = "{ifname} via {gwaddr}";
        formjt-linked = "{ifname} (No IP)";
        format-disconnected = "Disconnected ⚠";
        format-alt = "{ifname}: {ipaddr}/{cidr}";
      };
      pulseaudio = {
        format = "{icon}";
        format-bluetooth = "{volume}% {icon} ";
        format-bluetooth-muted = " {icon} ";
        format-muted = " ";
        format-source = "";
        format-source-muted = "";
        format-icons = {
          headphone = "";
          car = "";
          default = ["" "" ""];
        };
      };
    }];

    style = ''
        @define-color base rgb(36, 39, 58);
        @define-color blue rgb(138, 173, 244);
        @define-color crust rgb(24, 25, 38);
        @define-color flamingo rgb(240, 198, 198);
        @define-color green rgb(166, 218, 149);
        @define-color mantle rgb(30, 32, 48);
        @define-color overlay0 rgb(110, 115, 141);
        @define-color peach rgb(245, 169, 127);
        @define-color red rgb(237, 135, 150);
        @define-color subtext0 rgb(165, 173, 203);
        @define-color subtext1 rgb(184, 192, 224);
        @define-color surface0 rgb(54, 58, 79);
        @define-color text rgb(202, 211, 245);
        @define-color overlay2 rgb(147, 154, 183);

        * {
          font-family: Hack, sans-serif;
          font-size: 14px;
          font-weight: bold;
        }

        window#waybar {
            background: @crust;
            color: @overlay2;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        button {
            border: none;
            border-radius: 0;
            background-color: transparent;
            color: @overlay2;
            padding: 0 10px;
        }

        button:hover {
          background: inherit;
          color: @text;
          border: none;
        }

        #workspaces button.active {
          color: white;
        }

        #mode {
            background-color: transparent;
        }

        #window,
        #workspaces {
            margin: 0 4px;
        }

        .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
        }

        .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
        }

        #battery.charging, #battery.plugged {
            color: @green;
        }

        @keyframes blink {
            to {
                color: @crust;
            }
        }

        #battery.critical:not(.charging) {
            color: @red;
            animation-name: blink;
            animation-duration: 0.5s;
            animation-timing-function: steps(12);
            animation-iteration-count: infinite;
            animation-direction: alternate;
        }

        #power-profiles-daemon {
            padding-right: 15px;
        }

        #power-profiles-daemon.performance {
            color: @red;
        }

        #power-profiles-daemon.balanced {
            color: @blue;
        }

        #power-profiles-daemon.power-saver {
            color: @green;
        }

        #pulseaudio,
        #network,
        #backlight,
        #clock {
          padding: 0 10px;
        }

        #battery {
          padding: 0 0 0 5px;
        }
    '';
  };
}
