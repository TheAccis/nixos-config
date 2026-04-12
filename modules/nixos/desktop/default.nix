{ meta, ... }:
{
	imports = [
		./wm/${meta.wm.name}.nix
		./environment.nix
		./services.nix
		./users.nix
	];
}