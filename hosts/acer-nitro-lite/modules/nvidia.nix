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

		package = config.boot.kernelPackages.nvidiaPackages.stable;
		nvidiaSettings = true;

		powerManagement = {
			enable = true;
			finegrained = false;
		};

		prime = {
			offload.enable = true;
			intelBusId = "PCI:0:2:0";
			nvidiaBusId = "PCI:1:0:0";
		};
	};

	boot.kernelParams = [
		"nvidia-drm.modeset=1"
		
		"nvidia.NVreg_DynamicPowerManagement=0x02" # Динамическое управление питанием
		"nvidia.NVreg_EnableGpuFirmware=1"
		"i915.enable_psr=1" # Panel Self Refresh для Intel
		"i915.enable_fbc=1" # Frame Buffer Compression
		"i915.enable_guc=2" # GuC для лучшего энергосбережения
	];
}