{ pkgs, lib, ... }:
let
  nixvim = import (builtins.fetchGit {
    url = "https://github.com/nix-community/nixvim";
    ref = "nixos-24.05";
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
