{ config, pkgs, ... }:

{
  # GPG Agent
  services.gpg-agent = {
    enable = false;
    defaultCacheTtl = 1800;
    enableSshSupport = true;
  };
}
