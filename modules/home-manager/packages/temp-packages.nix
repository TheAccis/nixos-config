{ meta, lib, ... }:
let
  temp-cli-pkgs = [ "nix-tree" "tree" ];
  emoji = "⏳";
in
{
	programs."${meta.apps.shell}".initContent = lib.concatLines
    (map (x: "function ${x}() { nix-shell -p ${x} --run \"${x} $1\" }") temp-cli-pkgs);
  
	xdg.desktopEntries."usb-imager" = {
		name = "${emoji} USB Imager";
		exec = "sh -c \"nix run nixpkgs#usbimager\""; 
		icon = "drive-removable-media";
		terminal = false;
		categories = [ "Utility" ];
	};

	xdg.desktopEntries."speedtest" = {
		name = "${emoji} Speedtest";
		exec = "sh -c \"nix run nixpkgs#speedtest\""; 
		icon = "speedometer";
		terminal = false;
		categories = [ "Network" ];
	};
}