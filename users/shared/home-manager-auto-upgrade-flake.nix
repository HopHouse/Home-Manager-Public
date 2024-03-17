{ config, lib, pkgs, ... }:

let

  cfg = config.services.home-manager.autoUpgradeFlake;

in {
  options = {
    services.home-manager.autoUpgradeFlake = {
      enable = lib.mkEnableOption ''
        the Home Manager upgrade service that periodically updates your Nix
        channels before running `home-manager switch`'';

      frequency = lib.mkOption {
        type = lib.types.str;
        example = "weekly";
        description = ''
          The interval at which the Home Manager auto upgrade is run.
          This value is passed to the systemd timer configuration
          as the `OnCalendar` option.
          The format is described in
          {manpage}`systemd.time(7)`.
        '';
      };

      flake = lib.mkOption {
      	type = lib.types.str;
	example = "git+ssh://git@github.com/example/repository.git";
	description = ''
	  The address of the flake file.
	'';
      };

      impure = lib.mkEnableOption {
      default = true;
      description = ''
        Use the impure flag.
      '';
    };
  };
};


  config = lib.mkIf cfg.enable {
    assertions = [
      (lib.hm.assertions.assertPlatform "services.home-manager.autoUpgradeFlake" pkgs
        lib.platforms.linux)
    ];

    systemd.user = {
      timers.home-manager-auto-upgrade-flake = {
        Unit.Description = "Home Manager upgrade Flake timer";

        Install.WantedBy = [ "timers.target" ];

        Timer = {
          OnCalendar = cfg.frequency;
          Unit = "home-manager-auto-upgrade-flake.service";
          Persistent = true;
        };
      };

      services.home-manager-auto-upgrade-flake = {
        Unit.Description = "Home Manager upgrade Flake";

        Service.ExecStart = toString
          (pkgs.writeShellScript "home-manager-auto-upgrade-flake" ''
	    #!/run/current-system/sw/bin/bash

            echo "Upgrade Home Manager with flake"
            ${pkgs.home-manager}/bin/home-manager switch -b backup --flake '${cfg.flake}' --impure
          '');
      };
      };
  };
}
