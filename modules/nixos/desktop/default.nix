{ meta, ... }:
{
	imports = [
		./environment.nix
		./wm/${meta.wm.name}.nix
		./services.nix
		./users.nix
    ./java.nix
	];
}