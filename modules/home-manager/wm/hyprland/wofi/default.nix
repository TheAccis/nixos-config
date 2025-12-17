{ pkgs, ... }:
{
	programs.wofi.enable = true;
	programs.wofi.settings = {
		allow_markup = true;
		allow_images = true;
		width = 350;
		height = 450;
	};

	home.file.".config/wofi/style.css".source = ./style.css;

	home.packages = with pkgs; [

		(writeShellScriptBin "apps_menu" ''exec wofi --show drun --prompt "Выберите приложение:"'')

		(writeShellScriptBin "apps_menu_extended" ''
			CHOICE=$(echo -e "Использовать iGPU\nИспользовать dGPU" | wofi -d --prompt "Выберите GPU:")

			if [ -z "$CHOICE" ]; then
				exit 0
			fi

			APP_CMD=$(wofi --show drun --prompt "Выберите приложение:")

			if [ -n "$APP_CMD" ]; then
				if [ "$CHOICE" == "Использовать dGPU" ]; then
					exec env \
						__NV_PRIME_RENDER_OFFLOAD=1 \
						__GLX_VENDOR_LIBRARY_NAME=nvidia \
						__VK_LAYER_NV_optimus=NVIDIA_only \
						env -u WAYLAND_DISPLAY \
						"$APP_CMD" &
				else
					exec "$APP_CMD" &
				fi
			fi
		'')
	];
}