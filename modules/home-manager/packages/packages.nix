{ pkgs, ... }:
{
	home.packages = with pkgs;
  [
		# Desktop apps
    (pkgs.bottles.override { removeWarningPopup = true; })
		telegram-desktop
		pwvucontrol
		fragments
		resources
		#pinta
		#mpv

		# CLI utils
		wl-clipboard
		microfetch
		grimblast
		cliphist
		ripgrep
		killall
		p7zip
		tree
		wget
		fd

		libnotify
	];
}