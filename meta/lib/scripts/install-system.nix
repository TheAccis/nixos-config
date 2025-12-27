{ self, inputs, meta, pkgs, ... }:
let
	hostnamesList = pkgs.lib.concatStringsSep ", " meta.hostnames;
	divider = "========================================";
	# disk = disko.devices.disk.main.device
in
''
	set -euo pipefail

	if [ $# -ne 1 ]; then
		echo "Usage: $0 <hostname>"
		echo "Available hostnames: ${hostnamesList}"
		exit 1
	fi

	hostname="$1"
	found=0

	for valid_host in ${pkgs.lib.concatStringsSep " " meta.hostnames}; do
		if [ "$valid_host" = "$hostname" ]; then
			found=1
			break
		fi
	done

	if [ $found -eq 0 ]; then
		echo "Error: Hostname '$hostname' not found in flake"
		echo "Available hostnames: ${hostnamesList}"
		exit 2
	fi

	echo "${divider}"
	echo "* Installing NixOS configuration for host: $hostname"
	echo "${divider}"

	prompt="Warning: All data on this disk will be erased. Continue? (y/n): "
	read -p "$prompt" res && [[ "$res" =~ ^[yY](es)?$ ]] || exit 1

	echo "* Running disko (partitioning and mounting disks)..."
	sudo nix --extra-experimental-features "nix-command flakes" \
		run github:nix-community/disko -- --mode destroy,format,mount \
		--flake "${self}#$hostname" --yes-wipe-all-disks

	echo "${divider}"
	echo "* Enabling temporary swap for installation..."

	SWAPFILE="/mnt/.install-swap"
	SWAPSIZE="8G"

	sudo fallocate -l "$SWAPSIZE" "$SWAPFILE"

	sudo chmod 600 "$SWAPFILE"
	sudo mkswap "$SWAPFILE"
	sudo swapon "$SWAPFILE"

	echo "${divider}"
	echo "* Installing NixOS system..."
	sudo nixos-install --flake "${self}#$hostname" --no-root-passwd

	echo "${divider}"
	echo "* Disabling temporary swap..."

	sudo swapoff "$SWAPFILE" || true
	sudo rm -f "$SWAPFILE"

	echo "${divider}"
	echo "* Installation complete!"
	echo "* Reboot with: sudo reboot"
''