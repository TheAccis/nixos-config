{
  services.sing-box = {
    enable = true;
    settings = builtins.fromJSON (builtins.readFile ./finland.json);
  };
}