{ config, pkgs, ... }:

{
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
      ms-vscode.powershell
      ms-vscode-remote.remote-ssh
      ms-vscode.cpptools
      redhat.vscode-yaml
      hashicorp.terraform
      rust-lang.rust-analyzer
    ];
  };
}
