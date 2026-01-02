{ config, inputs, pkgs, ... }:
{
	documentation = {
		enable = false;
		doc.enable = false;
		man.enable = false;
		info.enable = false;
	};

	environment.systemPackages = with pkgs; 
	[
    bubblewrap
		ntfs3g
		udisks
		git
	];
}