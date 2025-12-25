{ meta, ... }:
{
	home.packages = with pkgs; [ fd ];
	programs."${meta.apps.shell}".shellAliases = { find = "fd"; };
}