{ self, inputs, meta, pkgs, ... }:

let
  lib = pkgs.lib;
  hostnamesList = lib.concatStringsSep ", " meta.hostnames;
  hostnamesArray = lib.concatStringsSep " " meta.hostnames;
in
''
  set -euo pipefail

  if [ $# -ne 1 ]; then
    echo "Usage: $0 <hostname>"
    echo "Available hostnames: ${hostnamesList}"
    exit 1
  fi

  hostname="$1"

  found=0
  for h in ${hostnamesArray}; do
    if [ "$h" = "$hostname" ]; then
      found=1
      break
    fi
  done

  if [ \$found -ne 1 ]; then
    echo "Error: Hostname '\$hostname' not found in flake"
    echo "Available hostnames: ${hostnamesList}"
    exit 2
  fi

  echo "🚀 Installing NixOS configuration for host: \$hostname"
  echo "==============================================="

  echo "💾 Running disko (partitioning and mounting disks)..."
  sudo nix --extra-experimental-features "nix-command flakes" \
    run ${inputs.disko.outPath} -- --mode destroy,format,mount --flake "${self}#\$hostname"

  echo "📦 Installing NixOS system..."
  sudo nixos-install --flake "${self}#\$hostname" --no-root-passwd

  echo "==============================================="
  echo "✅ Installation complete!"
  echo "🔧 Reboot with: sudo reboot"
''