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
	
	programs.zen-browser = {
		enable = true;

		policies = {
			ExtensionSettings = {
				"uBlock0@raymondhill.net" = install
					"https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
				"{446900e4-71c2-419f-a6a7-df9c091e268b}" = install
					"https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
				"addon@darkreader.org" = install
					"https://addons.mozilla.org/en-US/firefox/addon/darkreader/latest.xpi";
			};
		
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

		profiles.default = {
			id = 0;
			name = "Default";
			isDefault = true;
			settings = {
				"zen.view.grey-out-inactive-windows" = false;
				"media.hardwaremediakeys.enabled" = false;
				"browser.shell.checkDefaultBrowser" = false;
			};
		};
	};
}