{ pkgs, ... }:
{
	imports = [
		../../modules/nixos

		../shared-modules/nvidia.nix
		../shared-modules/tlp.nix

		./hardware-configuration.nix
	];

	disko.devices.disk.main.device = "/dev/nvme0n1";

  networking.interfaces.en45s0.wakeOnLan.enable = false;

	services.blueman.enable = true;

	hardware.nvidia = {
		powerManagement.finegrained = true;
		prime = {
			offload.enable = true;
			offload.enableOffloadCmd = true;
			
			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:1:0:0";
		};
	};

	environment.systemPackages = with pkgs; 
  [
    brightnessctl
    powertop
  ];
}