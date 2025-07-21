{ config, pkgs, ... }:

let
  packages = [
    pkgs.ranger
    pkgs.ctags
    pkgs.ripgrep

    # Markdown reader
    pkgs.glow
  ];
in
{
  home.packages = packages;

  home.sessionVariables = {
    EDITOR = "vim";
  };

  # Vim
  programs.vim = {
    enable = true;
    defaultEditor = false;
  };

  # neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
}
