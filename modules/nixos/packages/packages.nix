{ config, inputs, pkgs, ... }:
{
	imports = [ inputs.aagl.nixosModules.default ];

	documentation = {
		enable = false;
		dev.enable = false;
		doc.enable = false;
		man.enable = false;
		info.enable = false;
		nixos.enable = false;
	};

	programs.gpu-screen-recorder.enable = true;

	environment.systemPackages = with pkgs;
	[
		ntfs3g
		udisks
		git
	];
}