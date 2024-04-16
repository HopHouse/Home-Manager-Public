{
  description = "Home-Manager public configuration";

  inputs = {
    nixpkgs = { url = "github:nixos/nixpkgs"; };
    #nixpkgs = { url = "github:nixos/nixpkgs/nixos-unstable"; };
    home-manager = { url = "github:nix-community/home-manager"; inputs.nixpkgs.follows = "nixpkgs"; };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    {
    homeConfigurations = 
    let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    stateVersion = "24.05";
    in
    {

      "root" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          {
            home = {
              stateVersion = "${stateVersion}";
              username = "root";
              homeDirectory = "/root";
            };
          }

          ./users/base

          {
            programs.tmux.plugins = [
              {
                plugin = pkgs.tmuxPlugins.dracula;
                extraConfig = ''
                  set -g @dracula-plugins "cpu-usage ram-usage network time"

                  set -g @dracula-refresh-rate 5
                  set -g @dracula-show-left-icon session
                  set -g @dracula-show-empty-plugins false
                  set -g @dracula-show-powerline false

                  set -g @dracula-military-time true
                  set -g @dracula-day-month true

                  set -g @dracula-network-bandwidth enp4s0
                  set -g @dracula-network-bandwidth-interval 0
                  set -g @dracula-network-bandwidth-show-interface true
                  '';
              }
            ];
          }
        ];
      };

      "operator" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          {
            home = {
              stateVersion = "${stateVersion}";
              username = "operator";
              homeDirectory = "/home/operator";
            };
          }

          ./users/base

          {
            programs.tmux.plugins = [
              {
                plugin = pkgs.tmuxPlugins.dracula;
                extraConfig = ''
                  set -g @dracula-plugins "cpu-usage ram-usage network time"

                  set -g @dracula-refresh-rate 5
                  set -g @dracula-show-left-icon session
                  set -g @dracula-show-empty-plugins false
                  set -g @dracula-show-powerline false

                  set -g @dracula-military-time true
                  set -g @dracula-day-month true

                  set -g @dracula-network-bandwidth enp4s0
                  set -g @dracula-network-bandwidth-interval 0
                  set -g @dracula-network-bandwidth-show-interface true
                  '';
              }
            ];
          }
        ];
      };

      "hophouse" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ 
          {
            home = {
              stateVersion = "${stateVersion}";
              username = "hophouse";
              homeDirectory = "/home/hophouse";
            };
          }

          ./users/base

          {
            programs.tmux.plugins = [
              {
                plugin = pkgs.tmuxPlugins.dracula;
                extraConfig = ''
                  set -g @dracula-plugins "cpu-usage ram-usage network time"

                  set -g @dracula-refresh-rate 5
                  set -g @dracula-show-left-icon session
                  set -g @dracula-show-empty-plugins false
                  set -g @dracula-show-powerline false

                  set -g @dracula-military-time true
                  set -g @dracula-day-month true

                  set -g @dracula-network-bandwidth enp4s0
                  set -g @dracula-network-bandwidth-interval 0
                  set -g @dracula-network-bandwidth-show-interface true
                  '';
              }
            ];
          }
        ];
      };

      "pentester" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            home = {
              stateVersion = "${stateVersion}";
              username = "auditor";
              homeDirectory = "/home/auditor";
            };
          }

          ./users/auditor

          ./users/shared/pentest_packages.nix
        ];
      };


      "kali" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            home = {
              stateVersion = "${stateVersion}";
              username = "kali";
              homeDirectory = "/home/kali";
            };
          }

          ./users/auditor
        ];
      };

      "auditor" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          {
            home = {
              stateVersion = "${stateVersion}";
              username = "auditor";
              homeDirectory = "/home/auditor";
            };
          }

          ./users/auditor
        ];
      };
    };

  };
}
