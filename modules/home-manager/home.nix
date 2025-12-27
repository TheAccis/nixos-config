{ modules, pkgs, meta, lib, ... }: 
{
  imports = [
    modules.caelestia-shell.homeManagerModules.default
    modules.nix-flatpak.homeManagerModules.nix-flatpak
    modules.zen-browser.homeModules.twilight
    modules.stylix.homeModules.stylix

    meta.lib-modules.home

    ./packages
    ./desktop
    ./style

    ./shells/${meta.apps.shell}.nix
    ./wm/${meta.wm.name}
  ];

  home = {
    username = meta.user;
    homeDirectory = meta.home;
    stateVersion = meta.version;
  };
}