{ pkgs, ...}: 
{

  imports = [
    ./neovim.nix # Comment this out if you do not want to setup Neovim.
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  # Generatl nix configurations
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
    zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      envExtra = ''
        # Make Nix and home-manager installed things available in PATH.
        export PATH=/run/current-system/sw/bin/:/nix/var/nix/profiles/default/bin:$HOME/.nix-profile/bin:/etc/profiles/per-user/$USER/bin:$PATH
      '';
      shellAliases = {
        sudo = "/run/wrappers/bin/sudo";
        c = "clear";
        e = "exit";
        n = "nvim";
      };
    };


    # https://nixos.asia/en/git
    git = {
      enable = true;
      userName = "Rafael Dias";
      userEmail = "theminimalistdeveloper@gmail.com";
      ignores = [ "*~" "*.swp" ];
      aliases = {
        gs = "status";
        gso = "status --oneline";
      };
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    starship = {
      enable = true;
      settings = {
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
    btop.enable = true; # Install btop https://github.com/aristocratos/btop
    fzf.enable = true; # Type `<ctrl> + r` to fuzzy search your shell history
    jq.enable = true;
    lazygit.enable = true;
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

    # General
    brave # browser
    yazi # file manager

    # Environment
    swaybg # wallpaper manager
    waybar # status bar
    wofi # launcher

    # Development
    tmux

    # Media consumption
    cider
    plex
    vlc
  ];
}
