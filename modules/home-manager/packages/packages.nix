{ meta, pkgs, ... }:
{
	home.packages = with pkgs;
	[
		# Desktop apps
		meta.apps.torrent-client.pkg
		meta.apps.archiver.pkg
		gpu-screen-recorder
		telegram-desktop
		mission-center
		pwvucontrol
		obsidian
		#pinta
		#mpv

		# CLI utils
		wl-clipboard
		appimage-run
        microfetch
		cliphist
		p7zip
        tree

		libnotify
	];
}