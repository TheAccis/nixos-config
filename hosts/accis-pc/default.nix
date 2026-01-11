{ pkgs, meta, lib, ... }:
{
	imports = [
		../../modules/nixos

		# ../shared-modules/virt-manager.nix
		../shared-modules/nvidia.nix
		../shared-modules/java.nix

		./hardware-configuration.nix
	];

	disko.devices.disk.main.device = "/dev/nvme0n1";

	boot.kernelPackages = lib.mkForce pkgs.linuxPackages_zen;

	# home-manager.users.${meta.user} = {
	# 	services.flatpak.packages = [ "io.github.glaumar.QRookie" ];
	# };
}