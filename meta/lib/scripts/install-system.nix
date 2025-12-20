{ self, inputs, meta, pkgs, ... }:
let
  lib = pkgs.lib;
  hostnamesList = lib.concatStringsSep ", " meta.hostnames;
  # Более надежное определение disko пакета
  diskoPkg = inputs.disko.packages.${pkgs.system}.disko or inputs.disko.defaultPackage.${pkgs.system};
in
''
  #!/usr/bin/env bash

  set -euo pipefail

  if [ $# -ne 1 ]; then
    echo "Usage: $0 <hostname>"
    echo "Available hostnames: ${hostnamesList}"
    exit 1
  fi

  hostname="$1"
  valid_hostname="false"

  # Упрощенная и более надежная проверка хостнейма
  case "$hostname" in
    ${lib.concatStringsSep "|" meta.hostnames})
      valid_hostname="true"
      ;;
    *)
      echo "Error: Hostname '$hostname' not found in flake"
      echo "Available hostnames: ${hostnamesList}"
      exit 2
      ;;
  esac

  echo "🚀 Installing NixOS configuration for host: $hostname"
  echo "==============================================="

  echo "💾 Running disko (partitioning and mounting disks)..."
  sudo nix --experimental-features "nix-command flakes" \
    run ${diskoPkg} -- --mode destroy,format,mount --flake "${self}#${hostname}"

  echo "📦 Installing NixOS system..."
  sudo nixos-install --flake "${self}#${hostname}" --no-root-passwd

  echo "==============================================="
  echo "✅ Installation complete!"
  echo "🔧 Reboot with: sudo reboot"
''