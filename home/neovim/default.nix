{ pkgs, lib, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "main";
  });
in
{

  imports = [
    nixvim.homeManagerModules.nixvim
    ./plugins.nix
    ./options.nix
    ./keymaps.nix
  ];

  programs.nixvim.enable = true;
}
