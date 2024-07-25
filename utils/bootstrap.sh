#!/bin/sh
# this script bootstraps nix, using determinate systems installer which automatically also enables flakes and sane defaults which is very useful

echo "installing nix"
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

FLAKE="$(dirname $(dirname $0))#"

case $(uname -a) in
Linux*)
	echo "configuring nix-os"
	nixos-install --flake $FLAKE
	;;
Darwin*)
	echo "configuring nix-darwin"
	nix run nix-darwin -- switch --flake $FLAKE
	;;
*)
	echo "unsupported OS detected"
	exit 1
	;;
esac
