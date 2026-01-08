{ meta, pkgs, ... }:
{
	home.packages = with pkgs;
	[
		# Desktop apps
    meta.apps.screenshot-app.pkg
		meta.apps.torrent-client.pkg
		meta.apps.archiver.pkg
		telegram-desktop
		pwvucontrol
		resources
		#obsidian
		#pinta
		#mpv

		# Windows gaming
		wineWowPackages.staging
		winetricks
		lutris

		# CLI utils
		wl-clipboard
		appimage-run
		microfetch
		cliphist
		killall
		p7zip

		libnotify
	];

	#home.file.".local/share/lutris/runners/wine/proton-ge".source = "${pkgs.proton-ge-bin}";
}