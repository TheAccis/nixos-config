{ lib, pkgs, ... }:
{
	imports = [
		../../modules/nixos

    ../shared-modules/nvidia.nix

		./hardware-configuration.nix
	];

  disko.devices.disk.main.device = "/dev/nvme0n1";

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_zen;

  programs.nm-applet.enable = true;
}