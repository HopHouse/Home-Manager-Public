#! /usr/bin/env nix-shell
#! nix-shell -i bash -p home-manager

echo '[+] Testing root'
home-manager build -n --flake '.#root'

echo '[+] Testing hophouse'
home-manager build -n --flake '.#hophouse'

echo '[+] Testing pentester'
home-manager build -n --flake '.#pentester'

echo '[+] Testing operator'
home-manager build -n --flake '.#operator'

echo '[+] Testing auditor'
home-manager build -n --flake '.#auditor'

echo '[+] Testing kali'
home-manager build -n --flake '.#auditor'
