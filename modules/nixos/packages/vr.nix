{ meta, config, pkgs, lib, ... }:

{
	services.wivrn = {
		enable = true;
		openFirewall = true;
		config = {
			encoder = [
				{
					encoder = "nvenc";
					codec   = "h265";
					bitrate = 50000000;
					width   = 1.0;
					height  = 1.0;
				}
			];
		};
	};

	environment.systemPackages = with pkgs; [
		wlx-overlay-s
		android-tools
		openxr-loader
	];

	users.users."${meta.user}" = {
		extraGroups = [ "video" "render" "input" "plugdev" ];
	};

	users.groups.plugdev = {};

	services.udev.extraRules = ''
		SUBSYSTEM=="usb", ATTR{idVendor}=="2833", MODE="0660", GROUP="plugdev"
	'';

	networking.firewall = {
		allowedTCPPorts = [ 9757 ];
		allowedUDPPorts = [ 9757 5353 ];
	};

	environment.sessionVariables = {
		WAYLAND_DISPLAY = "wayland-1";
		XDG_RUNTIME_DIR = "/run/user/1000";
	};
}