{ pkgs, ... }:
{
	home.packages = with pkgs;
	[
		# Desktop apps
		(pkgs.bottles.override { removeWarningPopup = true; })
		telegram-desktop
    appimage-run
		pwvucontrol
		fragments
		resources
	 	obsidian
		#pinta
		#mpv

		# CLI utils
		wl-clipboard
		microfetch
		grimblast
		cliphist
		killall
		p7zip

		libnotify
	];
}