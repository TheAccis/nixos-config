{ pkgs, ... }:
{
	home.packages = with pkgs;
	[
		# Desktop apps
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
		grimblast
		cliphist
		killall
		p7zip

		libnotify
	];

	home.file.".local/share/lutris/runners/wine/proton-ge".source = "${pkgs.proton-ge-bin}";
}