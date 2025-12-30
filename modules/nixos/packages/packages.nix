{ config, inputs, pkgs, ... }:
{
  programs.throne = {
    enable = true;
    tunMode.enable = true;
    tunMode.setuid = true;
  };

	documentation = {
		enable = false;
		doc.enable = false;
		man.enable = false;
		info.enable = false;
	};

	environment.systemPackages = with pkgs; 
	[
		ntfs3g
		udisks
		git
	];
}