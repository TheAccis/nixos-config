{ meta, ... }: 
{
  programs.nh = {
    enable = true;
    flake = meta.config-path;
  };
}