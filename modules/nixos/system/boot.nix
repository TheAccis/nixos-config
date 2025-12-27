{ pkgs, ... }:
{
	boot.kernelPackages = pkgs.linuxPackages_latest;

	boot = {
		loader = {
			systemd-boot.enable = true;
			efi.canTouchEfiVariables = true;
		};

		initrd.compressor = "zstd";

		consoleLogLevel = 0;
		kernelParams = [
			"udev.log_level=3"
			"nowatchdog"
			"quiet"
		];
	};
}