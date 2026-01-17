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
			"vt.global_cursor_default=0"
			"udev.log_level=3"
			"nowatchdog"
			"quiet"
		];
	};
}