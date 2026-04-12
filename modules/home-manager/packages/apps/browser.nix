{ meta, ... }:
{
	home.sessionVariables = {
		BROWSER = "chromium";
	};

	programs.chromium = {
		enable = true;

		extensions = [
			{ id = "ddkjiahejlhfcafbddmgiahcphecmpfh"; } # uBlock Origin Lite
			{ id = "nngceckbapebfimnlniiiahkandclblb"; } # Bitwarden
			{ id = "eimadpbcbfnmbkopoojfekhnkhdbieeh"; } # Dark Reader
		];

		commandLineArgs = [
			"--lang=${meta.locale.short}"
			"--no-default-browser-check"
			"--no-first-run"

			"--ozone-platform-hint=auto"

			"--enable-features=WaylandWindowDecorations,WebRTCPipeWireCapturer,VaapiVideoDecodeLinuxGL,ParallelDownloading"

			"--enable-accelerated-video-decode"

			"--enable-gpu-rasterization"
			"--enable-zero-copy"

			"--disable-sync"
			"--disable-background-networking"
			"--disable-client-side-phishing-detection"

			"--password-store=basic"
			"--disk-cache-size=209715200"
		];
	};

	xdg.desktopEntries."chromium-browser" = {
		name = "Web-browser";
		genericName = "Web-browser";
		exec = "chromium %U";
		icon = "chromium";
		terminal = false;
		categories = [ "Network" "WebBrowser" ];
		mimeType = [
			"text/html"
			"text/xml"
			"application/xhtml+xml"
			"x-scheme-handler/http"
			"x-scheme-handler/https"
		];
		settings = {
			StartupNotify = "true";
			StartupWMClass = "chromium";
		};
	};
}