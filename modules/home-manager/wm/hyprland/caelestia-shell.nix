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
			idle.lockBeforeSleep = true;
			idle.timeouts = [
				{
					timeout = 3600000;
					action = "lock";
				}
			];

			paths.wallpaperDir = "~/${meta.dirs.wallpapers}";
		};

		cli = {
			enable = true;
			settings = {
				theme.enableGtk = true;
			};
		};
	};
}