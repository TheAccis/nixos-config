{ caelestia-shell, zen-browser, stylix, version, pkgs, user, lib, ... }: 
{
  imports = [
    caelestia-shell.homeManagerModules.default
    zen-browser.homeModules.twilight
    stylix.homeModules.stylix

    ./apps
    ./desktop
    ./dev
    ./gaming
    ./shells
    ./style
    ./browsers

    # TODO: Move wm choice to meta
    ./wm/hyprland

    ./packages.nix
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = version;
  };
}