{ config, inputs, pkgs, ... }:
{
	imports = [ inputs.aagl.nixosModules.default ];
	programs.sleepy-launcher.enable = true;

	documentation = {
		enable = false;
		dev.enable = false;
		doc.enable = false;
		man.enable = false;
		info.enable = false;
		nixos.enable = false;
	};

	environment.systemPackages = with pkgs;
	[
		ntfs3g
		udisks
		git
	];
}