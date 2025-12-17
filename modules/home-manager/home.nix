{ caelestia-shell, stylix, version, pkgs, user, lib, ... }: {
  imports = [
    caelestia-shell.homeManagerModules.default
    stylix.homeModules.stylix

    ./apps
    ./desktop
    ./dev
    ./gaming
    ./shells
    ./style

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