{ ... }:
{
  programs.chromium.extraOpts = {
    AutofillAddressEnabled               = false;
    AutofillCreditCardEnabled            = false;
    PasswordManagerEnabled               = false;
    DefaultBrowserSettingEnabled         = false;
    MetricsReportingEnabled              = false;
    SafeBrowsingExtendedReportingEnabled = false;
  };
}