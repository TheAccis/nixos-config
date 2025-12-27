{
	imports = [
		../../modules/nixos
		./modules

		./hardware-configuration.nix
		./packages.nix
	];

  disko.devices.disk.main.device = "/dev/nvme0n1";

  services.blueman.enable = true;
}