{ meta, ... }:
let
  default = "${meta.locale.default}.${enc}";
  fallback = "${meta.locale.fallback}.${enc}";
  enc = meta.locale.encoding;
in
{
	i18n.defaultLocale = default;
	i18n.extraLocales = [
		"${default}/${enc}"
		"${fallback}/${enc}"
	];
	i18n.extraLocaleSettings = {
    LC_MESSAGES = default;
		LC_ALL = default;
    LANG = default;
	};

  environment.sessionVariables = {
    LC_ALL = default;
    LANG = default;
  };
}