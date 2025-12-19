{ modules, pkgs, meta, lib, ... }: 
{
  imports = [
    modules.caelestia-shell.homeManagerModules.default
    modules.zen-browser.homeModules.twilight
    modules.nix-flatpak.homeManagerModules.nix-flatpak
    modules.stylix.homeModules.stylix

    meta.lib-modules.home

    ./browsers
    ./flatpak
    ./desktop
    ./gaming
    ./shells
    ./style
    ./apps
    ./dev

    ./wm/${meta.wm}

    ./packages.nix
  ];

  home = {
    username = meta.user;
    homeDirectory = "/home/${meta.user}";
    stateVersion = meta.version;
  };
}