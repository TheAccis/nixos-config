let
	locale = "ru_RU";
	fallbackLocale = "en_US";

	encoding = "UTF-8";
in
{
	i18n.defaultLocale = "${locale}.${encoding}";
	i18n.extraLocales = [
		"${locale}.${encoding}/${encoding}"
		"${fallbackLocale}.${encoding}/${encoding}"
	];
	i18n.extraLocaleSettings = {
		LC_ALL = "${locale}.${encoding}";
	};
}