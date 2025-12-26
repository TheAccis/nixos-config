{ config, pkgs, ... }:
{
	nixpkgs.config.nvidia.acceptLicense = true;

	services.xserver.enable = false;
	services.xserver.videoDrivers = [ "nvidia" ];

	boot.blacklistedKernelModules = [ "nouveau" "nova_core" ];

	hardware.graphics = {
		enable = true;
		enable32Bit = true;
		extraPackages = with pkgs; [
			nvidia-vaapi-driver
			libva
			libva-utils
		];
	};

	environment.variables = {
		LIBVA_DRIVER_NAME = "nvidia";
		GBM_BACKEND = "nvidia-drm";
		__GLX_VENDOR_LIBRARY_NAME = "nvidia";
		WLR_NO_HARDWARE_CURSORS = "1";
	};

	hardware.nvidia = {
		open = false;
		modesetting.enable = true;

		package = config.boot.kernelPackages.nvidiaPackages.stable;
		nvidiaSettings = true;

		powerManagement = {
			enable = true;
			finegrained = true;
		};

		prime = {
			offload.enable = true;
			offload.enableOffloadCmd = true;
			
			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:1:0:0";
		};
	};

	boot.kernelParams = [
		"nvidia-drm.modeset=1"
		"nvidia.NVreg_EnableGpuFirmware=1"
	];
}