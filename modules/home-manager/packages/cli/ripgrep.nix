{ meta, pkgs, ... }:
{
	home.packages = with pkgs; [ ripgrep ];
	programs."${meta.apps.shell}".shellAliases = { grep = "rg -i "; };
}