{ config, ... }:
let
	package-name = "ch.tlaun.TL";
	config-path = ".var/app/${package-name}/config/tl.properties";
	config-content = ''
		bootstrap.switchToBeta=false
		client=2523222e-dde8-4715-92e5-bd963e2b54a4
		connection.ssl=true
		experiments.available=zgc_generational;tenuring;max_xms;updated_lwjgl;updated_jna
		experiments.enabled=none
		gui.alerton.modified=false
		gui.alerton.release=false
		gui.alerton.snapshot=false
		gui.direction.loginform=center
		gui.font=12
		gui.font.old=12
		gui.laf.v1.state=auto
		gui.logger=none
		gui.logger.fullcommand=false
		gui.logger.height=500
		gui.logger.width=720
		gui.logger.x=30
		gui.logger.y=30
		gui.notices.enabled=false
		gui.size=894;1150
		locale=ru_RU
		login.account=Accis
		login.account.type=plain
		login.version=ForgeOptiFine 1.16.5
		minecraft.crash=false
		minecraft.fullscreen=true
		minecraft.gamedir.separate=version
		minecraft.gamemode=true
		minecraft.gpu=DISCRETE
		minecraft.improvedargs=true
		minecraft.improvedargs.type=DEFAULT
		minecraft.jre.change-trust-store=false
		minecraft.jre.type=recommended
		minecraft.mods.removeUndesirable=true
		minecraft.onlaunch=hide
		minecraft.servers.promoted=true
		minecraft.servers.promoted.ingame=true
		minecraft.size=925;530
		minecraft.versions.launcher=false
		minecraft.versions.modified=true
		minecraft.versions.old_alpha=false
		minecraft.versions.old_beta=false
		minecraft.versions.only-installed=false
		minecraft.versions.pending=false
		minecraft.versions.release=true
		minecraft.versions.snapshot=false
		minecraft.versions.sub.old_release=false
		minecraft.versions.sub.remote=true
		minecraft.xmx=10240
		notice.enabled=false
		notice.promoted=true
		settings.version=3
	'';
in 
{
	services.flatpak = {
		packages = [ package-name ];

		overrides."${package-name}".Environment = {
			TL_BOOTSTRAP_OPTIONS = "-Dtl.useForce"; 
		};
	};

	home.activation.createTlProperties = 
	let
		content-file = builtins.toFile "tl.properties" config-content;
	in
	config.lib.dag.entryAfter ["writeBoundary"] ''
		$DRY_RUN_CMD mkdir -p "$HOME/${dirOf config-path}"
		$DRY_RUN_CMD cp -f "${content-file}" "$HOME/${config-path}"
		$DRY_RUN_CMD chmod 644 "$HOME/${config-path}"
	'';
}