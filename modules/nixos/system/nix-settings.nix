{ config, pkgs, ... }:
{
	system.stateVersion = meta.version;

	nixpkgs.config.allowUnfree = true;
	nix.channel.enable = false;

	nix.settings = {
		experimental-features = [ "nix-command" "flakes" ];

		max-substitution-jobs = 20;
		http-connections = 50;

		download-buffer-size = 536870912; # 512MB

		max-jobs = "auto";
		cores = 0;

		substituters = [
			"https://cache.nixos.org"
			"https://nix-community.cachix.org"
			# "mirror.sjtu.edu.cn"
		];

		trusted-public-keys = [
			"cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
			"nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
		];

		auto-optimise-store = true;
	};

	nix.extraOptions = ''
		eval-cache = true
	'';
}