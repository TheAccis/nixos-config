{ meta, ... }:
{
	imports = [
		./wm/${meta.wm.name}.nix
		./environment.nix
		./syncthing.nix
		./services.nix
		./users.nix
	];
}