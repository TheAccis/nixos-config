{ caelestia-shell, zen-browser, nix-flatpak, stylix, version, pkgs, meta, user, lib, ... }: 
{
  imports = [
    caelestia-shell.homeManagerModules.default
    zen-browser.homeModules.twilight
    nix-flatpak.nixosModules.nix-flatpak
    stylix.homeModules.stylix

    ./packages
    ./browsers
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