{ config, pkgs, meta, ... }:
{
	home.packages = with pkgs; [
    nemo-with-extensions
	];
}