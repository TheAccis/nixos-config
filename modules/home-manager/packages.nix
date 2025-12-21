{ pkgs, ... }:
{
	home.packages = with pkgs; [
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
		brightnessctl
		wl-clipboard
		vulkan-tools
		hyprpicker
		microfetch
		grimblast
		cliphist
		nix-tree
		ripgrep
		killall
		ntfs3g
		udisks
		unzip
		unrar
		tree
		wget
		zip
		fd
		jq

		# WM stuff
		xdg-desktop-portal-hyprland
		xdg-desktop-portal-gtk
		quickshell
		libnotify

		# Other
		google-cursor
	];
}