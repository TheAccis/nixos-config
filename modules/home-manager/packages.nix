{ pkgs, zen-browser, ... }:
{
	home.packages = with pkgs; [
		# Desktop apps
		bitwarden-desktop
		telegram-desktop
		zen-browser
		pwvucontrol
		qbittorrent
		resources
  	kdiskmark
		#pinta
		v2rayn
		qview
		#mpv

		# CLI utils
		brightnessctl
		wl-clipboard
		vulkan-tools
		hyprpicker
		microfetch
		mesa-demos
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

		# WM stuff
		xdg-desktop-portal-hyprland
		xdg-desktop-portal-gtk
		quickshell
		libnotify

		# Other
		google-cursor
	];
}