{
	imports = [
		../../modules/nixos
    
		./hardware-configuration.nix
		./packages.nix
		./disko.nix
	];

  virtualisation.qemuGuest.enable = true;
}