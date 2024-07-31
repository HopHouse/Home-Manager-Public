{ config, pkgs, ... }:

let
  packages = [
    pkgs.ranger
    pkgs.ctags
    pkgs.ripgrep

    # Markdown reader
    pkgs.glow

    # Nvim - NvChad or LazyVim
    pkgs.fd
    pkgs.lazygit
    pkgs.tree-sitter
    pkgs.lua-language-server
  ];
in
{
  home.packages = packages;

  # Vim
  programs.vim = {
    enable = true;
    defaultEditor = false;
  };

  # VSCodium
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    mutableExtensionsDir = true;
    enableUpdateCheck = true;
    enableExtensionUpdateCheck = true;
    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      vscodevim.vim
      golang.go
      ms-python.python
      ms-vscode.hexeditor
      ms-vscode.powerShell
      ms-vscode-remote.remote-ssh
      ms-vscode.cpptools
      redhat.vscode-yaml
      hashicorp.terraform
      rust-lang.rust-analyzer
    ];
  };

  # neovim
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;
  };

  home.file."./.config/nvim/" = {
    source = ./lazy_nvim;
    recursive = true;
  };
}
