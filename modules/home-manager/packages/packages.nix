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
    usbimager
		#pinta
		#mpv

		# CLI utils
		wl-clipboard
		microfetch
		hyprpicker
		grimblast
		cliphist
		nix-tree
		ripgrep
		killall
		p7zip
		tree
		wget
		fd
		jq

		libnotify
	];
}