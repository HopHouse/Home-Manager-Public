{ config, pkgs, ... }:

{
  imports = [
    ../../base.nix

    ./packages.nix
    ./shell.nix
    ./ssh.nix
    ./editors.nix
    ./keyboard.nix
  ];
}
