{ meta, pkgs, ... }:
{
  programs.man.enable = false;
  programs.info.enable = false;
  manual.manpages.enable = false;
}