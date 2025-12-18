{ config, lib, pkgs, ... }:
{
	# Available wm: hyprland
	wm = "hyprland";

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
	];
}