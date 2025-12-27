{ self, inputs, meta, pkgs, ... }:
let
	hostnamesList = pkgs.lib.concatStringsSep ", " meta.hostnames;
	divider = "========================================";

	swap-file = "/mnt/.install-swap";
	swap-size = "8G";
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

	sudo btrfs filesystem mkswapfile --size ${swap-size} ${swap-file}
	sudo swapon ${swap-file}

	echo "${divider}"
	echo "* Installing NixOS system..."
	sudo nixos-install --flake "${self}#$hostname" --no-root-passwd

	echo "${divider}"
	echo "* Disabling temporary swap..."

	sudo swapoff "${swap-file}" || true
	sudo rm -f "${swap-file}"

	echo "${divider}"
	echo "* Installation complete!"
	echo "* Reboot with: reboot"
''