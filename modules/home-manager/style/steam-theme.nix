{ pkgs, lib, ... }:

let
	steam-adwaita-src = pkgs.fetchFromGitHub {
		owner = "Foldex";
		repo = "Adwaita-for-Steam";
		rev = "b4c68027322205f6d90e06e5f9d136790efe4d4e";
		sha256 = "sha256-1HoNpst/JTKN2NyQjXfgqUvU74DyLzrVpDuqOKOj34I="; 
	};
in
{
  home.activation.install-steam-theme = lib.hm.dag.entryAfter ["writeBoundary"] ''
    STEAM_DIR="$HOME/.local/share/Steam"
    
    if [ -d "$STEAM_DIR" ]; then
      TEMP_DIR=$(mktemp -d)
      cp -r ${steam-adwaita-src}/* $TEMP_DIR/
      chmod -R +w $TEMP_DIR
      
      cd $TEMP_DIR
      ${pkgs.python312}/bin/python3 install.py \
        --target "$STEAM_DIR" \
        --windowcontrols-layout gnome \
        --color-theme adwaita
      
      rm -rf "$TEMP_DIR"
    else
      echo "Steam directory not found, skipping theme installation."
    fi
  '';
}