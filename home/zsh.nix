{ ... }: {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
# GENERAL
      l = "eza";
      e = "exit";
      n = "nvim";
      c = "clear";

# GIT
# git status
      gs = "git status";
      gso = "git status --oneline";

# TMUX
      tn = "tmux new -s";
      tl = "tmux ls";
      ta = "tmux a -t";
      tk = "tmux kill-session -t";

# NIX
      nhs = "home-manager switch -f ~/nix/home/home.nix";
      nhg = "home-manager generations";
      ns = "sudo nixos-rebuild switch -I ~/nix/configuration.nix";
      nsu = "sudo nixos-rebuild switch -I ~/nix/configuration.nix --upgrade";
    };
    zplug = {
      enable = true;
      plugins = [
      { name = "zsh-users/zsh-autosuggestions"; }
      { name = "jeffreytse/zsh-vi-mode"; }
      ];
    };
    history = {
      size = 10000;
      path = "~/zsh/history";
    };
  };
}
