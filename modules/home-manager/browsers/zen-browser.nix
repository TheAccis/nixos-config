{
  home.sessionVariables = {
        BROWSER = "zen";
    };

    programs.zen-browser.enable = true;
    programs.zen-browser.policies = {
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
        ExtensionSettings = {
            "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = install
                "https://addons.mozilla.org/firefox/downloads/latest/vimium-ff/latest.xpi";
            "uBlock0@raymondhill.net" = install
                "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
            "{446900e4-71c2-419f-a6a7-df9c091e268b}" = install
                "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
            "newtaboverride@agenedia.com" = install
                "https://addons.mozilla.org/firefox/downloads/latest/new-tab-override/latest.xpi";
            "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}" = install
                "https://addons.mozilla.org/firefox/downloads/latest/styl-us/latest.xpi";
        };
    };
    programs.zen-browser.profiles.${profileName}.settings = {
        "zen.view.use-single-toolbar" = false;
        "zen.view.grey-out-inactive-windows" = false;
        "zen.tabs.vertical.right-side" = true;
        "zen.urlbar.replace-newtab" = false;
        "media.hardwaremediakeys.enabled" = false;
    };
}