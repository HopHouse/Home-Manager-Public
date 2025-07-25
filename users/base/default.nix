{ config, pkgs, ... }:

{
  imports = [
    ../base.nix

    ./keyboard.nix
    ./git.nix
    ./packages.nix
    ./shell.nix
    ./ssh.nix

    ../shared/editors/lazyvim.nix
  ];
}
