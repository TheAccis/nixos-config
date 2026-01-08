{ meta, pkgs, ... }:
{
	home.packages = with pkgs;
	[
		# Desktop apps
    meta.apps.screenshot-app.pkg
		telegram-desktop
		mate.engrampa
		pwvucontrol
		fragments
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

	home.file.".local/share/lutris/runners/wine/proton-ge".source = "${pkgs.proton-ge-bin}";
}