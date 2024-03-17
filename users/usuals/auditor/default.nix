{ config, pkgs, ... }:

{
  imports = [
    ../base/default.nix

    ./shell.nix
  ];
}
