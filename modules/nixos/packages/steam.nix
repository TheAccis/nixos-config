{ pkgs, ... }:
{
	programs.steam = {
		enable = true;

		extraCompatPackages = with pkgs; [ proton-ge-bin ];

		gamescopeSession.enable = true;
	};

	programs.gamemode = {
		enable = true;
		enableRenice = true;
		settings = {
			general.renice = 20;
		};
	};

	environment.systemPackages = with pkgs; [
		(mangohud.override { lowerBitnessSupport = true; })
		gamescope
	];
}