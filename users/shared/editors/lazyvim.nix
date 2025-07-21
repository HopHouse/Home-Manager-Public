{ config, pkgs, ... }:

let
  packages = [
    # Nvim - NvChad or LazyVim
    pkgs.fd
    pkgs.lazygit
    pkgs.tree-sitter
    pkgs.lua-language-server
  ];
in
{
  imports = [
    ./vim.nix
  ];

  home.packages = packages;

  programs.neovim = {
    withNodeJs = true;
  };

  home.file."./.config/nvim/" = {
    source = ./lazy_nvim;
    recursive = true;
  };
}
