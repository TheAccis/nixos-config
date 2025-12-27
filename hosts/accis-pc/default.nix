{ lib, ... }:
{
	imports = [
		../../modules/nixos
		./modules

    ../shared-modules/nvidia.nix

		./hardware-configuration.nix
		./packages.nix
	];

  disko.devices.disk.main.device = "/dev/nvme0n1";

  boot.kernelPackages = lib.mkForce pkgs.linuxPackages_zen;
}