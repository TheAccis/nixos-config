{ caelestia-shell, zen-browser, nix-flatpak, stylix, version, pkgs, meta, user, lib, ... }: 
{
  imports = [
    caelestia-shell.homeManagerModules.default
    zen-browser.homeModules.twilight
    nix-flatpak.homeManagerModules.nix-flatpak
    stylix.homeModules.stylix

    ./browsers
    ./flatpak
    ./desktop
    ./gaming
    ./shells
    ./style
    ./apps
    ./dev

    ./wm/${meta.wm}
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = version;
  };
}