{ inputs, ... }:
{
	imports = [ inputs.nix-flatpak.nixosModules.nix-flatpak ];

	services.flatpak = {
		enable = true;

		packages = [
			"ch.tlaun.TL"
		];

		remotes = [
			{
				name = "flathub";
				location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
			}
		];

		overrides = {
			"ch.tlaun.TL" = {
				Environment = {
					TL_BOOTSTRAP_OPTIONS = "-Dtl.useForce"; 
				};
			};
		};
	};
}