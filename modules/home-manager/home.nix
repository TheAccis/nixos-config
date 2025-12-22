{ modules, pkgs, meta, lib, ... }: 
{
  imports = [
    modules.caelestia-shell.homeManagerModules.default
    modules.zen-browser.homeModules.twilight
    modules.stylix.homeModules.stylix

    meta.lib-modules.home

    ./browsers
    ./desktop
    ./gaming
    ./shells
    ./style
    ./apps
    ./dev

    ./wm/${meta.wm.name}

    ./packages.nix
  ];

  home = {
    username = meta.user;
    homeDirectory = "/home/${meta.user}";
    stateVersion = meta.version;
  };
}