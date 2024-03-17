{ config, pkgs, ... }:

{
  # ssh
  programs.ssh = {
    enable = true;
  };

  # ssh-agent
  services.ssh-agent.enable = true;
}
