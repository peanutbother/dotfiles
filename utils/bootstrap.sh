#!/bin/sh
# this script bootstraps nix-darwin
# but could be refactored to also bootstrap other systems like linux and nix os

echo "installing nix"
eval "$(curl -L https://nixos.org/nix/install)"

echo "enabling flakes"
mkdir -p ~/.config/nix
echo "experimental-features = nix-command flakes" >>~/.config/nix/nix.conf

echo "configuring nix-darwin"
nix run nix-darwin -- switch --flake /Volumes/Share/.nix
