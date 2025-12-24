{ modules, pkgs, meta, lib, ... }: 
{
  imports = [
    modules.caelestia-shell.homeManagerModules.default
    modules.zen-browser.homeModules.twilight
    modules.stylix.homeModules.stylix

    meta.lib-modules.home

    ./packages
    ./desktop
    ./shells
    ./style

    ./wm/${meta.wm.name}
  ];

  home = {
    username = meta.user;
    homeDirectory = "/home/${meta.user}";
    stateVersion = meta.version;
  };
}