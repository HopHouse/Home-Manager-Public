{ config, pkgs, ... }:

let
  packages = [ 
    pkgs.ranger
    pkgs.ctags
    pkgs.ripgrep 

    # Markdown
    pkgs.glow
    
    # Nvim - NvChad
    pkgs.nodejs_21
    pkgs.fd
    pkgs.lazygit
    pkgs.tree-sitter
    pkgs.lua-language-server
    pkgs.nerdfonts
  ];

  vim_plugins = with pkgs.vimPlugins; [
    # basics
    vim-sensible
    vim-fugitive
    vim-sandwich
    vim-commentary
    vim-nix
    rust-vim
    vim-go

    # vim addon utilities
    direnv-vim
    ranger-vim
  ];

  neovim_plugins = with pkgs.vimPlugins; [
	  LazyVim
	  #nvchad
	  nvim-lspconfig
	  nvim-treesitter.withAllGrammars
	  plenary-nvim
	  gruvbox-material
	  #mini-nvim
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
      ms-vscode.PowerShell
      ms-vscode-remote.remote-ssh
      ms-vscode.cpptools
      redhat.vscode-yaml
      hashicorp.terraform
      rust-lang.rust-analyzer
    ];
    #++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
    #  {
    #    name = "rust-analyzer";
    #    publisher = "rust-lang";
    #    version = "0.4.1738";
    #    sha256 = "sha256-xxlwT48KbQIOnnqqTbiMbyYGQceb9aY/9fSbECi4y2M=";
    #  }
    #];
  };

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
    source = ./lazy_nvim;
    recursive = true;
  };
}
