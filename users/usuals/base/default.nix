{ config, pkgs, ... }:

{
  imports = [
    ../../base.nix

    ./packages.nix
    ./shell.nix
    ./ssh.nix
    ./editors.nix
    ./navigator.nix
    ./keyboard.nix
    ./gpg.nix
  ];

  home.sessionVariables = {
    #TERMINAL = "alacritty";
    EDITOR = "vim";
  };
}
