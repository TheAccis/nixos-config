let
	install = url: {
		install_url = url;
		installation_mode = "force_installed";
	};
in
{
	home.sessionVariables = {
		BROWSER = "zen";
	};
	
	programs.zen-browser.enable = true;
	
	programs.zen-browser.policies = {
		ExtensionSettings = {
			"langpack-ru@firefox.mozilla.org" = install
				"addons.mozilla.org";

			"uBlock0@raymondhill.net" = install
				"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
				
			"{446900e4-71c2-419f-a6a7-df9c091e268b}" = install
				"https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
				
			"addon@darkreader.org" = install
				"https://addons.mozilla.org/en-US/firefox/addon/darkreader/latest.xpi";
		};

		RequestedLocales = ["ru"];
		
		AutofillAddressEnabled = false;
		AutofillCreditCardEnabled = false;
		DisableAppUpdate = true;
		DisableFeedbackCommands = true;
		DisableFirefoxStudies = true;
		DisablePocket = true;
		DisableTelemetry = true;
		DontCheckDefaultBrowser = true;
		NoDefaultBookmarks = true;
		OfferToSaveLogins = false;
		EnableTrackingProtection = {
			Value = true;
			Locked = true;
			Cryptomining = true;
			Fingerprinting = true;
		};
	};

	programs.zen-browser.profiles.default = {
		id = 0;
		name = "Default";
		isDefault = true;
		settings = {
			"zen.view.grey-out-inactive-windows" = false;
			"media.hardwaremediakeys.enabled" = false;
			"browser.shell.checkDefaultBrowser" = false;

			"intl.accept_languages" = "ru-ru, ru, en-us, en";
			"intl.locale.requested" = "ru";
		};
	};

  xdg.desktopEntries."zen-twilight" = {
    name = "Zen Browser";
    genericName = "Web Browser";
    exec = "zen-twilight --name zen %U";
    icon = "zen-twilight";
    terminal = false;
    categories = [ "Network" "WebBrowser" ];
    mimeType = [
      "text/html"
      "text/xml"
      "application/xhtml+xml"
      "application/vnd.mozilla.xul+xml"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
    ];
    settings = {
      StartupNotify = "true";
      StartupWMClass = "zen";
    };
	};
}