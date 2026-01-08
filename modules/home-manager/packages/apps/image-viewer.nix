{ config, meta, pkgs, ... }:
{
	home.packages = with pkgs; [ qview ];

	meta.lib.home.mutable-file."${config.xdg.configHome}/qView/qView.conf".text = ''
[General]
firstlaunch=true
  '';
}