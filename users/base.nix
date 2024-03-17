{ config, pkgs, ... }:

{
  imports = [
    ./shared/home-manager-auto-upgrade-flake.nix
  ];
  programs.home-manager.enable = true;

  services.home-manager.autoUpgradeFlake = {
    enable = true;
    frequency = "daily";
    flake = "github:HopHouse/Home-Manager-Public";
  };

  systemd.user.services.home-manager-auto-upgrade-flake.Service.Environment = [
    "PATH=${pkgs.lib.makeSearchPath "bin" [ pkgs.nix pkgs.git ]}"
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };
}
