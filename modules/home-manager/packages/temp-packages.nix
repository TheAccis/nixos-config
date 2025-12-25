{
	programs.zsh.shellAliases = {
		nix-tree = "nix run nixpkgs#nix-tree";
	};

	xdg.desktopEntries."usb-imager-temporary" = {
		name = "USB Imager (Temp)";
		exec = "sh -c \"nix run nixpkgs#usbimager\""; 
		icon = "drive-removable-media";
		terminal = false;
		categories = [ "Utility" ];
	};
}