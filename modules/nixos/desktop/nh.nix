{ meta, ... }: 
{
  programs.nh = {
    enable = true;
    flake = "/home/${meta.user}/nixos-config";
  };
}