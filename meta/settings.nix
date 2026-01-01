{ config, lib, pkgs, ... }:
rec {
	# Home path
	home = "/home/${user}";

	# NixOS config path
	config-path = "${home}/nixos-config";

	# Available wm: hyprland
	wm.name = "hyprland";

	# Locale
	locale = {
		default = "ru_RU";
		fallback = "en_US";
		encoding = "UTF-8";
	};

	# System architecture
	system = pkgs.stdenv.hostPlatform.system;

	# NixOS branch
	version = "25.11";

	# Username
	user = "accis";

	# Hosts
	hostnames = [
		"acer-nitro-lite"
		"accis-pc"
	 	"msi-gf63"
		"vm"
	];
}