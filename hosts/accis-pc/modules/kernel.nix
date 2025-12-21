{ lib, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_zen;
}