{ pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./neovim/default.nix
    ./tmux.nix
    ./waybar.nix
    ./wofi.nix
    ./zsh.nix
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  nix = {
    package = pkgs.nix;
    # This clean up old generations automatically
    gc = {
      # default is weekly
      automatic = true;
    };
  };

  home = {
    username = "n3xu5";
    homeDirectory = "/home/n3xu5";
    stateVersion = "23.05";
  };
 
  # Programs
  programs = {
    chromium = {
      enable = true;
      package = pkgs.brave;
      extensions = [
        { id = "dbepggeogbaibhgnhhndojpepiihcmeb"; } # Vimium
        { id = "hdokiejnpimakedhajhdlcegeplioahd"; } # LastPass
        { id = "gpdjojdkbbmdfjfahjcgigfpmkopogic"; } # Pinterest
      ];
    };

    kitty = {
      enable = true;
      theme = "Catppuccin-Macchiato";
      font = {
        name = "JetBrains Mono";
        size = 12;
      };
      settings = {
        confirm_os_window_close = -0;
        copy_on_select = true;
        clipboard_control = "write-clipboard read-clipboard write-primary read-primary";
      };
    };

    # https://nixos.asia/en/git
    git = {
      enable = true;
      userName = "Rafael Dias";
      userEmail = "theminimalistdeveloper@gmail.com";
      ignores = [ "*~" "*.swp" ];
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    starship = {
      enable = true;
      settings = {
        add_newline = true;
        username = {
          style_user = "blue bold";
          style_root = "red bold";
          format = "[$user]($style) ";
          disabled = false;
          show_always = true;
        };
        hostname = {
          ssh_only = false;
          ssh_symbol = "🌐 ";
          format = "on [$hostname](bold red) ";
          trim_at = ".local";
          disabled = false;
        };
      };
    };

    bat.enable = true; # Better `cat`
    btop.enable = true; 
    fzf.enable = true; # Type `<ctrl> + r` to fuzzy search your shell history
    jq.enable = true;
    zoxide.enable = true; # Type `z <pat>` to cd to some directory
  };

  # Packages
  home.packages = with pkgs; [
    # Unix tools
    curl
    eza # ls alternative
    fd # find alternative
    killall # kill all process of a specificy name
    ripgrep # grep alternative
    sd
    stow # symlinks manager
    tree # visualize folders in a tree format
    wl-clipboard # Wayland clipboard util
    neofetch

    # General
    w3m # command line browser
    yazi # command line file manager

    # Environment
    swaybg # wallpaper manager

    # Media consumption
    cider
    plex
    vlc

    # Development
    rustup
    gcc
  ];
}
