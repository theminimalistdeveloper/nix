{ pkgs, lib, ... }: {
    programs.tmux = {
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
}
