{ ... }:
{
  home.sessionVariables = {
    BROWSER = "chromium";
  };

  programs.chromium = {
    enable = true;

    # Расширения ставятся по ID из Chrome Web Store
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # uBlock Origin
      { id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
      { id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
    ];

    commandLineArgs = [
      "--lang=ru"
      "--no-default-browser-check" # DontCheckDefaultBrowser
    ];
  };

  xdg.desktopEntries."chromium-browser" = {
    name        = "Chromium";
    genericName = "Веб-браузер";
    exec        = "chromium --name chromium %U";
    icon        = "chromium";
    terminal    = false;
    categories  = [ "Network" "WebBrowser" ];
    mimeType    = [
      "text/html"
      "text/xml"
      "application/xhtml+xml"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
    ];
    settings = {
      StartupNotify   = "true";
      StartupWMClass  = "chromium";
    };
  };
}