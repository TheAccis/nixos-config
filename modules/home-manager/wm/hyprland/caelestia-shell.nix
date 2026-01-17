{ meta, lib, ... }:
{
	# Caelestia has its own wallpaper service
	services.hyprpaper.enable = lib.mkForce false;

	# Caelestia has its own notifications service
	services.swaync.enable = lib.mkForce false;

	# Caelestia has its own lockapp
	programs.hyprlock.enable = lib.mkForce false;

	programs.caelestia = {
		enable = true;
		systemd.enable = true;

		settings = {
			paths.wallpaperDir = "~/${meta.dirs.wallpapers}";
		};

		cli = {
			enable = true;
			settings = {
				theme.enableGtk = true;
				background.enabled = false;
			};
		};
	};

	wayland.windowManager.hyprland.settings = {
		bind = [
			"$main-button, R, global, caelestia:launcher"
			", Print, global, caelestia:screenshot"
		];
	};
}