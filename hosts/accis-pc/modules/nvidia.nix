{ config, pkgs, ... }:
{
	nixpkgs.config.nvidia.acceptLicense = true;

	services.xserver.enable = false;
	services.xserver.videoDrivers = [ "nvidia" ];

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
		extraPackages = with pkgs; [
			nvidia-vaapi-driver
			libva-vdpau-driver
			libvdpau-va-gl
		];
	};

	hardware.nvidia = {
		open = false;
		modesetting.enable = true;
		
		#package = config.boot.kernelPackages.nvidia_x11_legacy535;
		package = config.boot.kernelPackages.nvidiaPackages.stable;
		nvidiaSettings = true;

		powerManagement = {
			enable = true;
			finegrained = false;
		};
	};

	boot.kernelParams = [
		"nvidia-drm.modeset=1"
		"nvidia.NVreg_PreserveVideoMemoryAllocations=1"
	];
}