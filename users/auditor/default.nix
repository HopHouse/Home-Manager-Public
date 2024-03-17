{ config, pkgs, ... }:

{
  imports = [
    ../base/default.nix

    ./gpg.nix
    ./shell.nix
    ./navigator.nix
    ./ssh.nix
  ];
}
