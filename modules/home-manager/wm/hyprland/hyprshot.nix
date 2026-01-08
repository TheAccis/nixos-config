{ pkgs, ... }:
{
  home.packages = [ pkgs.hyprshot ];

  wayland.windowManager.hyprland.settings.bind = [];
}