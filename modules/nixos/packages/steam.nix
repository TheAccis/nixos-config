{ config, pkgs, ... }:
{
	programs.steam = {
		enable = true;
		gamescopeSession.enable = true;

		# extraCompatPackages = with pkgs; [ proton-ge-bin ];
	};

	programs.gamemode = {
		enable = true;
		enableRenice = true;
    
		settings = {
			general.renice = 20;
		};
	};

	environment.systemPackages = with pkgs; [
		gamescope
	];
}