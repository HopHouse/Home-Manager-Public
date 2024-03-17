# home-manager public repository

Contains code used on news machines to make it like home.

```
# Switch the home-manager configuration automaticaly based on the username
home-manager switch -b backup --flake 'github:HopHouse/Home-Manager-Public'

# Switch the home-manager configuration related to the wanted profile
home-manager switch -b backup --flake 'github:HopHouse/Home-Manager-Public#PROFILE'

# Switch the home-manager configuration with experimental nix commands
home-manager switch -b backup --extra-experimental-features nix-command --extra-experimental-features flakes --flake 'github:HopHouse/Home-Manager-Public'
```
