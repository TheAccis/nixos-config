{ self, inputs, meta, pkgs, ... }:
let
	lib = pkgs.lib;
	hostnamesList = lib.concatStringsSep ", " meta.hostnames;
in
''
	#!/usr/bin/env bash

	set -euo pipefail

	if [ $# -ne 1 ]; then
		echo "Usage: $0 <hostname>"
		echo "Available hostnames: ${hostnamesList}"
		exit 1
	fi

	hostname="$1"
	valid_host=0

	# Проверяем, что hostname существует в списке
	for valid_host in ${lib.concatStringsSep " " meta.hostnames}; do
		if [ "$valid_host" = "$hostname" ]; then
			valid_host=1
			break
		fi
	done

	if [ $valid_host -eq 0 ]; then
		echo "Error: Hostname '$hostname' not found in flake"
		echo "Available hostnames: ${hostnamesList}"
		exit 2
	fi

	echo "* Installing NixOS configuration for host: $hostname"
	echo "==============================================="

	echo "* Running disko (partitioning and mounting disks)..."
	sudo nix --extra-experimental-features "nix-command flakes" \
		run github:nix-community/disko -- --mode destroy,format,mount --flake "${self}#$hostname" \
		--quiet

	echo "* Installing NixOS system..."
	sudo nixos-install --flake "${self}#$hostname" --no-root-passwd

	echo "==============================================="
	echo "* Installation complete!"
	echo "* Reboot with: sudo reboot"
''