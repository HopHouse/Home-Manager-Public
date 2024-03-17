#! /usr/bin/env nix-shell
#! nix-shell -i bash -p home-manager

echo '[+] Testing auditor'
home-manager build -n --flake '.#auditor'

echo '[+] Testing pentester'
home-manager build -n --flake '.#pentester'

echo '[+] Testing operator'
home-manager build -n --flake '.#operator'
