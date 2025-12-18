{ inputs, ... }:
{
	imports = [ inputs.home-manager.nixosModules.default ];

	services.gvfs.enable = true;
	services.tumbler.enable = true;

	services.flatpak.enable = true;
}