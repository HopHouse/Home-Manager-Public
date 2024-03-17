{ config, pkgs, ... }:

let
  packages = [ 
    pkgs.ranger
    pkgs.ctags
    pkgs.ripgrep 
  ];

  vim_plugins = with pkgs.vimPlugins; [
    # basics
    vim-sensible
    vim-fugitive
    vim-sandwich
    vim-commentary

    # vim addon utilities
    direnv-vim
    ranger-vim
  ];

  neovim_plugins = with pkgs.vimPlugins; [
	  LazyVim
	  nvim-lspconfig
	  nvim-treesitter.withAllGrammars
	  plenary-nvim
	  gruvbox-material
	  mini-nvim
  ];
in
{
  ## if you don't want to manage your shell through Home Manager.
  #home.sessionVariables = {
  #  EDITOR = "vim";
  #};

  # Vim
  programs.vim = {
    enable = true;
    defaultEditor = true;
    plugins = vim_plugins;
  };

  home.packages = packages;


  # neovim
  programs.neovim = {
    enable = true;
    #package = pkgs.neovim;
    #package = pkgs.neovim-unwrapped;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    # nvim plugin providers
    #withNodeJs = true;
    #withRuby = true;
    #withPython3 = true;

    # share vim plugins since nothing is specific to nvim
    plugins = neovim_plugins;
  };

  # nix run nixpkgs#patchelf -- --set-interpreter "$(nix eval nixpkgs#stdenv.cc.bintools.dynamicLinker --raw)"  ~/.local/share/nvim/mason/packages/rust-analyzer/rust-analyzer-x86_64-unknown-linux-gnu 
  home.file.".config/nvim/" = {
    source = ../../shared/lazy_nvim;
    recursive = true;
  };
}
