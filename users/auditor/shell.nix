{ config, pkgs, lib, ... }:

{
  # zsh
  programs.zsh = {
    oh-my-zsh = {
      enable = true;
      theme = lib.mkForce "agnoster";
    };
  };
}
