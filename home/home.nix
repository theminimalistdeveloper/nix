{ pkgs, ...}: 
{
  imports = [
    ./neovim/default.nix
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
    kitty = {
      enable = true;
      theme = "Catppuccin-Macchiato";
      settings = {
       confirm_os_window_close = -0;
       copy_on_select = true;
       clipboard_control = "write-clipboard read-clipboard write-primary read-primary";
      };
    };

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

    tmux = {
      enable = true;
      historyLimit = 100000;
      terminal = "tmux-256color";
      plugins = with pkgs;
      [
        tmuxPlugins.vim-tmux-navigator
        {
          plugin = tmuxPlugins.catppuccin;
          extraConfig = '' 
              set -g @catppuccin_flavour 'macchiato'
          '';
        }
      {
        plugin = tmuxPlugins.resurrect;
        extraConfig = ''
          set -g @resurrect-strategy-vim 'session'
          set -g @resurrect-strategy-nvim 'session'
          set -g @resurrect-capture-pane-contents 'on'
          '';
      }
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = ''
          set -g @continuum-restore 'on'
          set -g @continuum-boot 'on'
          set -g @continuum-save-interval '10'
          '';
      }
      ];
      extraConfig = ''
        # GENERAL

        # Spaces start from 1
        set -g base-index 1
        # Remap prefix from 'C-b' to 'C-a'
        unbind C-b
        set-option -g prefix C-a
        bind-key C-a send-prefix
        # Automatically set window title
        set-window-option -g automatic-rename on
        set-option -g set-titles on
        set-option -g focus-events on
        # Set the history of the panel to 10k lines
        set -g history-limit 10000
        # Set VI bindings style
        setw -g mode-keys vi
        set -g status-keys vi
        # Windows with activity are highlighted in the status line.
        setw -g monitor-activity on
        # No delay for escape key press
        set -sg escape-time 0

        # BINDINGS

        # SPLIT
        # Map to have similar arrangement as vim bindings
        bind-key s split-window -v
        bind-key v split-window -h

        # RESIZING
        # To facilitate resizing
        bind-key J resize-pane -D 5
        bind-key K resize-pane -U 5
        bind-key H resize-pane -L 5
        bind-key L resize-pane -R 5

        # PANE SELECTION
        # Vim style pane selection
        bind-key h select-pane -L
        bind-key j select-pane -D
        bind-key k select-pane -U
        bind-key l select-pane -R
      '';
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
    w3m # command line browser
    yazi # command line file manager

    # Environment
    swaybg # wallpaper manager
    waybar # status bar
    wofi # launcher

    # Media consumption
    cider
    plex
    vlc
  ];
}
