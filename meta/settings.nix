{ config, lib, pkgs, ... }:
rec {
  config-path = "/home/${user}/nixos-config";

	# Available wm: hyprland
	wm = "hyprland";

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
    "vm"
	];
}