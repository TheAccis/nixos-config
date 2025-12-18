{ caelestia-shell, zen-browser, nix-flatpak, stylix, pkgs, meta, lib, ... }: 
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

    ./packages.nix
  ];

  home = {
    username = meta.user;
    homeDirectory = "/home/${meta.user}";
    stateVersion = meta.version;
  };
}