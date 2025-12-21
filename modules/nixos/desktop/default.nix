{ meta, ... }:
{
	imports = [
		./environment.nix
		./{meta.wm}.nix
		./services.nix
		./users.nix
    ./java.nix
	];
}