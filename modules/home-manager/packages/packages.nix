{ meta, pkgs, ... }:
{
	home.packages = with pkgs;
	[
		# Desktop apps
		meta.apps.torrent-client.pkg
		meta.apps.archiver.pkg
		telegram-desktop
		pwvucontrol
		resources
		#obsidian
		lutris
		#pinta
		#mpv

		# CLI utils
		wl-clipboard
		appimage-run
		cliphist
		p7zip

		libnotify
	];
}