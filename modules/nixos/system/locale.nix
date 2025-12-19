{ meta, ... }:
{
	i18n.defaultLocale = "${meta.locale.default}.${meta.locale.encoding}";
	i18n.extraLocales = [
		"${meta.locale.default}.${meta.locale.encoding}/${meta.locale.encoding}"
		"${meta.locale.fallback}.${meta.locale.encoding}/${meta.locale.encoding}"
	];
	i18n.extraLocaleSettings = {
		LC_ALL = "${meta.locale.default}.${meta.locale.encoding}";
	};
}