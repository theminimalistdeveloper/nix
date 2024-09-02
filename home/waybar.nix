{ ... }: {
  programs.waybar = {
    enable = true;
    settings = [{
      height = 20;
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
          "2"= "";
          "3"= "";
          "4"= "";
          "5"= "";
          urgent = "";
          focused = "";
          default = "";
        };
      };

      clock = {
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };
      backlight = {
        format = "{icon}";
        format-icons = ["" "" "" "" "" "" "" "" ""];
      };
      battery = {
        states = {
          warning = 30;
          critical = 1;
        };
        format = "{icon}";
        format-full = "{icon}";
        format-charging = "";
        format-plugged = "";
        format-alt = "{icon}";
        format-icons = ["" "" "" "" ""];
      };
      network = {
        format-wifi = "";
        format-ethernet = "";
        tooltip-format = "{ifname} via {gwaddr} ";
        formjt-linked = "{ifname} (No IP) ";
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
        * {
            /* `otf-font-awesome` is required to be installed for icons */
            font-family: Hack, sans-serif;
            font-size: 12px;
        }

        window#waybar {
            background-color: transparent;
            color: #ffffff;
        }

        window#waybar.hidden {
            opacity: 0.2;
        }

        /*
        window#waybar.empty {
            background-color: transparent;
        }
        window#waybar.solo {
            background-color: #FFFFFF;
        }
        */

        window#waybar.termite {
            background-color: #3F3F3F;
        }

        window#waybar.chromium {
            background-color: #000000;
            border: none;
        }

        button {
            /* Use box-shadow instead of border so the text isn't offset */
            box-shadow: inset 0 -3px transparent;
            /* Avoid rounded borders under each button name */
            border: none;
            border-radius: 0;
        }

        /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
        button:hover {
            background: inherit;
        }

        /* you can set a style on hover for any module like this */
        #pulseaudio:hover {
            color: #ffffff;
            background-color: transparent;
        }

        #workspaces button {
            padding: 0 5px;
            background-color: transparent;
            color: #ffffff;
        }

        #workspaces button:hover { }

        #workspaces button.focused {
            background-color: transparent;
        }

        #workspaces button.urgent {
            background-color: transparent;
            color: #ffffff;
        }

        #mode {
            background-color: transparent;
        }

        #clock,
        #battery,
        #cpu,
        #memory,
        #disk,
        #temperature,
        #backlight,
        #network,
        #pulseaudio,
        #wireplumber,
        #custom-media,
        #tray,
        #mode,
        #idle_inhibitor,
        #scratchpad,
        #power-profiles-daemon,
        #clock,
        #battery,
        #mpd {
            padding: 0 10px;
            color: #ffffff;
            background: transparent;
        }

        #window,
        #workspaces {
            margin: 0 4px;
        }

        /* If workspaces is the leftmost module, omit left margin */
        .modules-left > widget:first-child > #workspaces {
            margin-left: 0;
        }

        /* If workspaces is the rightmost module, omit right margin */
        .modules-right > widget:last-child > #workspaces {
            margin-right: 0;
        }

        #battery.charging, #battery.plugged {
            color: #26A65B;
        }

        @keyframes blink {
            to {
                background-color: #ffffff;
                color: #000000;
            }
        }

        /* Using steps() instead of linear as a timing function to limit cpu usage */
        #battery.critical:not(.charging) {
            color: #f53c3c;
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
            color: #f53c3c;
        }

        #power-profiles-daemon.balanced {
            color: #2980b9;
        }

        #power-profiles-daemon.power-saver {
            color: #2ecc71;
        }

        label:focus {
            background-color: #000000;
        }


        #privacy {
            padding: 0;
        }

        #privacy-item {
            padding: 0 5px;
            color: white;
        }

        #privacy-item.screenshare {
            background-color: #cf5700;
        }

        #privacy-item.audio-in {
            background-color: #1ca000;
        }

        #privacy-item.audio-out {
            background-color: #0069d4;
        }
    '';
  };
}
